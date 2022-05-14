//
//  Jobs_Wanted_Data.swift
//  inSooqApp
//
//  Created by Deya on 11/04/2022.
//

import UIKit

extension Job_Wanted_VC {

    func formElements() -> [UIView] {
        let header = UIView()
        header.frame.size = .init(width: 0, height: 40)
        
        let startLabel = FormLabel()
        startLabel.text = "Let's start with the title"
        
        let addSubLabel = FormSubLabel()
        addSubLabel.text = "Try to have an information title that's to be point and not very long."
        addSubLabel.textColor = self.formDarkGray
        
        let titleField = FormField()
        titleField.id = .title
        titleField.placeholder = "Ad Title"
        
        let addLabel = FormLabel()
        addLabel.text = "Looks good, now please add more details..."

        //
        let typePicker = FormPicker()
        typePicker.setPlaceHolder("Job type")
        typePicker.id = .jobType
        //
        
        let phoneField = FormField()
        phoneField.id = .phoneNumber
        phoneField.placeholder = "Phone Number"
        phoneField.keyboardType = .phonePad
        
        let jobTitleField = FormField()
        jobTitleField.id = .jobTitle
        jobTitleField.placeholder = "Job Title"
        
        let formContinueButton = FormContinueButton()
        formContinueButton.setTitle("CONTINUE", for: .normal)
        
        return [
            header,
            startLabel,
            addSubLabel,
            titleField,
            addLabel,
            typePicker,
            phoneField,
            jobTitleField,
            formContinueButton,header,
        ]
        
    }

}

//Label: Let's start with the title
//Label: Try to have an informative title that’s to be point and not very long.
//Field: Ad Title

//Label: Looks good, now please add more details...

//Label: Job Type
//Picker: Job type

//Label: Phone Number
//Field: Phone Number

//Label: Job Title
//Field: Job title

//Button: Continue
