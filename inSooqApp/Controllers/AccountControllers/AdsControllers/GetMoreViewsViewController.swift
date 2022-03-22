//
//  EditAdsViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 23/02/2021.
//

import UIKit

class GetMoreViewsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var bottomView: BottomBar!
    @IBOutlet weak var topBar: TopNavigationbar!
    
    @IBOutlet weak var summaryTableView: UITableView!
    @IBOutlet weak var badgesTableView: UITableView!
    @IBOutlet weak var orderSummaryView: UIView!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var adsPeriodTableView: UITableView!
    var orderSummaryArray:[String]=["Feature your car for 7 days","Feature your car for 7 days"]
    var priceSummaryArray:[String]=["1 Badge","1 Badge"]
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomView.setVC(viewController: self)
        topBar.setVC(viewController: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerCells()
        setDelegate()
        setDesign()
    }
    @IBAction func pay_Pressed(_ sender: Any) {
       dismiss(animated: true, completion: nil)
        showPaymentView()
    }
    
    @IBAction func back_Pressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
//MARK:-Private functions
    private func showPaymentView(){
        
    }
    private func setDesign()
    {
        objectCornerRadius(object: payButton, cornerRadius: payButton.height/2)
        objectShadow(object: orderSummaryView, cornerRadius: 5)
        
    }
    private func registerCells(){
        let adsNib = UINib(nibName: "CheckBox_RadioButtonTableViewCell", bundle: nil)
        adsPeriodTableView.register(adsNib, forCellReuseIdentifier: "CheckBox_RadioButtonTableViewCell")
        badgesTableView.register(adsNib, forCellReuseIdentifier: "CheckBox_RadioButtonTableViewCell")

    }
    private func setDelegate(){
        
        adsPeriodTableView.delegate=self
        adsPeriodTableView.dataSource=self
        badgesTableView.delegate=self
        badgesTableView.dataSource=self
        summaryTableView.delegate=self
        summaryTableView.dataSource=self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView==adsPeriodTableView
        {
          return  Statics.testOptionsArray.count-3
        }else if tableView == badgesTableView{
            return  Statics.testOptionsArray.count-3
        }
        else {
           return  orderSummaryArray.count
        }
  
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == adsPeriodTableView || tableView == badgesTableView{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckBox_RadioButtonTableViewCell", for: indexPath ) as! CheckBox_RadioButtonTableViewCell
           // cell.
            if tableView == adsPeriodTableView{
            cell.setOptions(data: Statics.testOptionsArray[indexPath.row])}
        else{
            cell.setCheckOptions(data:Statics.testOptionsArray[indexPath.row])
        }
        return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderSummaryTableViewCell", for: indexPath ) as! OrderSummaryTableViewCell
            cell.setSummaryData(title: orderSummaryArray[indexPath.row], price: priceSummaryArray[indexPath.row])
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == summaryTableView{
            debugPrint("selected ", indexPath.row)
        }
        if tableView == adsPeriodTableView{
            let  cell = tableView.cellForRow(at: indexPath) as! CheckBox_RadioButtonTableViewCell
            cell.selectedButton.addBorders(borderWidth: 0.5, borderColor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
            
            cell.selectedButton.setImage(#imageLiteral(resourceName: "selected_RadioButton"), for: .normal)
            
        }
        else{
            let  cell = tableView.cellForRow(at: indexPath) as! CheckBox_RadioButtonTableViewCell
            cell.selectedButton.addBorders(borderWidth: 0.5, borderColor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
            objectCornerRadius(object: cell.selectedButton, cornerRadius: 3)
            
            cell.selectedButton.setImage(#imageLiteral(resourceName: "checked_checkbox"), for: .normal)
            
        }
    }
    
    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        if tableView == adsPeriodTableView{
        let  cell = tableView.cellForRow(at: indexPath) as! CheckBox_RadioButtonTableViewCell
        cell.selectedButton.addBorders(borderWidth: 0.5, borderColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
          cell.selectedButton.setImage(nil, for: .normal)
        }
        else{
            let  cell = tableView.cellForRow(at: indexPath) as! CheckBox_RadioButtonTableViewCell
            cell.selectedButton.addBorders(borderWidth: 0.5, borderColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
            objectCornerRadius(object:             cell.selectedButton, cornerRadius: 3)
              cell.selectedButton.setImage(nil, for: .normal)
        }
        return indexPath

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }

}
