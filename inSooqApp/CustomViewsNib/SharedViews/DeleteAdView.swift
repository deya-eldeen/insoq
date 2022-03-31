//
//  DeleteAdView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 17/04/2021.
//

import UIKit

class DeleteAdView: UIView,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var resonsTableView: UITableView!
    
    @IBOutlet var contentView: UIView!
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
        else if ((viewController.isKind(of: SubCategoriesViewController.self)))
        {
                registerCells()
                setDelegate()
        }

    }
    @IBAction func continue_Pressed(_ sender: Any) {
        guard let vc = self.vc else { return }
        showAlertDeprecated(controller: vc, message: "Deleting Ad...", seconds: 1)
    }
    
    func xibSetup() {
        
        Bundle.main.loadNibNamed("DeleteAdView", owner: self, options: nil)
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
        resonsTableView.register(adsNib, forCellReuseIdentifier: "CheckBox_RadioButtonTableViewCell")
    }
    private func setDelegate(){
        
        resonsTableView.delegate=self
        resonsTableView.dataSource=self
        resonsTableView.isScrollEnabled=false
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return  Statics.testOptionsArray.count-5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckBox_RadioButtonTableViewCell", for: indexPath ) as! CheckBox_RadioButtonTableViewCell
            cell.setOptions(data:Statics.testOptionsArray[indexPath.row])

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
