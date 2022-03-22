//
//  ContactViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 07/04/2021.
//

import UIKit
import DropDown

class ContactViewController: UIViewController {
    @IBOutlet weak var bottomBar: BottomBar!
    
    @IBOutlet weak var attachFileView: UIView!
    @IBOutlet weak var resonsButton: NiceButton!
    @IBOutlet weak var submitButton: UIButton!

    @IBOutlet weak var descriptionTxv: UITextView!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    var reasonsDropDown=DropDown()
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomBar.setVC(viewController: self)

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
        objectCornerRadius(object: attachFileView, cornerRadius: 10)
        attachFileView.addShadowToView(shadowRadius: 3)
        bottomBorder(object: resonsButton)
        bottomBorder(object: emailTxt)
        bottomBorder(object: nameTxt)
        view.setNeedsLayout()
    }
    private func addTargets(){
        resonsButton.addTarget(self, action: #selector(resonsAction), for: .touchUpInside)
        submitButton.addTarget(self, action: #selector(submitAction), for: .touchUpInside)
    }
    @objc func submitAction(){
        dismiss(animated: true, completion: nil)
    }
    @objc func resonsAction (){
        reasonsDropDown.show()
    }
    private func setupbrandsDropDown() {
        ///Draw Down down list...
        reasonsDropDown.anchorView = reasonsDropDown

        reasonsDropDown.bottomOffset = CGPoint(x: 0, y: resonsButton.bounds.height)

        reasonsDropDown.dataSource = [
            "Help",
            "MyAds",
            "Problem",
            "Sells",
            "Others",
        ]
        
        // Action triggered on selection
        reasonsDropDown.selectionAction = { [weak self] (index, item) in
            self?.resonsButton.setTitle(" \(item)", for: .normal)
        }
    }
    
    
}
