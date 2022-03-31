//
//  AgencyViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 03/06/2021.
//

import UIKit

class AgencyViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    static var index=0
    @IBOutlet weak var itemTableView: UITableView!
    @IBOutlet weak var bottomBar: BottomBar!
    var subCategoryObject = SubCategoryObject(viewColor: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), name: "", icon: #imageLiteral(resourceName: "sms_icon"), index: index,subItemIndex: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib(index: subCategoryObject.index)
        setupDelegates()
        bottomBar.setVC(viewController: self)
        // Do any additional setup after loading the view.
    }
    @IBAction func back_Pressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    //MARK:-Private Functions-
    private func setupDelegates(){
        itemTableView.delegate=self
        itemTableView.dataSource=self
    }
    private func registerXib(index:Int){
        switch index {
        case 0:
            let MotorsNib = UINib(nibName: "MotorsTableViewCell", bundle: nil)
            itemTableView.register(MotorsNib, forCellReuseIdentifier: "MotorsTableViewCell")
            break
        case 1:
            
            let propertiesNib = UINib(nibName: "PropertiresTableViewCell", bundle: nil)
            itemTableView.register(propertiesNib, forCellReuseIdentifier: "PropertiresTableViewCell")
            break
            
        default:
            let MotorsNib = UINib(nibName: "MotorsTableViewCell", bundle: nil)
            itemTableView.register(MotorsNib, forCellReuseIdentifier: "MotorsTableViewCell")
            break
        }
        
        let headerXib = UINib(nibName: "ChatsTableViewHeader", bundle: nil)
        itemTableView.register(headerXib, forHeaderFooterViewReuseIdentifier: "ChatsTableViewHeader")
        itemTableView.sectionHeaderHeight=35
        itemTableView.estimatedSectionHeaderHeight=35
        
        
        
    }
    // MARK:-Table View Controllers-
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = self.itemTableView.dequeueReusableHeaderFooterView(withIdentifier: "ChatsTableViewHeader") as! ChatsTableViewHeader
        switch subCategoryObject.index
        {
        case 0:
            header.setCustomHeaders(sectionTitle: "All Cars")
            break
        case 1:
            header.setCustomHeaders(sectionTitle: "All Properties")
        default:
            debugPrint("Error... fitching header.")
            
        }
        
        header.sectionTitle.adjustsFontSizeToFitWidth=true
        header.sectionTitle.font=UIFont.boldSystemFont(ofSize: 18)
        //  setupBrandDropDown(sortBtn: header.viewAllButton)
        //  header.viewAllButton.addTarget(self, action: #selector(sortDropDownAction), for: .touchUpInside)
        
        return header
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Statics.adsArray.count
    }
    //MARK: Continue, Registering Cells.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch subCategoryObject.index{
        case 0:
            
            let itemsData:MotorsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MotorsTableViewCell", for: indexPath) as! MotorsTableViewCell
            itemsData.setViewData(motorsObject: MotorsModel(itemDate: "just now", itemPriceLabel: "AED 120000 ", itemYear: "2022", itemKM: "65000", itemLocationLabel: "Dubai", itemNameLabel: "Audi R8", isFavorite: true, itemImages: Statics.adsArray))
            itemsData.favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            itemsData.reloadCollectionView()
            return itemsData
        case 1:
            let itemsData:PropertiresTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PropertiresTableViewCell", for: indexPath) as! PropertiresTableViewCell
            itemsData.setViewData(propertyObject: PropertyModel(itemDescLabel: "d", itemSqFtLabel: "1000 sq.ft", itemWcLabel: "4", ItemRoomsLabel: "9", itemPriceLabel: "1000,000,000", itemLocationLabel: "UAE", itemNameLabel: "Brand New 5 BR...", itemTypeLabel: "2", isFavorite: false, itemDate: "just now", itemImages: Statics.adsArray))
            itemsData.favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            itemsData.reloadCollectionView()
            return itemsData
            
            
        default:
            showAlertDeprecated(controller: self, message: "Something went wrong, please try again later", seconds: 1)
            return UITableViewCell()
        }
    }
}
