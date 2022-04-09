//
//  FormElement.swift
//  inSooqApp
//
//  Created by Deya on 05/04/2022.
//

import Foundation
import UIKit

protocol FormElement {
    
}

class FormLabel: UILabel, FormElement {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        self.font = .boldSystemFont(ofSize: 15)
        self.textColor = .black
        self.numberOfLines = 0
        self.sizeToFit()
    }
    
}

class FormSubLabel: UILabel, FormElement {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        self.font = .systemFont(ofSize: 12)
        self.textColor = .systemGray5
        self.numberOfLines = 0
        self.sizeToFit()
    }
    
}

class FormField: UITextField, FormElement {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        self.borderStyle = .roundedRect
        self.textColor = .gray
        self.backgroundColor = .white
        self.tintColor = .systemBlue
        self.sizeToFit()
    }
    
}

class FormPicker: UITextField, FormElement {
    
//    var picker = UIPickerView()
    var pickerActivityView = UIActivityIndicatorView()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        self.borderStyle = .roundedRect
        
        self.textColor = .gray
        self.backgroundColor = .white
        self.tintColor = .darkGray
        self.sizeToFit()
        
        // Picker Images
        let pickerImage = UIImage(systemName: "chevron.down")
        let pickerImageView = UIImageView(frame: .init(x: 0, y: 0, width: 20, height: 20))
        pickerImageView.image = pickerImage
        self.addSubview(pickerImageView)
        
        pickerImageView.translatesAutoresizingMaskIntoConstraints = false
        pickerImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        pickerImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        
        // Picker
//        self.inputView = picker
        
    }
    
//    func setupDelegates(pickerDelegate: UIPickerViewDelegate, pickerDataSouce: UIPickerViewDataSource) {
//        self.picker.delegate = pickerDelegate
//        self.picker.dataSource = pickerDataSouce
//    }
    
}

class FormContinueButton: UIButton, FormElement {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = .orange
        
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        
        self.setTitleColor(.white, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

class FormPhotoPicker: UIView, FormElement {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func commonInit() {
        self.backgroundColor = .darkGray
    }
    
}

class FormPreviewView: UIView, FormElement {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func commonInit() {
        self.backgroundColor = .darkGray
    }
    
}


//Label: Let's start with the title
//Field: Ad Title
//Label: Now let's Add your car make and model
//Picker: What is your car brand?
//Picker: What model is it?
//Picker: What is the trim?
//Field: Year
//View: Ad Preview
