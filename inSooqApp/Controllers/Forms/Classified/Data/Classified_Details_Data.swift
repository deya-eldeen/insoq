//
//  Classified_Details_Data.swift
//  inSooqApp
//
//  Created by Deya on 11/04/2022.
//

import UIKit

extension Classified_Details_VC {

    func formElements() -> [UIView] {

        let header = UIView()
        header.frame.size = .init(width: 0, height: 40)
        
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
        let agePicker = FormPicker()
        agePicker.id = .age
        agePicker.setPlaceHolder("Please select age")
        
        let usagePicker = FormPicker()
        usagePicker.id = .usage
        usagePicker.setPlaceHolder("Please select usage")
        
        let conditionPicker = FormPicker()
        conditionPicker.id = .condition
        conditionPicker.setPlaceHolder("Please select condition")
        
        let brandPicker = FormPicker()
        brandPicker.id = .brand
        brandPicker.setPlaceHolder("Please select brand")
        //
        
        let locationPicker = FormPicker()
        locationPicker.setPlaceHolder("Location")
        locationPicker.id = .location
        
        let locationView = FormLocationView().render()
        
        let acceptView = FormAcceptView().render()

        let formContinueButton = FormContinueButton()
        formContinueButton.setTitle("Continue", for: .normal)
        
        let adPreview = FormPreviewView().render()

        switch self.classType {
        case .personal:
            return [
                looksGoodLabel,
                photosLabel,
                photoPicker,
                listingPriceField,
                phoneNumberField,
                descriptionLabel,
                specificationsLabel,
                
                agePicker,
                usagePicker,
                conditionPicker,
                brandPicker,
                
                locationPicker,
                locationView,
                acceptView,
                formContinueButton,
                adPreview
            ]
        case .collectables:
            return [
                looksGoodLabel,
                photosLabel,
                photoPicker,
                listingPriceField,
                phoneNumberField,
                descriptionLabel,
                specificationsLabel,
                
                agePicker,
                usagePicker,
                conditionPicker,
                
                locationPicker,
                locationView,
                acceptView,
                formContinueButton,
                adPreview
            ]
        case .pets:
            return [
                looksGoodLabel,
                photosLabel,
                photoPicker,
                listingPriceField,
                phoneNumberField,
                descriptionLabel,
                specificationsLabel,
                
                locationPicker,
                locationView,
                acceptView,
                formContinueButton,
                adPreview
            ]
        case .none:
            return []
        }
        
    }

}





//category id: 39, 40, 41, 42, 43, 44, 45 {
//Label: Looks good, now please add more details ...
//Label Pictures of your ad
//View: Photo Upload View 10 pictures vertically Label: Listing Price
//Field: 0.00
//Label: Phone Number
//Field: Phone Number
//Label: Add a shot description (Optional)
//Field: Write more about your ad...
//Label: Specifications

//Picker: Please select age
//Picker: Please select usage
//Picker: Please select condition
//Picker: Please select brand

//Picker: Please select your location
//Label: Your Location
//Location View: Location >> on click opens map
//Check box: By submitting this ad, I agree on {terms & conditions} and {Privacy Policy}
//Label: Once you submit the ad, we will review before publishing. You will be notified once approved
//Button: Continue
//View: Ad Preview
//}

//

//category id: 46, 47, 48, 49, 51, 52 {
//Label: Looks good, now please add more details ...
//Label Pictures of your ad
//View: Photo Upload View 10 pictures vertically
//Label: Listing Price
//Field: 0.00
//Label: Phone Number
//Field: Phone Number
//Label: Add a shot description (Optional)
//Field: Write more about your ad...
//Label: Specifications

//Picker: Please select age
//Picker: Please select usage
//Picker: Please select condition

//Picker: Please select your location
//Label: Your Location
//Location View: Location >> on click opens map
//Check box: By submitting this ad, I agree on {terms & conditions} and {Privacy Policy}
//Label: Once you submit the ad, we will review before publishing. You will be notified once approved
//Button: Continue
//View: Ad Preview
//}

//

//category id: 53, 54, 55 {
//Label: Looks good, now please add more details ...
//Label Pictures of your ad
//View: Photo Upload View 10 pictures vertically
//Label: Listing Price
//Field: 0.00
//Label: Phone Number
//Field: Phone Number
//Label: Add a shot description (Optional)
//Field: Write more about your ad...
//Label: Specifications

//Picker: Please select your location
//Label: Your Location
//Location View: Location >> on click opens map
//Check box: By submitting this ad, I agree on {terms & conditions} and {Privacy Policy}
//Label: Once you submit the ad, we will review before publishing. You will be notified once approved
//Button: Continue
//View: Ad Preview
//}
