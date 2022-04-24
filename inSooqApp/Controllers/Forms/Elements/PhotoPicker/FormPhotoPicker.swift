//
//  FormPhotoPicker.swift
//  inSooqApp
//
//  Created by Deya on 10/04/2022.
//

import UIKit

class FormPhotoPicker: UIView, FormElement {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    
    @IBOutlet weak var photo1: UIImageView!
    @IBOutlet weak var photo2: UIImageView!
    @IBOutlet weak var photo3: UIImageView!
    @IBOutlet weak var photo4: UIImageView!
    @IBOutlet weak var photo5: UIImageView!
    @IBOutlet weak var photo6: UIImageView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func commonInit() {
        
        self.backgroundColor = .darkGray
        
        self.photo1.contentMode = .scaleAspectFill
        self.photo2.contentMode = .scaleAspectFill
        self.photo3.contentMode = .scaleAspectFill
        self.photo4.contentMode = .scaleAspectFill
        self.photo5.contentMode = .scaleAspectFill
        self.photo6.contentMode = .scaleAspectFill

    }
    
    func render() -> UIView {
        let picker = Bundle(for: FormPhotoPicker.self).loadNibNamed(String(describing: FormPhotoPicker.self), owner: nil, options: nil)![0] as! FormPhotoPicker
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        return picker
    }
}

