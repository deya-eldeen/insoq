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
        
        let header = SpacerView().render()
        
        let startLabel = FormLabel()
        startLabel.text = "Let's start with the title"
        
        let tipLabel = FormSubLabel()
        tipLabel.text = "Try to have an informative title that’s to be point and not very long."
        tipLabel.textColor = self.formDarkGray

        let titleField = FormField()
        titleField.id = .title
        titleField.placeholder = "Ad Title"
        
        let chooseLabel = FormLabel()
        chooseLabel.text = "Now choose the right category for your ad"
        
        //
        let categoryPicker = FormPicker()
        categoryPicker.id = .category
        categoryPicker.setPlaceHolder("Please select category")
        
        let subcategoryPicker = FormPicker()
        subcategoryPicker.id = .subcategory
        subcategoryPicker.setPlaceHolder("Please select subcategory")
        //

        let formContinueButton = FormContinueButton()
        formContinueButton.setTitle("CONTINUE", for: .normal)
        
        let adPreview = FormPreviewView().render()

        return [
            header,

            startLabel,
            tipLabel,
            titleField,
            
            chooseLabel,
            categoryPicker,
            subcategoryPicker,
            
            formContinueButton,
            adPreview,
        ]
        
    }

}



