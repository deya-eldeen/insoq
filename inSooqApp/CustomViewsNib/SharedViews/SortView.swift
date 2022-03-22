//
//  SortView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 08/06/2021.
//

import UIKit

class SortView: UIView,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var sortTableView: UITableView!
    
    @IBOutlet var contentView: UIView!
    let fillter:[OptionsModel]=[
        OptionsModel(title: "Default", price: "", type: 1),
        OptionsModel(title: "Newest to Oldest", price: "", type: 1),
        OptionsModel(title: "Oldest to Newest", price: "", type: 1),
        OptionsModel(title: "Sort Test", price: "", type: 1)]


    var vc:UIViewController?
    func setVC(viewController:UIViewController)
    {
        self.vc = viewController
        debugPrint("vc:",vc)
        if ((viewController.isKind(of: MyAdsViewController.self)))
        {
                registerCells()
                setDelegate()
        }
    }
    @IBAction func continue_Pressed(_ sender: Any) {
        guard let vc = self.vc else { return }
        showAlert(controller: vc, message: "SortView view...", seconds: 1)
    }
    
    func xibSetup() {
        
        Bundle.main.loadNibNamed("SortView", owner: self, options: nil)
        contentView.frame = bounds
        contentView.autoresizingMask =
            [.flexibleWidth, .flexibleHeight]
        registerCells()
        setDelegate()

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
    private func registerCells(){
        let adsNib = UINib(nibName: "CheckBox_RadioButtonTableViewCell", bundle: nil)
        sortTableView.register(adsNib, forCellReuseIdentifier: "CheckBox_RadioButtonTableViewCell")
    }
    private func setDelegate(){
        
        sortTableView.delegate=self
        sortTableView.dataSource=self
        sortTableView.isScrollEnabled=false
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return fillter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckBox_RadioButtonTableViewCell", for: indexPath ) as! CheckBox_RadioButtonTableViewCell
            cell.setOptions(data:fillter[indexPath.row])
        
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let  cell = tableView.cellForRow(at: indexPath) as! CheckBox_RadioButtonTableViewCell
            cell.selectedButton.addBorders(borderWidth: 0.5, borderColor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
            cell.selectedButton.setImage(#imageLiteral(resourceName: "selected_RadioButton"), for: .normal)
    }
    
    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        let  cell = tableView.cellForRow(at: indexPath) as! CheckBox_RadioButtonTableViewCell
        cell.selectedButton.addBorders(borderWidth: 0.5, borderColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
          cell.selectedButton.setImage(nil, for: .normal)
        
        return indexPath

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }

}
