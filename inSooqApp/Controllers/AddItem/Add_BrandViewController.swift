//
//  Add_BrandViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 01/03/2021.
//

import UIKit
import DropDown

class Add_BrandViewController: UIViewController {
   static var motorO:MotorsModel!
    @IBOutlet weak var bottomView: BottomBar!
    @IBOutlet weak var carYearButton: NiceButton!
    @IBOutlet weak var brandButton: NiceButton!
    @IBOutlet weak var modelButton: NiceButton!
    @IBOutlet weak var cardView: UIView!
    
    let brandsDropDown = DropDown()
    let modelsDropDown = DropDown()
    let yearsDropDown = DropDown()
    var now=Date()
    var motorObject=MotorsModel(itemDate: "", itemPriceLabel: "", itemYear: "", itemKM: "", itemLocationLabel: "", itemNameLabel: "", isFavorite: false, itemImages: Statics.adsArray)
    lazy var dropDowns: [DropDown] = {
        return [
            self.brandsDropDown,
            self.modelsDropDown,
            self.yearsDropDown
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomView.setVC(viewController: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        setDropDownData()
        setupbrandsDropDown()
        registerViews()
        motorObject=Add_BrandViewController.motorO
        debugPrint("motorsObjectt " , motorObject)
        registerViews()
    }
    @IBAction func back_Pressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continue_Pressed(_ sender: Any) {
//        Add_FullSpecesViewController.motorO=motorObject

        performSegue(withIdentifier: "SpecificationsSegue", sender: nil)
    }
    private func setDropDownData(){
        brandButton.addTarget(self, action: #selector(brandsAction), for: .touchUpInside)
        modelButton.addTarget(self, action: #selector(modelsAction), for: .touchUpInside)
        carYearButton.addTarget(self, action: #selector(yearsAction), for: .touchUpInside)
        
    }
    @objc func brandsAction (){
        brandsDropDown.show()
    }
    @objc func modelsAction (){
        modelsDropDown.show()
    }
    @objc func yearsAction (){
        yearsDropDown.show()
    }

    private func setupbrandsDropDown() {
        ///Draw Down down list...
        brandsDropDown.anchorView = brandButton
        modelsDropDown.anchorView = modelButton
        yearsDropDown.anchorView = carYearButton
        //if you want the list to cover the screen set it yearsDropDown.anchorView=((((((yearsDropDown))))))

        brandsDropDown.bottomOffset = CGPoint(x: 0, y: brandButton.bounds.height)
        modelsDropDown.bottomOffset = CGPoint(x: 0, y: modelButton.bounds.height)
        yearsDropDown.bottomOffset = CGPoint(x: 0, y: carYearButton.bounds.height)

        brandsDropDown.dataSource = [
            "BMW",
            "KIA",
            "Honda",
            "Brand-A",
            "Brand-B",
            "BMW",
            "KIA",
            "Honda",
            "Brand-A",
            "Brand-B",
            "KIA",
            "Honda",
            "Brand-A",
            "Brand-B",
            "BMW",
            "KIA",
            "Honda",
            "Brand-A",
            "Brand-B",
            "Brand-C"
        ]
        
        
        modelsDropDown.dataSource = [
            "i 3",
            "i 8",
            "x 5",
            "x 6",
            "230 i",
        ]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let currentYear = dateFormatter.string(from: now)
        yearsDropDown.dataSource=getYearBetween(from: "01/01/1950", to: currentYear)
        
        
        // Action triggered on selection
        brandsDropDown.selectionAction = { [weak self] (index, item) in
            self?.brandButton.setTitle(" \(item)", for: .normal)
        }
        // Action triggered on selection
        modelsDropDown.selectionAction = { [weak self] (index, item) in
            self?.modelButton.setTitle(" \(item)", for: .normal)
        }
        // Action triggered on selection
        yearsDropDown.selectionAction = { [weak self] (index, item) in
            self?.carYearButton.setTitle(" \(item)", for: .normal)
            self?.reDrawCardView(data: item)
        }
    }
    private func reDrawCardView(data:String){
        motorObject.itemYear=data
        debugPrint("AA-motor name",motorObject.itemYear)
        let v1 = cardView
        
        if  v1?.subviews.count ?? 0 > 0
        {
            for vTemp in v1!.subviews
            {
                debugPrint("view is removed",vTemp)
                vTemp.removeFromSuperview()
                
            }
        }
        registerViews()
    }
    private func registerViews(){
        let card: MotorCardView = {
            let view = MotorCardView()
            view.backgroundColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        cardView.addSubview(card)
        card.setViewData(motorsObject: motorObject)
        card.widthAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 1).isActive=true
        card.heightAnchor.constraint(equalTo: cardView.heightAnchor, multiplier: 1).isActive=true
        objectShadow(object: card, cornerRadius: 10)
        
    }
}

