//
//  Services_Others_Data.swift
//  inSooqApp
//
//  Created by Deya on 11/04/2022.
//

import UIKit

extension Services_Others_VC {

    func formElements() -> [UIView] {
        
        let header = UIView()
        header.frame.size = .init(width: 0, height: 40)
        
        let addTitle = FormLabel()
        addTitle.text = "Let's start with the title"
        
        let tipLabel = FormSubLabel()
        tipLabel.text = "Try to have an informative title that’s to be point and not very long."
        tipLabel.textColor = self.formDarkGray
        
        let titleField = FormField()
        titleField.id = .price
        titleField.placeholder = "Ad Title"

        let categoryPicker = FormPicker()
        categoryPicker.setPlaceHolder("What is your service category?")
        categoryPicker.id = .category
        
        let phoneNumberField = FormField()
        phoneNumberField.id = .phoneNumber
        phoneNumberField.placeholder = "Phone Number"
        phoneNumberField.keyboardType = .phonePad
        
        let descriptionLabel = FormLabel()
        descriptionLabel.text = "Add a short description (Optional)"
        
        let description = FormTextView().render(placeholder: "Write more about your ad...")

        let specificationsLabel = FormLabel()
        specificationsLabel.text = "Specifications"
        
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
            addTitle,
            tipLabel,
            titleField,
            categoryPicker,
            phoneNumberField,
            descriptionLabel,
            description,
            specificationsLabel,
            locationPicker,
            locationView,
            acceptView,
            formContinueButton,
            adPreview
        ]
        
    }

}
