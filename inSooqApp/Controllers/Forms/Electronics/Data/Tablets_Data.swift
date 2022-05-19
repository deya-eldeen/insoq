//
//  Tablets_Data.swift
//  inSooqApp
//
//  Created by Deya on 11/04/2022.
//

import UIKit

extension Tablets_VC {

    func formElements() -> [UIView] {
        
        let header = SpacerView().render()
        
        let startLabel = FormLabel()
        startLabel.text = "Let's start with the title"
        
        let tipLabel = FormSubLabel()
        tipLabel.text = "Try to have an informative title that’s to be point and not very long."
        tipLabel.textColor = self.formDarkGray

        let titleField = FormField()
        titleField.id = .title
        titleField.placeholder = "Ad Title"

        let looksGoodLabel = FormLabel()
        looksGoodLabel.text = "Looks good, now please add more details..."
        
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
        
        let specificationsLabel = FormLabel()
        specificationsLabel.text = "Specifications"
        
        //
        let brandPicker = FormPicker()
        brandPicker.id = .brand
        brandPicker.setPlaceHolder("Please select brand")
        
        let modelPicker = FormPicker()
        modelPicker.id = .model
        modelPicker.setPlaceHolder("Please select model")
        
        let versionPicker = FormPicker()
        versionPicker.id = .version
        versionPicker.setPlaceHolder("Please select version")
        
        let ramPicker = FormPicker()
        ramPicker.id = .ram
        ramPicker.setPlaceHolder("Please select ram")
        
        let storagePicker = FormPicker()
        storagePicker.id = .storage
        storagePicker.setPlaceHolder("Please select a storage")
        
        let agePicker = FormPicker()
        agePicker.id = .age
        agePicker.setPlaceHolder("Please select age")
        
        let usagePicker = FormPicker()
        usagePicker.id = .usage
        usagePicker.setPlaceHolder("Please select usage")
        
        let colorPicker = FormPicker()
        colorPicker.id = .color
        colorPicker.setPlaceHolder("Please select color")
        
        let warrantyPicker = FormPicker()
        warrantyPicker.setPlaceHolder("Under Warranty")
        warrantyPicker.id = .warranty
        
        let locationPicker = FormPicker()
        locationPicker.setPlaceHolder("Location")
        locationPicker.id = .location
        //
        

        
        let locationView = FormLocationView().render()
        
        let acceptView = FormAcceptView().render()

        let formContinueButton = FormContinueButton()
        formContinueButton.setTitle("CONTINUE", for: .normal)
        
        let adPreview = FormPreviewView().render()

        return [
            header,

            startLabel,
            tipLabel,
            titleField,
            looksGoodLabel,
            photosLabel,
            photoPicker,
            listingPriceField,
            phoneNumberField,
            descriptionLabel,
            specificationsLabel,
            
            brandPicker,
            modelPicker,
            versionPicker,
            ramPicker,
            storagePicker,
            agePicker,
            usagePicker,
            colorPicker,
            warrantyPicker,
            
            locationPicker,
            locationView,
            acceptView,
            formContinueButton,
            adPreview,
        ]
        
    }

}

