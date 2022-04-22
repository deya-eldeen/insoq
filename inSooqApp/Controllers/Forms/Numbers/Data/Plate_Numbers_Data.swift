//
//  Plate_Numbers_Data.swift
//  inSooqApp
//
//  Created by Deya on 11/04/2022.
//

import UIKit

extension Plate_Numbers_VC {

    func formElements() -> [UIView] {
        
        let header = UIView()
        header.frame.size = .init(width: 0, height: 40)
        
        let startLabel = FormLabel()
        startLabel.text = "Let's start with the title"
        
        let tipLabel = FormLabel()
        tipLabel.text = "Try to have an informative title that’s to be point and not very long."
        tipLabel.textColor = .darkGray
        
        let titleField = FormField()
        titleField.id = .title
        titleField.placeholder = "Ad Title"

        let looksGoodLabel = FormLabel()
        looksGoodLabel.text = "Looks good, now please add more details..."
        
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
        
        let specificationsLabel = FormLabel()
        specificationsLabel.text = "Specifications"
        

        //
        let emiratePicker = FormPicker()
        emiratePicker.id = .emirate
        emiratePicker.setPlaceHolder("Please select an emirate")
        
        let typePicker = FormPicker()
        typePicker.id = .plateType
        typePicker.setPlaceHolder("Please select a plate type")
        
        let codePicker = FormPicker()
        codePicker.id = .plateCode
        codePicker.setPlaceHolder("Please select a plate code")
        
        let plateNumberField = FormField()
        plateNumberField.id = .plateNumber
        plateNumberField.placeholder = "Plate Number 000000"
        
        let locationPicker = FormPicker()
        locationPicker.setPlaceHolder("Location")
        locationPicker.id = .location
        //
        
        let locationView = FormLocationView().render()
        
        let acceptView = FormAcceptView().render()

        let formContinueButton = FormContinueButton()
        formContinueButton.setTitle("Continue", for: .normal)
        
        let adPreview = FormPreviewView().render()

        return [
            header,
            startLabel,
            tipLabel,
            titleField,
            looksGoodLabel,
            listingPriceField,
            phoneNumberField,
            descriptionLabel,
            specificationsLabel,
            
            emiratePicker,
            typePicker,
            codePicker,
            plateNumberField,
            
            locationPicker,
            locationView,
            acceptView,
            formContinueButton,
            adPreview
        ]
        
    }

}

