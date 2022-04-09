//
//  Form.swift
//  inSooqApp
//
//  Created by Deya on 09/04/2022.
//

import Foundation
import UIKit

extension Motors_Used_VC {
    
    func formElements() -> [UIView] {
        
        let header = UIView()
        header.frame.size = .init(width: 0, height: 40)
        
        let startLabel = FormLabel()
        startLabel.text = "Let's start with the title"
        
        let titleField = FormField()
        titleField.placeholder = "Ad Title"
        
        let addLabel = FormLabel()
        addLabel.text = "Now let's add your car make and model"
    
        let addSubLabel = FormSubLabel()
        addSubLabel.text = "Try to have an information title that's to be point and not very long."
        
        let brandPicker = FormPicker()
        brandPicker.placeholder = "What brand is your car?"
        
        let modelPicker = FormPicker()
        modelPicker.placeholder = "What model is it?"
        
        let trimPicker = FormPicker()
        trimPicker.placeholder = "What is the trim?"
        
        let yearField = FormField()
        yearField.placeholder = "Year"
        
        let formContinueButton = FormContinueButton()
        formContinueButton.setTitle("Continue", for: .normal)
        
        return [
            header,
            startLabel,
            titleField,
            addLabel,
            addSubLabel,
            brandPicker,
            modelPicker,
            trimPicker,
            yearField,
            formContinueButton
        ]
        
    }
    
}
