//
//  Motors_Machinery_Bike_Details_Data.swift
//  inSooqApp
//
//  Created by Deya on 11/04/2022.
//

import UIKit

extension Motors_Bike_Details_VC {

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
        
        let engineSizePicker = FormPicker()
        engineSizePicker.setPlaceHolder("Engine Size")
        engineSizePicker.id = .engineSize

        let colorPicker = FormPicker()
        colorPicker.setPlaceHolder("Color")
        colorPicker.id = .color
        
        let warrantyPicker = FormPicker()
        warrantyPicker.setPlaceHolder("Warranty")
        warrantyPicker.id = .warranty
        
        let fuelTypePicker = FormPicker()
        fuelTypePicker.setPlaceHolder("Please select fuel type")
        fuelTypePicker.id = .fuelType
        
        let cylindersPicker = FormPicker()
        cylindersPicker.setPlaceHolder("Please select cylinders")
        cylindersPicker.id = .cylinders
        
        let wheelsPicker = FormPicker()
        wheelsPicker.setPlaceHolder("Please select wheels")
        wheelsPicker.id = .wheels
        
        let usagePicker = FormPicker()
        usagePicker.setPlaceHolder("Please select usage")
        usagePicker.id = .usage
        
        let sellerTypePicker = FormPicker()
        sellerTypePicker.setPlaceHolder("Please select seller type")
        sellerTypePicker.id = .sellerType
        
        let drivePicker = FormPicker()
        drivePicker.setPlaceHolder("Please select final drive system")
        drivePicker.id = .finalDriveSystem
        
        
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
            engineSizePicker,
            colorPicker,
            warrantyPicker,
            fuelTypePicker,
            cylindersPicker,
            wheelsPicker,
            usagePicker,
            sellerTypePicker,
            drivePicker,
            
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

//Field: Milage (km)
//Picker: Please select engine size
//Picker: Color
//Picker: Under Warranty?
//Picker: Please select fuel type
//Picker: Please select cylinders
//Picker: Please select wheels
//Picker: Please select usage
//Picker: Please select seller type
//Picker: Please select final drive system
//Picker: Please select location

//Label: Your Location
//Location View: Location >> on click opens map
//Check box: By submitting this ad, I agree on {terms & conditions} and {Privacy
//Policy}
//Label: Once you submit the ad, we will review before publishing. You will be
//notified once approved
//Button: Continue
//View: Ad Preview
