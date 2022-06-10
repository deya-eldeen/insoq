//
//  Motors_Machinery_Parts_Details_Data.swift
//  inSooqApp
//
//  Created by Deya on 11/04/2022.
//

import UIKit

extension Motors_Parts_Details_VC {
    
    func formElements() -> [UIView] {
        
        let header = SpacerView().render()
        
        let looksGoodLabel = FormLabel()
        looksGoodLabel.text = "Looks good, now please add more details ..."
        
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
        
        let partName = FormField()
        partName.id = .partName
        partName.placeholder = "Name of part"
        
        //
        let agePicker = FormPicker()
        agePicker.setPlaceHolder("Please Select Age")
        agePicker.id = .age
        
        let conditionPicker = FormPicker()
        conditionPicker.setPlaceHolder("Please Select Condition")
        conditionPicker.id = .condition
        
        let locationPicker = FormPicker()
        locationPicker.setPlaceHolder("Location")
        locationPicker.id = .location
        //
        
        let locationView = FormLocationView().render()
        
        let acceptView = FormAcceptView().render()

        let formContinueButton = FormContinueButton()
        formContinueButton.setTitle("CONTINUE", for: .normal)
        
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
            
            partName,
            agePicker,
            conditionPicker,

            locationPicker,
            locationView,
            acceptView,
            formContinueButton,
        ]
        
    }
    
}

//Label: Looks good, now please add more details...
//Label Pictures of your ad
//View: Photo Upload View 10 pictures vertically
//Label: Listing Price
//Field: 0.00
//Label: Phone Number
//Field: Phone Number
//Label: Add a shot description (Optional)
//Field: Write more about your ad...
//Label: Specifications

//Field: Name of part
//Picker: Age
//Picker: Condition
//Picker: Please select location

//Label: Your Location
//Location View: Location >> on click opens map
//Check box: By submitting this ad, I agree on {terms & conditions} and {Privacy
//Policy}
//Label: Once you submit the ad, we will review before publishing. You will be
//notified once approved
//Button: Continue
