//
//  FormPreviewView.swift
//  inSooqApp
//
//  Created by Deya on 13/04/2022.
//

import UIKit

class FormPreviewView: UIView, FormElement {
    
    @IBOutlet weak var adTitleLabel: UILabel!
    @IBOutlet weak var adLocationLabel: UILabel!
    
    @IBOutlet weak var attribute1KeyIcon: UIImageView!
    @IBOutlet weak var attribute2KeyIcon: UIImageView!
    @IBOutlet weak var attribute3KeyIcon: UIImageView!

    @IBOutlet weak var attribute1ValueLabel: UILabel!
    @IBOutlet weak var attribute2ValueLabel: UILabel!
    @IBOutlet weak var attribute3ValueLabel: UILabel!

    @IBOutlet weak var attributeStack1: UIStackView!
    @IBOutlet weak var attributeStack2: UIStackView!
    @IBOutlet weak var attributeStack3: UIStackView!
    
    @IBOutlet weak var priceLabel: UILabel!

    @IBOutlet weak var adImage: UIImageView!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func commonInit() {
        self.backgroundColor = .darkGray
    }
    
    func renderIcons(iconNames: [String], values: [String], price: String = "") {
        
        guard iconNames.count <= 3 else { return }
        guard values.count <= 3 else { return }

        let zippedDetails = zip(iconNames, values)
        
        let keyImageViews = [attribute1KeyIcon, attribute2KeyIcon, attribute3KeyIcon]
        let attributedLabels = [attribute1ValueLabel, attribute2ValueLabel, attribute3ValueLabel]

        for (index,pair) in zippedDetails.enumerated() {
            keyImageViews[index]?.image = UIImage(named: pair.0)
            attributedLabels[index]?.text = pair.1
            
            keyImageViews[index]?.isHidden = false
            attributedLabels[index]?.isHidden = false
            
        }
        
        priceLabel.text = "AED " + price
        
    }
    
    func render() -> UIView {
        let targetView = Bundle(for: FormPreviewView.self).loadNibNamed(String(describing: FormPreviewView.self), owner: nil, options: nil)![0] as! FormPreviewView
        targetView.translatesAutoresizingMaskIntoConstraints = false
        return targetView
    }
    
}

