//
//  ViewPopupListOfItems.swift
//  inSooqApp
//
//  Created by AOUN on 1/7/22.
//

import UIKit
//
//struct ModelListPopupItem{
//    var name:String?
//    var id:String?
//}
class ViewPopupListOfItems: UIView {
    
    private let cellIdOrName = "CellPopupListItme"
    private let itemHeight:CGFloat = 50
    var onItmeClickIndex:((Int)->Void)?
    var onItmeClick:((Int,String)->Void)?
    let itemOther =  "Other"
    var vc:UIViewController?
    
    var list:[String]  = [] {
        didSet {
            checkHeight()
            tableView.reloadData()
        }
    }
    
    var listOrginal:[String]  = []
    
    @IBOutlet weak var txtFSearch: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var constraintHeightOfView: NSLayoutConstraint!
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    @IBAction func closeAction(_ sender: Any) {
        self.showNavBar(show: true)
        showView(show: false)
    }
    
    func showView(show:Bool){
        self.isHidden = !show
    }
    
    func setData(vc:UIViewController?, list:[String], hideOther:Bool? = false){
        
        self.showNavBar(show: false)
        var listFinal = list
        if !(hideOther ?? false){
            listFinal.append(itemOther)
        }
        self.list = listFinal
        self.listOrginal = listFinal
        
        self.vc = vc
        
        showView(show: true)
        
    }
    
    func checkHeight () {
        var height =   CGFloat(list.count) * itemHeight
        if height >=  self.bounds.height * 0.6 {
            height = self.bounds.height * 0.6
        }
        constraintHeightOfView.constant = height
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let adsNib = UINib(nibName: cellIdOrName, bundle: nil)
        self.tableView.register(adsNib, forCellReuseIdentifier: cellIdOrName)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        txtFSearch.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    func showNavBar(show:Bool){
        self.vc?.navigationController?.setNavigationBarHidden(!show, animated: false)
    }
    
    @objc func textFieldDidChange() {
        
        let text = (txtFSearch.text ?? "").lowercased()
        let  listTemp = list.filter{
            let id = ($0).lowercased()
            debugPrint("id:\(id)  text :\(text)")
            return id.contains(text)
        }
        
        if listTemp.count > 0{
            self.list = listTemp
        }
        else{
            self.list = self.listOrginal
            
        }
    }
    
}

extension ViewPopupListOfItems:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return itemHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdOrName, for: indexPath) as! CellPopupListItme
        let item = list[indexPath.row]
        cell.lblName.text = item
        cell.onClick =  {
            self.showNavBar(show: true)
            self.onItmeClickIndex?(indexPath.row)
            self.onItmeClick?(indexPath.row,item)
            self.showView(show:false)
            
            
        }
        return cell
    }
    
}
