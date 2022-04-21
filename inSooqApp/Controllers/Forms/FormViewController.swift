//
//  FormViewController.swift
//  inSooqApp
//
//  Created by Deya on 05/04/2022.
//

import Foundation
import DropDown
import PhotosUI

enum FormValidationError: String {
    case userShouldAgreeError = "User Should Agree"
    case shouldFillForm = "Should Fill Form"
    case none
}

class FormViewController: UIViewController {
    
    var stackView = UIStackView()
    var scrollView = UIScrollView()

    var offset: CGFloat = 8
    var formElements = [UIView]()
    
    var images = [UIImage]()
    
    static var selectedCat = AdCategory.none
    static var selectedTypeID = 0

    var adTitle = ""
    var adLocation = ""

    var selectedCat = AdCategory.none
    
    var dataWarranty = [ListItem.init(id: 1, ar_Text: "Yes", en_Text: "Yes"), ListItem.init(id: 2, ar_Text: "No", en_Text: "No")]
    var dataGender = [ListItem.init(id: 1, ar_Text: "Male", en_Text: "Male"), ListItem.init(id: 2, ar_Text: "Female", en_Text: "Female")]

    // MARK: DropDowns
    var customeListView: CustomListView = .fromNib()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray5
        prepareStackView()
        feedStackView()
        addSearchView()
    }
    
    func addSearchView() {
        customeListView.frame = self.view.bounds
        customeListView.isHidden = true
        self.view.addSubview(customeListView)
    }
    
    @objc func didTapContinue() {
        
        let validationData = self.isValid()
        
        if(validationData.0 == true) {            
            navigationController?.pushViewController(self.nextViewController, animated: true)
        } else {
            self.showAlert(title: "", body: validationData.1.rawValue)
        }

    }
    
    @objc func didTapPicker(picker: PickerButton) {

    }
    
    // Location Selection Logic
    @objc func didTapLocationPicker() {
        
        let mapPickerVC = ViewControllersAssembly.misc.makeViewController(with: "MapPickerViewController")
        self.navigationController?.pushViewController(mapPickerVC, animated: true)

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
        
//        for element in formElements {
//
//            if type(of: element) == FormAcceptView.self {
//                let acceptView = (element as! FormAcceptView)
//                if (acceptView.isChecked == false) {
//                    return (false,.userShouldAgreeError)
//                }
//            }
//
//            if type(of: element) == FormPicker.self {
//                let picker = (element as! FormPicker)
//                let text = picker.textfield.text ?? ""
//                if (text == "") {
//                    return (false,.shouldFillForm)
//                }
//            }
//
//            if type(of: element) == FormField.self {
//                let field = (element as! FormField)
//                let text = field.text ?? ""
//                if (text == "") {
//                    return (false,.shouldFillForm)
//                }
//            }
//
//        }
        
        return (true, .none)
    }
    
    func updatePreview() {
        
        for element in formElements {
            
            if type(of: element) == FormField.self {
                let field = (element as! FormField)
                if field.id == .title {
                    adTitle = field.text ?? ""
                }
            }
            
            if type(of: element) == FormPicker.self {
                let picker = (element as! FormPicker)
                if picker.id == .location {
                    adLocation = picker.textfield.text ?? ""
                }
            }
            
            
            if type(of: element) == FormPreviewView.self {
                (element as! FormPreviewView).adTitleLabel.text = adTitle
                (element as! FormPreviewView).adLocationLabel.text = adLocation
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

//extension FormViewController: UITextFieldDelegate {
//
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("textFieldDidBeginEditing",textField)
//        self.updatePreview()
//    }
//
//}
