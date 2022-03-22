//
//  MainNavView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 04/04/2021.
//

import UIKit

class MainNavView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var cityLabel: UILabel!
    
    var vc:UIViewController?
    var indexToScroll:Int=0
    func setVC(viewController:UIViewController)
    {
        self.vc = viewController
        setData()
        setGradientBackground(view: contentView, colorTop: #colorLiteral(red: 0.5490196078, green: 0.3882352941, blue: 0.9058823529, alpha: 1), colorBottom: #colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1))

    }
    
   
    @IBAction func notification_Pressed(_ sender: Any) {
    
        guard let viewController = self.vc else{
            return
        }
        forcePresentViewController(viewController: viewController, storyBoardId: "NotificationsViewController")

    }
    private func setData(){
        cityLabel.text=Statics.defaults.value(forKey: "city") as? String
    }
    
    func xibSetup() {
        
        Bundle.main.loadNibNamed("MainNavView", owner: self, options: nil)
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
