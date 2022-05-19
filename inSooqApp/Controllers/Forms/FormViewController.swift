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
    case shouldFillForm = "Should Fill Form"
    case shouldPickLocation = "Should Pick Location"
    case shouldSelectPhoto = "Should Select a photo"
    case shouldSelectFile = "Should Select a file"
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

class FormViewController: UIViewController {
    
    var stackView = UIStackView()
    var scrollView = UIScrollView()

    var formDarkGray = UIColor.darkGray
    var formLightGray = UIColor.lightGray

    var offset: CGFloat = 8
    var formElements = [UIView]()
    
    var images = [UIImage]()
    
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
        ListItem.init(id: 1, ar_Text: "Yes", en_Text: "Yes"),
        ListItem.init(id: 2, ar_Text: "No", en_Text: "No")
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
                nextVC.modalPresentationStyle = .overCurrentContext
                nextVC.modalTransitionStyle = .crossDissolve
                nextVC.previousVC = self
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
                let ppv = (element as! FormPhotoPicker)
                ppv.buttonAdd?.addTarget(self, action: #selector(self.didTapPhoto(button:)), for: .touchUpInside)
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
                    picker.textfield.text = value.en_Text ?? value.en_Name
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
            }
            
            // picker
            if type(of: element) == FormPicker.self {
                let picker = (element as! FormPicker)
                let text = picker.textfield.text ?? ""
                if (text == "") {
                    return (false,.shouldFillForm)
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
    
    func updatePreview() {
        
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
                (element as! FormPreviewView).adTitleLabel.text = (FormViewController.adTitle == "") ? ("Ad Title") : (FormViewController.adTitle)
                (element as! FormPreviewView).adLocationLabel.text = (FormViewController.adLocation == "") ? ("Location") : FormViewController.adLocation
            }
            
        }

    }
    
    func setPhoto(tag: Int, image: UIImage) {
        
        for element in formElements {
            
            if type(of: element) == FormPhotoPicker.self {
                
                let ppv = (element as! FormPhotoPicker)
                ppv.appendImage(image: image)
                
            }
            
            if type(of: element) == FormPreviewView.self {
                
                let fpp = (element as! FormPreviewView)
                fpp.adImage.image = image
                
            }
            
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

extension FormViewController: UIScrollViewDelegate {
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
    }
    
}

extension FormViewController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        
        if let image = image {
            setPhoto(tag: self.selectedPhotoTag, image: image)
        }
        
    }
    
}

extension FormViewController: UIDocumentPickerDelegate {
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        self.documentName = urls.first?.absoluteString.components(separatedBy: "/").last
        print("documentName",documentName)
        
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
