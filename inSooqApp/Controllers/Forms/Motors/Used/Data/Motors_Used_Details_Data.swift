//
//  Motors_Used_Details_Data.swift
//  inSooqApp
//
//  Created by Deya on 11/04/2022.
//

import UIKit

extension Motors_Used_Details_VC {
    
    func formElements() -> [UIView] {
        
        let header = SpacerView().render()
        
        let looksGoodLabel = FormSubLabel()
        looksGoodLabel.text = "Looks good, now please add more details ..."
        looksGoodLabel.textColor = self.formDarkGray
        
        let photosLabel = FormLabel()
        photosLabel.text = "Pictures Of your Ad"
        
        let photoPicker = FormPhotoPicker().render()
        
        let listingPriceField = FormField()
        listingPriceField.id = .price
        listingPriceField.placeholder = "Listing Price"
        listingPriceField.keyboardType = .numberPad

        let phoneNumberField = FormField()
        phoneNumberField.id = .phoneNumber
        phoneNumberField.placeholder = "Phone Number"
        phoneNumberField.keyboardType = .phonePad
        
        let descriptionLabel = FormLabel()
        descriptionLabel.text = "Add a short description (Optional)"
        
        let description = FormTextView().render(placeholder: "Description (Optional)")

        let specificationsLabel = FormLabel()
        specificationsLabel.text = "Specifications"
        
        //
        let milageField = FormField()
        milageField.id = .milage
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
        warrantyPicker.setPlaceHolder("Under Warranty")
        warrantyPicker.id = .warranty
        
        let transmissionPicker = FormPicker()
        transmissionPicker.setPlaceHolder("Please Select Transmission")
        transmissionPicker.id = .transmission
        
        let bodyTypePicker = FormPicker()
        bodyTypePicker.setPlaceHolder("Please Select Body Type")
        bodyTypePicker.id = .bodyType
        
        let fuelTypePicker = FormPicker()
        fuelTypePicker.setPlaceHolder("Please Select Fuel Type")
        fuelTypePicker.id = .fuelType
        
        let cylindersPicker = FormPicker()
        cylindersPicker.setPlaceHolder("Please Select Cylinders Type")
        cylindersPicker.id = .cylinders
        
        let steeringSidePicker = FormPicker()
        steeringSidePicker.setPlaceHolder("Please Select Steering Side")
        steeringSidePicker.id = .steeringSide
        
        let horsePowerPicker = FormPicker()
        horsePowerPicker.setPlaceHolder("Please Select Horse-Power")
        horsePowerPicker.id = .horsePower
        
        let locationPicker = FormPicker()
        locationPicker.setPlaceHolder("Location")
        locationPicker.id = .location
        
        let locationView = FormLocationView().render()
        //
        
        let acceptView = FormAcceptView().render()

        let formContinueButton = FormContinueButton()
        formContinueButton.setTitle("CONTINUE", for: .normal)
        
        let adPreview = FormPreviewView().render()

        return [
            header,
            looksGoodLabel,
            photosLabel,
            photoPicker,
            listingPriceField,
            phoneNumberField,
            descriptionLabel,
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
            locationView,
            acceptView,
            formContinueButton,
            adPreview,
        ]
        
    }
    
}

