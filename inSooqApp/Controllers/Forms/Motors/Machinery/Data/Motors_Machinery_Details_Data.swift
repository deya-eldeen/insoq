//
//  Motors_Machinery_Details_Data.swift
//  inSooqApp
//
//  Created by Deya on 11/04/2022.
//

import UIKit

extension Motors_Machinery_Details_VC {
    
    func formElements() -> [UIView] {
        
        let header = UIView()
        header.frame.size = .init(width: 0, height: 40)
        
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
        
        let milageField = FormField()
        milageField.placeholder = "Milage (Km)"
        milageField.keyboardType = .numberPad

        let warrantyPicker = FormPicker()
        warrantyPicker.setPlaceHolder("Under Warranty")
        warrantyPicker.id = .numberOfDoors

        // pickers
        let fuelTypePicker = FormPicker()
        fuelTypePicker.setPlaceHolder("Please Select Fuel Type")
        fuelTypePicker.id = .fuelType
        
        let cylindersPicker = FormPicker()
        cylindersPicker.setPlaceHolder("Please Select Cylinders")
        cylindersPicker.id = .cylinders
        
        let horsePowerPicker = FormPicker()
        horsePowerPicker.setPlaceHolder("Please Select Horse Power")
        horsePowerPicker.id = .horsePower
        
        let conditionPicker = FormPicker()
        conditionPicker.setPlaceHolder("Please Select Condition")
        conditionPicker.id = .condition
        
        let sellerTypePicker = FormPicker()
        sellerTypePicker.setPlaceHolder("Please Select Seller Type")
        sellerTypePicker.id = .sellerType
        
        let machineryPicker = FormPicker()
        machineryPicker.setPlaceHolder("Please Select Machinery")
        machineryPicker.id = .machinery
        
        let locationPicker = FormPicker()
        locationPicker.setPlaceHolder("Location")
        locationPicker.id = .location
        
        let locationView = FormLocationView().render()
        
        let acceptView = FormAcceptView().render()

        let formContinueButton = FormContinueButton()
        formContinueButton.setTitle("Continue", for: .normal)
        
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
            warrantyPicker,
            
            fuelTypePicker,
            cylindersPicker,
            horsePowerPicker,
            conditionPicker,
            sellerTypePicker,
            machineryPicker,

            locationPicker,
            locationView,
            acceptView,
            formContinueButton,
            adPreview
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
//Picker: Please Select Capacity
//Field: Milage (km)
//Picker: Under Warranty?

//Picker: Please select fuel type
//Picker: Please select cylinders
//Picker: Please select horse-power
//Picker: Please select condition
//Picker: Please select seller type
//Picker: Please select machinery

//Picker: Please select location
//Label: Your Location
//Location View: Location >> on click opens map
//Check box: By submitting this ad, I agree on {terms & conditions} and {Privacy
//Policy}
//Label: Once you submit the ad, we will review before publishing. You will be
//notified once approved
//Button: Continue

