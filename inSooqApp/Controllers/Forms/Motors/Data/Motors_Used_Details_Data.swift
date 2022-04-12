//
//  Motors_Used_Details_Data.swift
//  inSooqApp
//
//  Created by Deya on 11/04/2022.
//

import UIKit

extension Motors_Used_Details_VC {
    
    func formElements() -> [UIView] {
        
        let header = UIView()
        header.frame.size = .init(width: 0, height: 40)
        
        let looksGoodLabel = FormLabel()
        looksGoodLabel.text = "Looks good, now please add more details ..."
        
        let photoPicker = FormPhotoPicker()
        
        let listingPriceField = FormField()
        listingPriceField.placeholder = "Listing Price"
        listingPriceField.keyboardType = .numberPad

        let phoneNumberField = FormField()
        phoneNumberField.placeholder = "Phone Number"
        phoneNumberField.keyboardType = .phonePad
        
        let description = FormTextView()
        description.setPlaceHolder("Description")

        let specificationsLabel = FormLabel()
        specificationsLabel.text = "Specifications"
        
        let milageField = FormField()
        milageField.placeholder = "Milage (Km)"
        milageField.keyboardType = .numberPad
        
        let regionalSpecPicker = FormPicker()
        regionalSpecPicker.setPlaceHolder("Regional Specs")
        regionalSpecPicker.id = .regional_specs

        let colorPicker = FormPicker()
        colorPicker.setPlaceHolder("Color")
        colorPicker.id = .color
        
        let numberOfDoorsPicker = FormPicker()
        numberOfDoorsPicker.setPlaceHolder("Number Of Doors")
        numberOfDoorsPicker.id = .numberOfDoors
        
        let warrantyPicker = FormPicker()
        warrantyPicker.setPlaceHolder("Number Of Doors")
        warrantyPicker.id = .numberOfDoors
        
        let transmissionPicker = FormPicker()
        transmissionPicker.setPlaceHolder("Transmission")
        transmissionPicker.id = .transmission
        
        let bodyTypePicker = FormPicker()
        bodyTypePicker.setPlaceHolder("Body Type")
        bodyTypePicker.id = .bodyType
        
        let fuelTypePicker = FormPicker()
        fuelTypePicker.setPlaceHolder("Fuel Type")
        fuelTypePicker.id = .transmission
        
        let cylindersPicker = FormPicker()
        cylindersPicker.setPlaceHolder("Cylinders Type")
        cylindersPicker.id = .cylinders
        
        let steeringSidePicker = FormPicker()
        steeringSidePicker.setPlaceHolder("Steering Side")
        steeringSidePicker.id = .steeringSide
        
        let horsePowerPicker = FormPicker()
        horsePowerPicker.setPlaceHolder("Horse Power")
        horsePowerPicker.id = .horsePower
        
        let locationPicker = FormPicker()
        horsePowerPicker.setPlaceHolder("Location")
        horsePowerPicker.id = .location
        
        let formContinueButton = FormContinueButton()
        formContinueButton.setTitle("Continue", for: .normal)
        
        let acceptView = FormAcceptView()
        
        let adPreview = FormPreviewView()

        
        return [
            header,
            looksGoodLabel,
            photoPicker,
            listingPriceField,
            phoneNumberField,
            description,
            specificationsLabel,
            milageField,
            regionalSpecPicker,
            colorPicker,
            numberOfDoorsPicker,
            warrantyPicker,
            transmissionPicker,
            bodyTypePicker,
            fuelTypePicker,
            cylindersPicker,
            steeringSidePicker,
            horsePowerPicker,
            locationPicker,
            formContinueButton,
            acceptView,
            adPreview
        ]
        
    }
    
}

