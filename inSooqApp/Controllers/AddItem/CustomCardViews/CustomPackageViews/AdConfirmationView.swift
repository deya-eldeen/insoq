//
//  AdConfirmationView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 19/05/2021.
//

import UIKit

class AdConfirmationView: UIView {
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet var contentView: UIView!
    
    var vc:UIViewController?
    func setVC(viewController:UIViewController)
    {
        setDesigns()
    }
    func setDesigns(){
        objectCornerRadiusShadow(with: contentView)
        objectCornerRadius(object: continueButton, cornerRadius: continueButton.height/2)
    }
    func xibSetup() {
        
        Bundle.main.loadNibNamed("AdConfirmationView", owner: self, options: nil)
        contentView.frame = bounds
        contentView.autoresizingMask =
            [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        
    }
    
    }



