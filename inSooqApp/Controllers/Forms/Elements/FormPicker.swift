//
//  FormPicker.swift
//  inSooqApp
//
//  Created by Deya on 10/04/2022.
//

import UIKit

class PickerButton: UIButton {
    var id = PickerID.none
}

class FormPicker: UIView, FormElement {
    
    var id: PickerID? {
        didSet {
            button.id = id ?? .unknown
        }
    }
    
    var arabicValue = ""
    var englishValue = ""
    
    let button = PickerButton()
    let textfield = FormField()
    
    let pickerImage = UIImage(named: "tri")?.withTintColor(.darkGray)
    let pickerImageView = UIImageView(frame: .init(x: 0, y: 0, width: 16, height: 16))

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    var textPadding = UIEdgeInsets(
        top: 10,
        left: 20,
        bottom: 10,
        right: 20
    )

//    override func textRect(forBounds bounds: CGRect) -> CGRect {
//        let rect = super.textRect(forBounds: bounds)
//        return rect.inset(by: textPadding)
//    }
    
    func commonInit() {
        
//        self.textfield.alignmentRectInsets = self.textPadding
        // Textfield
        self.addSubview(textfield)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        textfield.borderStyle = .none
        textfield.textColor = .gray
        textfield.font = .boldSystemFont(ofSize: 14)
        
        textfield.backgroundColor = .white
//        textfield.tintColor = .darkGray
        textfield.isUserInteractionEnabled = false
        
        textfield.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textfield.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        textfield.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        textfield.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        textfield.sizeToFit()

        // Picker Images
        self.addSubview(pickerImageView)
        pickerImageView.translatesAutoresizingMaskIntoConstraints = false
        pickerImageView.image = pickerImage
        pickerImageView.tintColor = .gray
        
        pickerImageView.centerYAnchor.constraint(equalTo: self.textfield.centerYAnchor).isActive = true
        pickerImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        
        // Button
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    
    }
    
    func setPlaceHolder(_ placeholder: String) {
        self.textfield.placeholder = placeholder
    }
    
}

enum PickerID {
    case carBrand
    case model
    case trim
    case regional_specs
    case color
    case numberOfDoors
    case warranty
    case transmission
    case bodyType
    case fuelType
    case cylinders
    case steeringSide
    case horsePower
    case location
    case boatCategory
    case boatSubcategory
    case machineryCategory
    case machineryModel
    case capacity
    case condition
    case mechanicalCondition
    case sellerType
    case machinery
    case partType
    case make
    case partName
    case age
    case bikeCategory
    case bikeSubcategory
    case engineSize
    case wheels
    case usage
    case finalDriveSystem
    case jobType
    case gender
    case nationality
    case currentLocation
    case educationLevel
    case workExperience
    case commitment
    case noticePeriod
    case visaStatus
    case professionalLevel
    case expectedMonthlySalary
    case whatIsYourServiceCategory
    case yourLocation
    case businessCategory
    case subBusiness
    case category
    case subcategory
    case itemName
    case brand
    case emirate
    case plateType
    case plateCode
    case `operator`
    case code
    case mobilePlan
    case version
    case ram
    case storage
    case length
    case type
    
    case unknown
    case none
}

//
//What is your car brand?
//What model is it?
//What is the trim?
//Regional Specs
//Color
//Number of doors
//Under Warranty?
//transmission
//body type
//fuel type
//cylinders
//steering side
//horse-power
//location
//What is your boat category?
//What is your boat subcategory?
//What is your machinery category?
//What is your machinery model?
//Capacity
//condition
//seller type
//machinery
//What type is your part category?
//What make is it?
//Name Of Part
//Age
//Condition
//What is your bike category?
//What is your bike subcategory?
//engine size
//wheels
//usage
//final drive system
//Job type
//Gender
//Nationality
//Current Location
//Education Level
//Work Experience
//Commitment
//Notice Period
//Visa Status
//Professional Level
//Expected Monthly Salary
//What is your service category?
//your location
//business category
//sub business
//the category
//the subcategory
//the item name
//age
//brand
//an emirate
//a plate type
//a plate code
//an operator
//a code
//mobile plan
//model
//version
//ram
//a storage
//color
