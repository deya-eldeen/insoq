//
//  JobsFillter.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 24/02/2021.
//

import UIKit

class JobsFillter: UIView {

 
    @IBOutlet var contentView: UIView!
    //------->>
    @IBOutlet weak var serviceTypeTableView: UITableView!

    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var fillterResultButton: UIButton!
    

    var vc:UIViewController?
    
    func setVC(viewController:UIViewController)
    {
        
        self.vc = viewController
        if ((viewController.isKind(of: SubCategoriesViewController.self)) )
        {
            debugPrint("vc:-",viewController)
            registerNib()
            setDesign()
            setGestureRecognizer()
            initFillterData()
            setDelegates()
            
        }
        
    }

    
    @objc func initFillterData(){
        serviceTypeTableView.reloadInputViews()
        
    }

    private func setGestureRecognizer(){
        resetButton.addTarget(self, action: #selector(initFillterData), for: .touchUpInside)
    }
    private func setDelegates(){
        serviceTypeTableView.delegate=self
        serviceTypeTableView.dataSource=self

    }
    private func setDesign(){
      //  minPrice.delegate=self
       // maxPrice.delegate=self
        fillterResultButton.layer.cornerRadius=fillterResultButton.frame.height/2
        resetButton.layer.cornerRadius=resetButton.frame.height/2
        resetButton.layer.borderWidth=1
        resetButton.layer.borderColor=#colorLiteral(red: 1, green: 0.7098039216, blue: 0.2745098039, alpha: 1)
    }

    private func registerNib(){
        ///tableView
        let  propertyType = UINib(nibName: "CheckBox_RadioButtonTableViewCell", bundle: nil)
        serviceTypeTableView.register(propertyType, forCellReuseIdentifier: "CheckBox_RadioButtonTableViewCell")

    }
    func xibSetup() {
        Bundle.main.loadNibNamed("JobsFillter", owner: self, options: nil)
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
extension JobsFillter:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  Statics.testOptionsArray.count-4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckBox_RadioButtonTableViewCell", for: indexPath ) as! CheckBox_RadioButtonTableViewCell
        cell.setCheckOptions(data:Statics.testOptionsArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let  cell = tableView.cellForRow(at: indexPath) as! CheckBox_RadioButtonTableViewCell
        cell.selectedButton.addBorders(borderWidth: 0.5, borderColor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
        objectCornerRadius(object:             cell.selectedButton, cornerRadius: 3)
        
        cell.selectedButton.setImage(#imageLiteral(resourceName: "checked_checkbox"), for: .normal)
    }
    
    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        if  let  cell = tableView.cellForRow(at: indexPath) as? CheckBox_RadioButtonTableViewCell{
        cell.selectedButton.addBorders(borderWidth: 0.5, borderColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        objectCornerRadius(object: cell.selectedButton, cornerRadius: 3)
            cell.selectedButton.setImage(nil, for: .normal)
            
        }
        return indexPath
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
    
    
}
