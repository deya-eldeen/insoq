//
//  Motors_Machinery_Export_Details_Data.swift
//  inSooqApp
//
//  Created by Deya on 11/04/2022.
//

import UIKit

extension Motors_Export_Details_VC {

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
        
        let milageField = FormField()
        milageField.placeholder = "Milage (Km)"
        milageField.keyboardType = .numberPad
        
        //
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
        //
        
        let locationView = FormLocationView().render()
        
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
//Picker: Regional Specs
//Picker: Color
//Picker: Number of doors
//Picker: Under Warranty?

//Picker: Please select transmission
//Picker: Please select body type
//Picker: Please select fuel type
//Picker: Please select cylinders
//Picker: Please select steering side
//Picker: Please select horse-power

//Picker: Please select location
//Label: Your Location
//Location View: Location >> on click opens map
//Check box: By submitting this ad, I agree on {terms & conditions} and {Privacy
//Policy}
//
//Label: Once you submit the ad, we will review before publishing. You will be
//notified once approved
//Button: Continue
//View: Ad Preview
