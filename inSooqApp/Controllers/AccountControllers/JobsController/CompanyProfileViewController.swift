//
//  CompanyProfileViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 15/04/2021.
//

import UIKit
import DropDown
class CompanyProfileViewController: UIViewController {
    @IBOutlet weak var topBar: TopNavigationbar!
    @IBOutlet weak var sizeButton: NiceButton!
    @IBOutlet weak var bottomBar: BottomBar!
    @IBOutlet weak var industryButton: NiceButton!
    @IBOutlet weak var descriptionTxt: UITextView!
    @IBOutlet var shadowViews: [UIView]!
    
    let sizeDropDown = DropDown()
    let industryDropDown = DropDown()
    var now=Date()
    var motorObject=MotorsModel(itemDate: "", itemPriceLabel: "", itemYear: "", itemKM: "", itemLocationLabel: "", itemNameLabel: "", isFavorite: false, itemImages: Statics.adsArray)
    lazy var dropDowns: [DropDown] = {
        return [
            self.sizeDropDown,
            self.industryDropDown
        ]
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        bottomBar.setVC(viewController: self)
        topBar.setVC(viewController: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        for v in shadowViews{
            v.addShadowToView()
        }
        setupbrandsDropDown()
        setDropDownTargets()
        descriptionTxt.addShadowToView()
    }
   
    @IBAction func back_Pressed(_ sender: Any) {
        dismiss(animated: true) {
            clearViewData(controller: self)
        }
    }
    @IBAction func updateProfile_Pressed(_ sender: Any) {
        dismiss(animated: true) {
            clearViewData(controller: self)
        }

    }
    
    private func setDropDownTargets(){
        sizeButton.addTarget(self, action: #selector(sizeAction), for: .touchUpInside)
        industryButton.addTarget(self, action: #selector(industryAction), for: .touchUpInside)
        
    }
    @objc func sizeAction (){
        sizeDropDown.show()
    }
    @objc func industryAction (){
        industryDropDown.show()
    }

    private func setupbrandsDropDown() {
        ///Draw Down down list...
        sizeDropDown.anchorView = sizeButton
        industryDropDown.anchorView = industryButton
        //if you want the list to cover the screen set it industryDropDown.anchorView=((((((industryDropDown))))))

        sizeDropDown.bottomOffset = CGPoint(x: 0, y: sizeButton.bounds.height)
        industryDropDown.bottomOffset = CGPoint(x: 0, y: industryButton.bounds.height)

        
        
        sizeDropDown.dataSource = [
            "i.e 1",
            "i.e 2",
            "i.e 3"
        ]
        
        industryDropDown.dataSource = [
            "i.e 1",
            "i.e 2",
            "i.e 3"
        ]

        // Action triggered on selection
        sizeDropDown.selectionAction = { [weak self] (index, item) in
            self?.sizeButton.setTitle(" \(item)", for: .normal)
        }
        // Action triggered on selection
        industryDropDown.selectionAction = { [weak self] (index, item) in
            self?.industryButton.setTitle(" \(item)", for: .normal)
        }
    }
}
