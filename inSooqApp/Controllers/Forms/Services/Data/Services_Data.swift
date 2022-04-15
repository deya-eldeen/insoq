//
//  Services_Data.swift
//  inSooqApp
//
//  Created by Deya on 09/04/2022.
//

import UIKit

extension Services_VC {

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
