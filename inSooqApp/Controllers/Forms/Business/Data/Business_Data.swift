//
//  Business_Data.swift
//  inSooqApp
//
//  Created by Deya on 11/04/2022.
//

import UIKit

extension Business_VC {

    func formElements() -> [UIView] {
        
        let header = UIView()
        header.frame.size = .init(width: 0, height: 40)
        
        let startLabel = FormLabel()
        startLabel.text = "Let's start with the title"
        
        let tipLabel = FormLabel()
        tipLabel.text = "Try to have an informative title that’s to be point and not very long."
        
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

        //Picker: Please select business category
        //Picker: Please select sub business
        
        //
        let categoryPicker = FormPicker()
        categoryPicker.id = .category
        categoryPicker.setPlaceHolder("Please select category")
        
        let subcategoryPicker = FormPicker()
        subcategoryPicker.id = .subcategory
        subcategoryPicker.setPlaceHolder("Please select subcategory")
        
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
            
            categoryPicker,
            subcategoryPicker,
            
            locationPicker,
            locationView,
            acceptView,
            formContinueButton,
            adPreview
        ]
        
    }

}

//Label: Let's start with the title
//Label: Try to have an informative title that’s to be point and not very long.
//Field: Ad Title
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

//Picker: Please select business category
//Picker: Please select sub business
//Picker: Please select your location

//Label: Your Location
//Location View: Location >> on click opens map
//Check box: By submitting this ad, I agree on {terms & conditions} and {Privacy
//Policy}
//Label: Once you submit the ad, we will review before publishing. You will be
//notified once approved
//Button: Continue
//View: Ad Preview

