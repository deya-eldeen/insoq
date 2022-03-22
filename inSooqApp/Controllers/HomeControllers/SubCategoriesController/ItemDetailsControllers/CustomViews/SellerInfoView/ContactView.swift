//
//  ContactView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 15/06/2021.
//

import UIKit

class ContactView: UIView {

    @IBOutlet weak var smsButton: UIButton!
    
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet var contentView: UIView!
 
    @IBOutlet weak var smsView: UIView!
    @IBOutlet weak var phoneView: UIView!
    //@IBOutlet weak var locationInfoView: UIView!
  //  @IBOutlet weak var contactlabel: UILabel!
    var icons=FontAwesomeIcons()
    var vc:UIViewController?
    func setVC(viewController:UIViewController)
    {
        
        self.vc = viewController
            if ((viewController.isKind(of: DetailsViewController.self)) )
        {
            if let vcMainControllor:DetailsViewController = vc as? DetailsViewController{
                setDesign()
            }
            
        }
        
    }
    private func setDesign(){
        
       // objectShadow(object: locationInfoView, cornerRadius: 5)
       // objectCornerRadiussha
    //    shadowView.addShadowToView(shadowRadius: 4)

        addLeftBorder(object: phoneView, xPoint: 0, yPoint: 0)
        addLeftBorder(object: smsView, xPoint: 0, yPoint: 0)

        //contactlabel.clipsToBounds=true
    }
    
    func xibSetup() {
        Bundle.main.loadNibNamed("ContactView", owner: self, options: nil)
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
    func setViewData(){

    }

}
