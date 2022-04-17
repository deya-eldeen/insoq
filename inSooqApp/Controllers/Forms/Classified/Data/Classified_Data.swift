//
//  Classified_Data.swift
//  inSooqApp
//
//  Created by Deya on 11/04/2022.
//

import UIKit

extension Classified_VC {

    //Label: Let's start with the title
    //Label: Try to have an informative title that’s to be point and not very long.
    //Field: Ad Title

    //Label: Now choose the right category for your ad
    //Picker: Please select the category
    //Picker: Please select the subcategory Picker: Please select the item name

    //Button: Continue
    //View: Ad Preview
    
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
        
        let chooseLabel = FormLabel()
        chooseLabel.text = "Now choose the right category for your ad"
        
        //
        let categoryPicker = FormPicker()
        categoryPicker.id = .brand
        categoryPicker.setPlaceHolder("Please select brand")
        
        let subcategoryPicker = FormPicker()
        subcategoryPicker.id = .brand
        subcategoryPicker.setPlaceHolder("Please select brand")
        //

        let formContinueButton = FormContinueButton()
        formContinueButton.setTitle("Continue", for: .normal)
        
        let adPreview = FormPreviewView().render()

        return [
            startLabel,
            tipLabel,
            titleField,
            
            chooseLabel,
            categoryPicker,
            subcategoryPicker,
            
            formContinueButton,
            adPreview
        ]
        
    }

}



