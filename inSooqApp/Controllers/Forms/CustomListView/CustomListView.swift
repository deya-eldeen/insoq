
import UIKit

class CustomListView: UIView {
    
    private let cellIdOrName = "CellPopupListItme"
    private let itemHeight:CGFloat = 50
    
    var didSelectListItem: ( (Listable, PickerID) -> Void )?

    let itemOther = ListItem.init(id: 0, ar_Text: "Other", en_Text: "Other")
    
    var vc: UIViewController?
    
    var list: [Listable] = [] {
        didSet {
            checkHeight()
            tableView.reloadData()
        }
    }
    
    var pickerID = PickerID.none
    
    var selectedItem: Listable?
    
    @IBOutlet weak var txtFSearch: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var constraintHeightOfView: NSLayoutConstraint!
    @IBOutlet weak var customValueField: UITextField!
    @IBOutlet weak var customValueFieldView: UIView!
    
    @IBAction func closeAction(_ sender: Any) {
        
        // if the user has selected other
        if (self.selectedItem?.id == 0 ) {
            let otherItem = ListItem.init(id: 0, ar_Text: self.customValueField.text ?? "", en_Text: self.customValueField.text ?? "")
            self.didSelectListItem?(otherItem, self.pickerID)
        } else {
            self.didSelectListItem?(selectedItem ?? itemOther, self.pickerID)
        }
        
        showView(show: false)
    }
    
    func showView(show:Bool){
        self.isHidden = !show
        
        if(show == true) {
            self.selectedItem = nil
        }
        
    }
    
    func setData(vc:UIViewController?, list: [Listable], hideOther: Bool? = true){
        
        var listFinal = list
        if let hideOther = hideOther {
            if (hideOther == false) {
                listFinal.append(itemOther)
            }
        }

        self.list = listFinal
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
        customValueFieldView.isHidden = true
    }
    
    func showListing(vc: UIViewController) {
        customValueFieldView.isHidden = true
        self.isHidden = false
        vc.view.endEditing(true)
        vc.resignFirstResponder()
    }
    
    @objc func textFieldDidChange() {
        
        let text = (txtFSearch.text ?? "").lowercased()
        let  listTemp = list.filter {
            let id = ($0).en_Text?.lowercased() ?? ""
            debugPrint("id:\(id)  text :\(text)")
            return id.contains(text)
        }
        
        if listTemp.count > 0 {
            self.list = listTemp
        }
        else{
            //self.list = self.listOrginal
            
        }
    }
    
}

extension CustomListView: UITableViewDelegate, UITableViewDataSource {
    
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
        
        cell.lblName.text = item.en_Text ?? item.en_Name ?? item.value
        
        cell.onClick =  {
            
            self.selectedItem = item
            
            if item.id == 0 {
                self.customValueFieldView.isHidden = false
                return
            } else {
                self.customValueFieldView.isHidden = true
            }
            
            self.didSelectListItem?(item, self.pickerID)
            
            self.showView(show:false)
        }
        return cell
    }
    
}
