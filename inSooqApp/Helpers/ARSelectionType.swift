//
//  ARSelectionType.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 17/02/2021.
//

import UIKit
/**
Enum of selection types used for ARSelectableView.

- radio:              selection type radio.
- checkbox:       selection type checkbox.
- tags:               selection type tags.
 
**/

public enum ARSelectionType: Int {

    case radio
    case checkbox
    case tags

    var defaultImage: UIImage {
        switch self {
        case .radio:
            return #imageLiteral(resourceName: "sms_icon")
        case .checkbox, .tags:
            return #imageLiteral(resourceName: "phone_icon")
        }
    }

    var selectedImage: UIImage {
        switch self {
        case .radio:
            return #imageLiteral(resourceName: "plus_button")
        case .checkbox, .tags:
            return #imageLiteral(resourceName: "checked_checkbox")
        }
    }
}
