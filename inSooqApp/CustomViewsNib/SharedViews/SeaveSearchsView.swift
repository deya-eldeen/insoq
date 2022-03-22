//
//  SeaveSearchsView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 15/06/2021.
//

import UIKit

class SeaveSearchsView: UIView {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
   
    @IBOutlet var contentView: UIView!
    var vc:UIViewController?
    func setVC(viewController:UIViewController,isSaved:Bool)
    {
        if isSaved{
            titleLabel.text="Send me email when ads matches this search."
            actionButton.setTitle("Save", for: .normal)
        }else{
            titleLabel.text="Already saved this search."
            actionButton.setTitle("Delete", for: .normal)
            
        }
        enabelBtns(enable: true)
        setDesign()
    }
    private func enabelBtns(enable:Bool){
        cancelButton.isEnabled=enable
        actionButton.isEnabled=enable
    }
    private func setDesign(){
        contentView.layer.cornerRadius=10
        contentView.addShadowToView()
        actionButton.addShadowToView(shadowRadius: 3)
    }
    func xibSetup() {
        
        Bundle.main.loadNibNamed("SeaveSearchsView", owner: self, options: nil)
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
