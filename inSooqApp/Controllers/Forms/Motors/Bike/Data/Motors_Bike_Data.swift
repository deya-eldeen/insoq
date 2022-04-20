//
//  Motors_Machinery_Bike_Data.swift
//  inSooqApp
//
//  Created by Deya on 11/04/2022.
//

import UIKit

extension Motors_Bike_VC {

    func formElements() -> [UIView] {
        
        let header = UIView()
        header.frame.size = .init(width: 0, height: 40)
        
        let startLabel = FormLabel()
        startLabel.text = "Let's start with the title"
        
        let addSubLabel = FormSubLabel()
        addSubLabel.text = "Try to have an information title that's to be point and not very long."
        
        let titleField = FormField()
        titleField.id = .title
        titleField.placeholder = "Ad Title"
        
        let addLabel = FormLabel()
        addLabel.text = "Now let's add your bike make and model"
    
        let categoryPicker = FormPicker()
        categoryPicker.setPlaceHolder("What is your bike category?")
        categoryPicker.id = .bikeCategory
        
        let subcategoryPicker = FormPicker()
        subcategoryPicker.setPlaceHolder("What is your bike subcategory?")
        subcategoryPicker.id = .bikeSubcategory
        
        let yearField = FormField()
        yearField.id = .year
        yearField.placeholder = "Year"
        yearField.keyboardType = .numberPad
        
        let formContinueButton = FormContinueButton()
        formContinueButton.setTitle("Continue", for: .normal)
        
        let adPreview = FormPreviewView().render()

        return [
            header,
            startLabel,
            addSubLabel,
            titleField,
            addLabel,
            categoryPicker,
            subcategoryPicker,
            yearField,
            formContinueButton,
            adPreview
        ]
        
    }

}

//Label: Let's start with the title
//Label: Try to have an informative title that’s to be point and not very long.
//Field: Ad Title

//Label: Now let's Add your boat make and model
//Picker: What is your bike category?
//Picker: What is your bike subcategory?

//Field: Year
//Button: Continue

