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

        let adPreview = FormPreviewView().render()

        return [
            header,
            adPreview
        ]

    }

}

//Label: Add a shot description (Optional)
//Field: Write more about your ad...
//Upload: Add your cv
//Picker: Gender
//Picker: Nationality
//Picker: Current Location
//Picker: Education Level
//Filed: Current Position
//
//Picker: Work Experience
//Picker: Commitment
//Picker: Notice Period
//Picker: Visa Status
//Picker: Professional Level
//Picker: Expected Monthly Salary
//Label: Your Location
//Location View: Location >> on click opens map
//Check box: By submitting this ad, I agree on {terms & conditions} and {Privacy
//Policy}
//Label: Once you submit the ad, we will review before publishing. You will be
//notified once approved
//Button: Continue
//View: Ad Preview

