//
//  Jobs_Wanted_Details_Data.swift
//  inSooqApp
//
//  Created by Deya on 11/04/2022.
//

import UIKit

extension Job_Wanted_Details_VC {

    func formElements() -> [UIView] {
        
        let header = UIView()
        header.frame.size = .init(width: 0, height: 40)
        
        let descriptionLabel = FormLabel()
        descriptionLabel.text = "Add a short description (Optional)"
        
        //Upload: Add your cv
    
        let fileView = FormFile().render()
        
        //
        let genderPicker = FormPicker()
        genderPicker.id = .gender
        genderPicker.setPlaceHolder("Gender")
        
        let nationalityPicker = FormPicker()
        nationalityPicker.id = .nationality
        nationalityPicker.setPlaceHolder("Nationality")
        
        let locationPicker = FormPicker()
        locationPicker.setPlaceHolder("Current Location")
        locationPicker.id = .location
        
        let educationPicker = FormPicker()
        educationPicker.id = .educationLevel
        educationPicker.setPlaceHolder("Education Level")
        
        let positionField = FormField()
        positionField.id = .position
        positionField.placeholder = "Current Position"
        
        let workPicker = FormPicker()
        workPicker.id = .workExperience
        workPicker.setPlaceHolder("Work Experience")
        
        let commitmentPicker = FormPicker()
        commitmentPicker.id = .commitment
        commitmentPicker.setPlaceHolder("Commitment")
        
        let noticePicker = FormPicker()
        noticePicker.id = .noticePeriod
        noticePicker.setPlaceHolder("Notice Period")
        
        let visaPicker = FormPicker()
        visaPicker.id = .visaStatus
        visaPicker.setPlaceHolder("Visa Status")
        
        let professionalPicker = FormPicker()
        professionalPicker.id = .professionalLevel
        professionalPicker.setPlaceHolder("Professional Level")
        
        let expectedSalaryPicker = FormPicker()
        expectedSalaryPicker.id = .expectedMonthlySalary
        expectedSalaryPicker.setPlaceHolder("Expected Monthly Salary")
        //

        let locationView = FormLocationView().render()
        
        let acceptView = FormAcceptView().render()

        let formContinueButton = FormContinueButton()
        formContinueButton.setTitle("Continue", for: .normal)
        
        let adPreview = FormPreviewView().render()

        return [
            header,
            descriptionLabel,
            fileView,
            genderPicker,
            nationalityPicker,
            locationPicker,
            educationPicker,
            positionField,
            workPicker,
            commitmentPicker,
            noticePicker,
            visaPicker,
            professionalPicker,
            expectedSalaryPicker,
            locationView,
            acceptView,
            formContinueButton,
            adPreview,
        ]
        
    }

}

//Label: Add a shot description (Optional)
//Field: Write more about your ad...



//Label: Your Location
//Location View: Location >> on click opens map
//Check box: By submitting this ad, I agree on {terms & conditions} and {Privacy
//Policy}
//Label: Once you submit the ad, we will review before publishing. You will be
//notified once approved
//Button: Continue
//View: Ad Preview

