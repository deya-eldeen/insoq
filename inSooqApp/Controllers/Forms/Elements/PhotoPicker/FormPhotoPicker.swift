//
//  FormPhotoPicker.swift
//  inSooqApp
//
//  Created by Deya on 10/04/2022.
//

import UIKit

class FormPhotoPicker: UIView, FormElement {
    
    var images = [UIImage]()
    
    var mainImageIndex: Int?
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    @IBOutlet weak var buttonSelect1: UIButton!
    @IBOutlet weak var buttonSelect2: UIButton!
    @IBOutlet weak var buttonSelect3: UIButton!
    @IBOutlet weak var buttonSelect4: UIButton!
    @IBOutlet weak var buttonSelect5: UIButton!
    @IBOutlet weak var buttonSelect6: UIButton!
    @IBOutlet weak var buttonSelect7: UIButton!
    @IBOutlet weak var buttonSelect8: UIButton!
    @IBOutlet weak var buttonSelect9: UIButton!
    
    @IBOutlet weak var buttonAdd: UIButton!

    @IBOutlet weak var photo1: UIImageView!
    @IBOutlet weak var photo2: UIImageView!
    @IBOutlet weak var photo3: UIImageView!
    @IBOutlet weak var photo4: UIImageView!
    @IBOutlet weak var photo5: UIImageView!
    @IBOutlet weak var photo6: UIImageView!
    @IBOutlet weak var photo7: UIImageView!
    @IBOutlet weak var photo8: UIImageView!
    @IBOutlet weak var photo9: UIImageView!

    @IBAction func didTapAddPhoto() {

    }
    
    func renderPhotos() {
        let photos = [photo1, photo2, photo3, photo4, photo5, photo6, photo7, photo8, photo9]
        
        let selectButtons = [buttonSelect1, buttonSelect2, buttonSelect3, buttonSelect4, buttonSelect5, buttonSelect6, buttonSelect7, buttonSelect8, buttonSelect9]

        if let mainImageIndex = mainImageIndex {
            for sb in selectButtons {
                sb?.alpha = 0.02
            }
            
            selectButtons[mainImageIndex]?.alpha = 1.0
        }
        
        for photo in photos {
            photo?.image = nil
            photo?.setNeedsDisplay()
        }
        
        for (index, image) in self.images.enumerated() {
            photos[index]?.image = image
            photos[index]?.setNeedsDisplay()
        }
        
        
    }
    
    func appendImage(image: UIImage) {
        self.images.append(image)
        renderPhotos()
        
    }
    
    @IBAction func didTapSelect(sender: UIButton) {
        
        let index = sender.tag - 1
        self.mainImageIndex = index

        print("_index",index)
        
        renderPhotos()
        
    }
    
    @IBAction func didTapDelete(sender: UIButton) {
        
        let index = sender.tag - 1
        
        print("_index",index)
        if index >= images.startIndex && index < images.endIndex {
            print("images_before",images)
            self.images.remove(at: index)
            print("images_after",images)
            self.renderPhotos()
        }
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
                
        for photo in [photo1, photo2, photo3, photo4, photo5, photo6, photo7, photo8, photo9] {
            photo?.contentMode = .scaleAspectFill
        }
        
    }
    
    func render() -> UIView {
        let picker = Bundle(for: FormPhotoPicker.self).loadNibNamed(String(describing: FormPhotoPicker.self), owner: nil, options: nil)![0] as! FormPhotoPicker
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }
    
}



