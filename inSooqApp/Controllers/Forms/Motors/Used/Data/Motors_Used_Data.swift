//
//  Form.swift
//  inSooqApp
//
//  Created by Deya on 09/04/2022.
//

import UIKit

extension Motors_Used_VC {
    
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
        addLabel.text = "Now let's add your car make and model"
    
        let brandPicker = FormPicker()
        brandPicker.setPlaceHolder("What brand is your car?")
        brandPicker.id = .carBrand
        
        let modelPicker = FormPicker()
        modelPicker.setPlaceHolder("What model is it?")
        modelPicker.id = .model
        
        let trimPicker = FormPicker()
        trimPicker.setPlaceHolder("What is the trim?")
        trimPicker.id = .trim
        
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
            brandPicker,
            modelPicker,
            trimPicker,
            yearField,
            formContinueButton,
            adPreview
        ]
        
    }
    
}
