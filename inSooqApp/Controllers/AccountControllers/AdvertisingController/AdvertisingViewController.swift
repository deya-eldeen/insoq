//
//  AdvertisingViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 03/06/2021.
//

import UIKit
import DropDown
class AdvertisingViewController: UIViewController {
    @IBOutlet weak var bottomBar: BottomBar!
    
    @IBOutlet weak var adsBudget: NiceButton!
    @IBOutlet weak var submitButton: UIButton!

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var _FirstNameTxt: UITextField!
    @IBOutlet weak var _LastNameTxt: UITextField!
    @IBOutlet weak var _PhoneNumberTxt: UITextField!
    @IBOutlet weak var _CompanyNameTxt: UITextField!
    
    var reasonsDropDown=DropDown()

    override func viewDidLoad() {
        super.viewDidLoad()
        bottomBar.setVC(viewController: self)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        addTargets()
        setupbrandsDropDown()

    }
    override func viewDidLayoutSubviews() {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        setDesign()
        CATransaction.commit()
    }

    @IBAction func back_Pressed(_ sender: Any) {
        dismiss(animated: true) {
            clearViewData(controller: self)
        }
    }
    //MARK:-Private Methods-
    private func setDesign(){
        view.layoutIfNeeded()

        bottomBorder(object: adsBudget)
        bottomBorder(object: emailTxt)
        bottomBorder(object: _FirstNameTxt)
        bottomBorder(object: _LastNameTxt)
        bottomBorder(object: _PhoneNumberTxt)
        bottomBorder(object: _CompanyNameTxt)
        view.setNeedsLayout()
    }
    private func addTargets(){
        adsBudget.addTarget(self, action: #selector(adsBudgetAction), for: .touchUpInside)
        submitButton.addTarget(self, action: #selector(submitAction), for: .touchUpInside)
    }
    @objc func submitAction(){
        dismiss(animated: true, completion: nil)
    }
    @objc func adsBudgetAction (){
        reasonsDropDown.show()
    }
    private func setupbrandsDropDown() {
        ///Draw Down down list...
        reasonsDropDown.anchorView = adsBudget

        reasonsDropDown.bottomOffset = CGPoint(x: 0, y: adsBudget.bounds.height)

        reasonsDropDown.dataSource = [
            "100-300 AED",
            "500-1000 AED",
            "1000-3000 AED",
            "3000-10000 AED",
            "Others",
        ]
        
        // Action triggered on selection
        reasonsDropDown.selectionAction = { [weak self] (index, item) in
            self?.adsBudget.setTitle(" \(item)", for: .normal)
        }
    }
    
    
}
