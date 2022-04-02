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
        
        ApiRequests.advertisingBudgetsList { r in
            self.reasonsDropDown.dataSource = r.value?.compactMap { $0.en_Text }  ?? []
        }
        
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
        
//        let params = [
//            "Email": self.emailTxt.text ?? "",
//            "FirstName": self._FirstNameTxt.text ?? "",
//            "LastName": self._LastNameTxt.text ?? "",
//            "Phone": self._PhoneNumberTxt.text ?? "",
//            "AdvertisingBudgetId":self.reasonsDropDown.dataSource.first ?? "",
//            "Company": self._CompanyNameTxt.text ?? "",
//            "Description": "_",
//        ]
        
        let params = [
            "Email": "a@b.com",
            "FirstName": "some name",
            "LastName": "some last name",
            "Phone": "0797228550",
            "AdvertisingBudgetId":"88",
            "Company": "A",
            "Description": "Desc",
        ]
        
        ApiRequests.submitAdvertisment(params: params) { response in
            print("response",response)
            self.dismiss(animated: true, completion: nil)
        }
        
        
    }
    
    @objc func adsBudgetAction (){
        reasonsDropDown.show()
    }
    
    private func setupbrandsDropDown() {
        ///Draw Down down list...
        reasonsDropDown.anchorView = adsBudget

        reasonsDropDown.bottomOffset = CGPoint(x: 0, y: adsBudget.bounds.height)

        reasonsDropDown.dataSource = []
        
        // Action triggered on selection
        reasonsDropDown.selectionAction = { [weak self] (index, item) in
            self?.adsBudget.setTitle(" \(item)", for: .normal)
        }
    }
    
}
