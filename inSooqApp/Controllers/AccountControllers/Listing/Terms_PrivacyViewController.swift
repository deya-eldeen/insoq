//
//  Terms_PrivacyViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 31/03/2021.
//

import UIKit

class Terms_PrivacyViewController: UIViewController {
    
    @IBOutlet weak var topBar: TopNavigationbar!
    @IBOutlet weak var headeTitle: UILabel!
    @IBOutlet weak var bottomView: BottomBar!
    @IBOutlet weak var vcBody: UILabel!
    static var isTerms:Bool=false
    static var _hideBottomView:Bool=true
    static var index:Int=0
    override func viewDidLoad() {
        super.viewDidLoad()
        topBar.setVC(viewController: self)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        if !Terms_PrivacyViewController._hideBottomView{
            bottomView.setVC(viewController: self)
            bottomView.isHidden=false
        }else{
            bottomView.isHidden=true
        }
        checkData(index: Terms_PrivacyViewController.index)
    }
    @IBAction func back_Pressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    private func checkData(index:Int){
        
        //Switch api to call..
        switch  index{
        case 0://Fitch Terms and conditions
            debugPrint("Fitch Terms and conditions ")
            headeTitle.text="Your Privacy is \n our Priority."
            topBar.titleLabel.text="Privacy Policy"
     
            break
        case 1://Fitch Privacy Policy
            debugPrint("Fitch Privacy Policy ")
            headeTitle.text="Our terms & conditions \n protect You."
            topBar.titleLabel.text="Terms & Conditions"
            break
        case 2://Fitch Terms and conditions
            debugPrint("Fitch About Insouq ")
            headeTitle.text="Get to know \n INSOUQ!."
            topBar.titleLabel.text="About InSooq"
            break

        case 3://Fitch Terms and conditions
            debugPrint("Fitch Support")
            headeTitle.text="Contact Support \n INSOUQ!."
            topBar.titleLabel.text="Support"
            break

        default:
            debugPrint("Non of the above,... show Action alert and dismiss")
        }
    }
    
}
