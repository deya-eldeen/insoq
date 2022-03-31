//  Localize.swift
//  Created by deyaeldeen

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

