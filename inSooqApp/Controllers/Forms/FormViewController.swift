//
//  FormViewController.swift
//  inSooqApp
//
//  Created by Deya on 05/04/2022.
//

import Foundation
import DropDown
import PhotosUI
import UniformTypeIdentifiers

enum FormValidationError: String {
    case userShouldAgreeError = "User Should Agree"
    case shouldFillForm = "Please fill all the fields"
    case shouldPickLocation = "Please pick a location"
    case shouldSelectPhoto = "Please select at least a one photo"
    case shouldSelectFile = "Please select file"
    case incorrectYear = "Year is not valid"
    case incorrectPrice = "Price is not valid (max is 10,000,000)"
    case incorrectMilage = "Milage is not valid (max is 99,999)"
    case incorrectPhone = "Phone is not valid"
    
    case none
}

enum AdMainType: Int {
    case motor = 1
    case job = 3
    case numbers = 7
    case electronics = 8
    case classified = 6
    case services = 4
    case business = 5
    case none = 0
}

enum PackageStatus : Int {
    case underReview = 1
    case active = 2

    var description: String {
        switch self {
        case .underReview: return "Under Review"
        case .active: return "Active"
        }
    }
    
}

class FormViewController: UIViewController {
    
    var stackView = UIStackView()
    var scrollView = UIScrollView()

    var formDarkGray = UIColor.darkGray
    var formLightGray = UIColor.lightGray

    var offset: CGFloat = 8
    var formElements = [UIView]()
    
    var images = [UIImage]()
    var imagesNames = [String]()

    var locationLatitude: Double?
    var locationLongitude: Double?
    
    static var selectedCat = AdCategory.none
    static var selectedTypeID = 0

    static var adTitle = ""
    static var adLocation = ""

    var selectedCat = AdCategory.none
    
    var leadsToPrices = false
    
    static var adMainType = AdMainType.none
    
    // document picker
    var documentPicker: UIDocumentPickerViewController? //(forOpeningContentTypes: [UTType.item], asCopy: false)
    var documentName: String?
    var documentFileBase64 = ""
    
    //Motors
    static var motorInitialSubmission: MotorInitialSubmission?
    static var motorFullSubmission: MotorFullSubmission?

    //Jobs
    static var jobInitialSubmission: JobInitialSubmission?
    static var jobFullSubmission: JobFullSubmission?
    
    //Numbers
    static var numbersSubmission: NumbersSubmission?
    
    //Electronics
    static var electronicsSubmission: ElectronicsSubmission?
    
    //Classified
    static var classifiedInitialSubmission: ClassifiedInitialSubmission?
    static var classifiedFullSubmission: ClassifiedFullSubmission?

    //Services
    static var servicesSubmission: ServicesSubmission?
    
    //Business
    static var businessSubmission: BusinessSubmission?
    
    var dataWarranty = [
        ListItem.init(id: 2, ar_Text: "No", en_Text: "No"),
        ListItem.init(id: 1, ar_Text: "Yes", en_Text: "Yes")
    ]
    
    var dataGender = [
        ListItem.init(id: 1, ar_Text: "Male", en_Text: "Male"),
        ListItem.init(id: 2, ar_Text: "Female", en_Text: "Female")
    ]

    // MARK:
    var imagePicker: ImagePicker!

    // MARK: DropDowns
    var customeListView: CustomListView = .fromNib()

    var selectedPhotoTag = 0
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updatePreview()
        renderLocation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        renderLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(hex: 0xF6F6F9)
        prepareStackView()
        feedStackView()
        addSearchView()
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        
        if #available(iOS 14.0, *) {
            self.documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.item], asCopy: false)
        } else {
            // Fallback on earlier versions
        }

        documentPicker?.delegate = self
        documentPicker?.modalPresentationStyle = .formSheet
        
    }
    
    @objc func didTapPickDocument() {
        
        if let docPicker = self.documentPicker {
            self.present(docPicker, animated: true, completion: nil)
        }
        
    }
    
    
    func addSearchView() {
        customeListView.frame = self.view.bounds
        customeListView.isHidden = true
        self.view.addSubview(customeListView)
    }
    
    @objc func didTapContinue() {
        
        let validationData = self.isValid()
        
        if(validationData.0 == true) {

            if ( self.leadsToPrices == true ) {
                let nextVC = (self.nextViewController as! PricesViewController)
                nextVC.adType = FormViewController.adMainType
                nextVC.modalPresentationStyle = .overCurrentContext
                nextVC.modalTransitionStyle = .crossDissolve
                nextVC.previousVC = self
                nextVC.images = self.images
                for (index, image) in nextVC.images.enumerated() {
                    nextVC.images[index] = image.aspectFittedToHeight(1024)
                }
                nextVC.imagesNames = self.imagesNames
                navigationController?.present(nextVC, animated: true)
            } else {
                 navigationController?.pushViewController(self.nextViewController, animated: true)
            }
            
        } else {
            self.showAlert(title: "", body: validationData.1.rawValue)
        }

    }
    
    @objc func didTapPicker(picker: PickerButton) {

    }
    
    // Location Selection Logic
    @objc func didTapLocationPicker() {
        
        let mapPickerVC = ViewControllersAssembly.misc.makeViewController(with: "MapPickerViewController") as! MapPickerViewController
        mapPickerVC.delegate = self
        self.navigationController?.pushViewController(mapPickerVC, animated: true)

    }
    
    @objc func didTapPhoto(button: UIButton) {
        selectedPhotoTag = button.tag
        print("selectedPhotoTag",selectedPhotoTag)
        imagePicker.present(from: button)
    }
    
    var nextViewController: UIViewController!
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.updatePreview()
    }
    
    func feedStackView() {
        for element in formElements {
            stackView.addArrangedSubview(element)
            
            if type(of: element) == FormField.self {
                let field = (element as! FormField)
                field.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
                field.delegate = self
            }
            if type(of: element) == FormPicker.self {
                let picker = (element as! FormPicker)
                picker.button.addTarget(self, action: #selector(self.didTapPicker(picker:)), for: .touchUpInside)
            }
            if type(of: element) == FormContinueButton.self {
                let button = (element as! FormContinueButton)
                button.addTarget(self, action: #selector(self.didTapContinue), for: .touchUpInside)
            }
            if type(of: element) == FormLocationView.self {
                let locationView = (element as! FormLocationView)
                locationView.button.addTarget(self, action: #selector(self.didTapLocationPicker), for: .touchUpInside)
            }
            if type(of: element) == FormPhotoPicker.self {
                let fpp = (element as! FormPhotoPicker)
                fpp.buttonAdd?.addTarget(self, action: #selector(self.didTapPhoto(button:)), for: .touchUpInside)
                fpp.delegate = self
            }
            if type(of: element) == FormFile.self {
                let ff = (element as! FormFile)
                ff.uploadButton?.addTarget(self, action: #selector(self.didTapPickDocument), for: .touchUpInside)
            }
            
        }
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: stackView.frame.height)
        stackView.setNeedsLayout()

    }
    
    func prepareStackView() {
        
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: offset).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -offset).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scrollView.delegate = self
        
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        stackView.distribution = .equalSpacing
        stackView.spacing = 12
        stackView.axis = .vertical
        stackView.alignment = .fill
        
    }

    func updateTextForPicker(with id: PickerID, value: Listable) {
        
        self.clearNextPickers(with: id, value: value)
        
        for element in formElements {
            if type(of: element) == FormPicker.self {
                let picker = (element as! FormPicker)
                if picker.id == id {
                    picker.textfield.text = value.en_Text ?? value.en_Name ?? value.value
                    print("picker.textfield.text",picker.textfield.text)
                    picker.arabicValue = value.ar_Name ?? ""
                    picker.englishValue = value.en_Name ?? ""
                }
            }
        }
        
        self.updatePreview()
        
    }
    
    func clearNextPickers(with id: PickerID, value: Listable) {
        
        var didReachPicker = false
        
        for element in formElements {
            if type(of: element) == FormPicker.self {
                let picker = (element as! FormPicker)
                
                if picker.id == id {
                    didReachPicker = true
                }
                
                if (didReachPicker == true) {
                    picker.textfield.text = ""
                }
                
            }
        }
        
    }
    
    func getFormValue(id: FieldID) -> String {
        
        for element in formElements {
            
            if type(of: element) == FormField.self {
                let field = (element as! FormField)
                
                if (field.id == id) {
                    return field.text ?? ""
                }
                
            }

        }
        
        return ""
    }
    
    func getPickerValue(id: PickerID) -> String {
        
        for element in formElements {
            
            if type(of: element) == FormPicker.self {
                let picker = (element as! FormPicker)
                
                if (picker.id == id) {
                    if(picker.id == .warranty) {
                        let value = picker.textfield.text ?? ""
                        return (value.lowercased() == "yes") ? ("1") : ("0")
                    }
                    else if (picker.id == .plateCode) {
                        return "\(picker.textfield.text ?? "")"
                    } else {
                        return "\(picker.textfield.text ?? "")-\(picker.textfield.text ?? "")"
                    }
                }
                
            }

        }
        
        return ""
        
    }
    
    func getFormValueForPreview(id: FieldID) -> String? {
        
        for element in formElements {
            if type(of: element) == FormField.self {
                let field = (element as! FormField)
                if (field.id == id) {
                    if let fieldText = field.text {
                        if (fieldText.isEmpty) { return .none }
                    }
                    return field.text
                }
            }
        }
        
        return .none
    }
    
    func getPickerValueForPreview(id: PickerID) -> String? {
        
        for element in formElements {
            if type(of: element) == FormPicker.self {
                let picker = (element as! FormPicker)
                if (picker.id == id) {
                    if let fieldText = picker.textfield.text {
                        if (fieldText.isEmpty) { return .none }
                    }
                    return picker.textfield.text
                }
            }
        }
        
        return .none
    }
    
    
    func prepareImagesDataAndReturnMain() -> String {
        
        for element in formElements {
            
            if type(of: element) == FormPhotoPicker.self {
                let photoPicker = (element as! FormPhotoPicker)
                
                self.images = photoPicker.images
                self.imagesNames = photoPicker.imagesNames
                
                return photoPicker.mainImageName ?? ""
            }

        }
        
        return ""
        
    }
    
    func getDescriptionValue() -> String {
        
        for element in formElements {
            
            if type(of: element) == FormTextView.self {
                let textview = (element as! FormTextView)
                return textview.textView.text ?? ""
            }

        }
        
        return ""
        
    }
    
    func isValid() -> (Bool,FormValidationError) {
        
        //return (true, .none)
        
        for element in formElements {

            // field
            if type(of: element) == FormField.self {
                let field = (element as! FormField)
                let text = field.text ?? ""
                if (text == "") {
                    return (false,.shouldFillForm)
                }
                
                if (field.id == .year) {
                    let valueInt = Int(field.text ?? "") ?? 0
                    if (valueInt < 1900) {
                        return (false,.incorrectYear)
                    }
                }
                
            }
            
            // picker
            if type(of: element) == FormPicker.self {
                let picker = (element as! FormPicker)
                let text = picker.textfield.text ?? ""
                if (text == "") {
                    return (false,.shouldFillForm)
                }
            }

            // field types
            if type(of: element) == FormField.self {
                let field = (element as! FormField)
                let text = field.text ?? ""
                
                if (field.id == .year) {
                    let valueInt = Int(text) ?? 0
                    if (valueInt < 1_900) {
                        return (false,.incorrectYear)
                    }
                }
                                
                if (field.id == .phoneNumber) {
                    let isValidPhone = text.isValidPhone()
                    if (isValidPhone == false) {
                        return (false,.incorrectPhone)
                    }
                }
                
            }
            
            
            // file
            if type(of: element) == FormFile.self {
                if(documentName == nil) {
                    return (false,.shouldSelectFile)
                }
            }
            
            // photos
            if type(of: element) == FormPhotoPicker.self {
                let photoPicker = (element as! FormPhotoPicker)
                if (photoPicker.images.count == 0) {
                    return (false,.shouldSelectPhoto)
                }
                if (photoPicker.mainImageIndex == nil) {
                    return (false,.shouldSelectPhoto)
                }
            }
            
            // location picker
            if type(of: element) == FormLocationView.self {
                if(self.locationLatitude == nil || self.locationLongitude == nil) {
                    return (false,.shouldPickLocation)
                }
            }
            
            // acceptance
            if type(of: element) == FormAcceptView.self {
                let acceptView = (element as! FormAcceptView)
                if (acceptView.isChecked == false) {
                    return (false,.userShouldAgreeError)
                }
            }
            
        }
        
        return (true, .none)
    }
    
    func updatePreview(image: UIImage? = nil) {
        
        for element in formElements {
            
            if type(of: element) == FormField.self {
                let field = (element as! FormField)
                if field.id == .title {
                    FormViewController.adTitle = field.text ?? ""
                }
            }
            
            if type(of: element) == FormPicker.self {
                let picker = (element as! FormPicker)
                if picker.id == .location {
                    FormViewController.adLocation = picker.textfield.text ?? ""
                }
            }
            
            if type(of: element) == FormPreviewView.self {
                let previewView = (element as! FormPreviewView)
                previewView.adTitleLabel.text = (FormViewController.adTitle == "") ? ("Ad Title") : (FormViewController.adTitle)
                previewView.adLocationLabel.text = (FormViewController.adLocation == "") ? ("Location") : FormViewController.adLocation
                
                switch FormViewController.adMainType {
                
                case .motor:
                    previewView.renderIcons (
                        iconNames: ["kilometer_list","car_year"],
                        values: [
                            getFormValueForPreview(id: .milage) ?? "Milage",
                            getFormValueForPreview(id: .year) ?? "Year"
                        ], price: getFormValueForPreview(id: .price) ?? "0.0"
                    )
                case .job:
                    previewView.renderIcons (
                        iconNames: ["work_experience_img","commitment_img"],
                        values: [
                            getPickerValueForPreview(id: .jobType) ?? "Employment Type",
                            getPickerValueForPreview(id: .workExperience) ?? "Work Experience"
                        ], price: getFormValueForPreview(id: .price) ?? "0.0"
                    )
                case .numbers:
                    print("N/A")
                case .electronics:
                    previewView.renderIcons (
                        iconNames: ["color","age_list",""],
                        values: [
                            getPickerValueForPreview(id: .color) ?? "Color",
                            getPickerValueForPreview(id: .age) ?? "Age",
                            getPickerValueForPreview(id: .storage) ?? "Storage"
                        ], price: getFormValueForPreview(id: .price) ?? "0.0"
                    )
                case .classified:
                    previewView.renderIcons (
                        iconNames: ["age_list","condition_2"],
                        values: [
                            getPickerValueForPreview(id: .age) ?? "Age",
                            getPickerValueForPreview(id: .condition) ?? "Condition",
                        ], price: getFormValueForPreview(id: .price) ?? "0.0"
                    )
                case .services:
                    print("z")
                    previewView.renderIcons (
                        iconNames: ["age_list","condition_2"],
                        values: [
                            "N/A",
                            getPickerValueForPreview(id: .category) ?? "Service Type",
                        ], price: getFormValueForPreview(id: .price) ?? "0.0"
                    )
                case .business:
                    previewView.renderIcons (
                        iconNames: [""],
                        values: [
                            getPickerValueForPreview(id: .category) ?? "Category",
                        ], price: getFormValueForPreview(id: .price) ?? "0.0"
                    )
                    print("WIP")
                case .none:
                    print("WIP")
                }
                
                
                let adImage = previewView.adImage.image

                if(adImage == nil) {
                    
                    let preview_business = Statics.preview_business
                    let preview_classified = Statics.preview_classified
                    let preview_electronics = Statics.preview_electronics
                    let preview_jobs = Statics.preview_jobs
                    let preview_motors = Statics.preview_motors
                    let preview_services = Statics.preview_services
                    
                    switch FormViewController.adMainType {
                        
                    case .motor:
                        previewView.adImage.image = preview_motors
                    case .job:
                        previewView.adImage.image = preview_jobs
                    case .numbers:
                        previewView.adImage.image = preview_jobs
                    case .electronics:
                        previewView.adImage.image = preview_electronics
                    case .classified:
                        previewView.adImage.image = preview_classified
                    case .services:
                        previewView.adImage.image = preview_services
                    case .business:
                        previewView.adImage.image = preview_business
                    case .none:
                        previewView.adImage.image = nil

                    }
                    
                } else {
                    print("🟦_image",image)
                    if let image = image {
                        previewView.adImage.image = image
                    }
                    
                }

            }
            
            if type(of: element) == SimView.self {
                (element as! SimView).numberLabel.text = self.getFormValue(id: .simNumber)
            }
            
        }

    }
    
    func setPhoto(tag: Int, image: UIImage, name: String = "") {
        
        for element in formElements {
            
            if type(of: element) == FormPhotoPicker.self {
                
                let ppv = (element as! FormPhotoPicker)
                ppv.appendImage(image: image, name: name)
                
            }
            
//            if type(of: element) == FormPreviewView.self {
//
//                let fpp = (element as! FormPreviewView)
//                fpp.adImage.image = image
//
//            }
            
        }

    }
    
    func setDocumentName() {
        
        for element in formElements {
            
            if type(of: element) == FormFile.self {
                
                let formFileView = (element as! FormFile)
                formFileView.fileNameLabel.text = self.documentName
                
            }
            
        }

    }
    
    func renderLocation() {
        
        for element in formElements {
            if type(of: element) == FormLocationView.self {
                let lv = (element as! FormLocationView)
                if MapPickerViewController.addressDetails.isEmpty == false {
                    lv.button.setTitle(MapPickerViewController.addressDetails, for: .normal)
                }
            }
        }

    }
        
}

extension FormViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let formField = textField as? FormField {
            
            if (formField.id == .price) {
                let valueInt = Int(textField.text ?? "") ?? 0
                if (valueInt > 100_000_000) {
                    formField.text = "100000000"
                    return false
                }
            }
            
            if (formField.id == .milage) {
                let valueInt = Int(textField.text ?? "") ?? 0
                if (valueInt > 99_999) {
                    formField.text = "99999"
                    return false
                }
            }
            
            if (formField.id == .simNumber) {
                let valueInt = (textField.text ?? "").count
                let maxLength = 6
                if (valueInt == maxLength) {
                    formField.text = String((textField.text ?? "").prefix(maxLength-1))
                    return false
                }
            }
        }
        
        
//        if let formField = textField as? FormField {
//            if (formField.id == .phoneNumber) {
//                if ((textField.text ?? "").isNumeric == false) {
//                    return false
//                }
//            }
//        }
        
        return true

    }
    
}



extension FormViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
    }
    
}

extension FormViewController: ImagePickerDelegate {
    
    func didSelect(image: UIImage?, name: String?) {
        
        if let image = image, let name = name {
            setPhoto(tag: self.selectedPhotoTag, image: image, name: name)
        }
    }
    
    func didSelect(image: UIImage?) {
        
        if let image = image {
            setPhoto(tag: self.selectedPhotoTag, image: image)
        }
        
    }
    
}

extension FormViewController: UIDocumentPickerDelegate {
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        self.documentName = urls.first?.absoluteString.components(separatedBy: "/").last
        
        guard let url = urls.first else {
            print("no_first_url")
            return
        }
        
        let data: Data = try! Data(contentsOf: url)
        
        self.documentFileBase64 = data.base64EncodedString()
        print("documentFileBase64",documentFileBase64)
        self.setDocumentName()
        
    }
    
}

extension FormViewController: MapPickerViewControllerDelegate {
    
    func didChangeLocation(lat: Double, lon: Double) {
        print("didChangeLocation", lat, lon)
        self.locationLatitude = lat
        self.locationLongitude = lon
    }
    
}

extension FormViewController: FormPhotoPickerDelegate {
    func didSelectPhoto(image: UIImage) {
        self.updatePreview(image: image)
    }
}
