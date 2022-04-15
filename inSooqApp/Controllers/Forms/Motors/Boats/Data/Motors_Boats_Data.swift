//
//  Motors_Boats_Data.swift
//  inSooqApp
//
//  Created by Deya on 11/04/2022.
//

import UIKit

extension Motors_Boats_VC {
    
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
        addLabel.text = "Now let's add your boat make and model"

        let categoryPicker = FormPicker()
        categoryPicker.setPlaceHolder("What is your boat category?")
        categoryPicker.id = .boatCategory
        
        let subcategoryPicker = FormPicker()
        subcategoryPicker.setPlaceHolder("What is your boat subcategory?")
        subcategoryPicker.id = .boatSubcategory
        
        let yearField = FormField()
        yearField.id = .year
        yearField.placeholder = "Year"
        yearField.keyboardType = .numberPad
        
        let formContinueButton = FormContinueButton()
        formContinueButton.setTitle("Continue", for: .normal)
        
        return [
            header,
            startLabel,
            addSubLabel,
            titleField,
            addLabel,
            categoryPicker,
            subcategoryPicker,
            yearField,
            formContinueButton
        ]
    }

    
}
