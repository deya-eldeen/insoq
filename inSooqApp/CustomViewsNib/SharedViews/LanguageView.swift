//
//  LanguageView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 18/04/2021.
//

import UIKit

class LanguageView: UIView,
UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var languagesTableView: UITableView!
    
    @IBOutlet weak var setLanguage_Button: UIButton!
    @IBOutlet var contentView: UIView!
    var languages:[OptionsModel]=[OptionsModel(title: "Arabic", price: "", type: 1),OptionsModel(title: "English", price: "", type: 1)]
    var contries:[OptionsModel]=[OptionsModel(title: "Jordan", price: "", type: 1),
                                  OptionsModel(title: "UAE", price: "", type: 1)
                                  ,OptionsModel(title: "UK", price: "", type: 1)
                                  ,OptionsModel(title: "USA", price: "", type: 1)
                                  ,OptionsModel(title: "Japan", price: "", type: 1)]

    var vc:UIViewController?
    var viewTag:Int?
    func setVC(viewController:UIViewController,viewTag:Int)
    {
        
        self.viewTag=viewTag
        setDelegate()
        setDesign()
        registerCells()
        switch viewTag {
        case 1:
            viewTitle.text="Change Country"
            break
        default:
            viewTitle.text="Change Language"
            break
        }
    }
    
    func xibSetup() {
        
        Bundle.main.loadNibNamed("LanguageView", owner: self, options: nil)
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
    private func registerCells(){
        let adsNib = UINib(nibName: "CheckBox_RadioButtonTableViewCell", bundle: nil)
        languagesTableView.register(adsNib, forCellReuseIdentifier: "CheckBox_RadioButtonTableViewCell")
    }
    private func setDesign(){
    objectCornerRadiusShadow(with: contentView)
    }
    private func setDelegate(){
        
        languagesTableView.delegate=self
        languagesTableView.dataSource=self
        languagesTableView.isScrollEnabled=false
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.viewTag{
        case 1:
            return contries.count
        default:
            return  languages.count
        }
            
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckBox_RadioButtonTableViewCell", for: indexPath ) as! CheckBox_RadioButtonTableViewCell
        debugPrint("viewTag",viewTag)
        switch self.viewTag{
        case 1:
            cell.setOptions(data:contries[indexPath.row])
        return cell
        default:
            cell.setOptions(data:languages[indexPath.row])
        return cell
        }

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let  cell = tableView.cellForRow(at: indexPath) as! CheckBox_RadioButtonTableViewCell
        cell.selectedButton.addBorders(borderWidth: 0.5, borderColor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
        cell.selectedButton.setImage(#imageLiteral(resourceName: "selected_RadioButton"), for: .normal)
        switch self.viewTag{
        case 1:
            Statics.appCountry=contries[indexPath.row].title
            debugPrint("appLanguage,",Statics.appCountry)
            break
        default:
            Statics.appLanguage=languages[indexPath.row].title
            debugPrint("appLanguage,",Statics.appLanguage)
            break
            
        }
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
