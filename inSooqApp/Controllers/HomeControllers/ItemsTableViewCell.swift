//
//  ItemsTableViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 07/02/2021.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {

    @IBOutlet var itemsCollectionView: UICollectionView!
    var images=[UIImage]()
    var names=[String]()
    var prices=[String]()
    var vc : UIViewController!
    var list:[AdsOfCategoryModel] = []
    var isListModel = false
    var headerObject=SubCategoryObject(viewColor: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), name: "", icon: #imageLiteral(resourceName: "sms_icon"), index: 0, subItemIndex: 0)
var categoryId = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        itemsCollectionView.delegate=self
        itemsCollectionView.dataSource=self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        backgroundColor=#colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)
        // Configure the view for the selected state
    }
    
    func reloadCollectionView() -> Void {
        self.itemsCollectionView.reloadData()
    }
    func setCollectionViewData(images:[UIImage],names:[String],prices:[String])-> Void{
        self.images=images
        self.names=names
        self.prices=prices

    }
    func setCollectionViewDataByModel(list:[AdsOfCategoryModel],categoryId:String = "")-> Void{
        isListModel = true
        self.list = list
        self.categoryId = categoryId
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let layout = self.itemsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.itemSize = CGSize(width: Int((itemsCollectionView.frame.width-10)/2.6), height: Int((itemsCollectionView.bounds.height)) )


        self.itemsCollectionView.collectionViewLayout = layout

    }
}

    extension ItemsTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UICollectionViewDelegate {

        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isListModel{
            return list.count
        }
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = itemsCollectionView.dequeueReusableCell(withReuseIdentifier: "itemsDataCollectionViewCell", for: indexPath) as! itemsDataCollectionViewCell
        
        if isListModel{

            let model = list[indexPath.row]
            cell.setModel(model:model,categoryID: categoryId)
        }else{
        cell.setItemData(image: images[indexPath.row], name: names[indexPath.row], price: prices[indexPath.row])
        }
            return  cell
    }
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//            let layout = self.itemsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
//            layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
//            layout.minimumInteritemSpacing = 0
//            layout.minimumLineSpacing = 100000
//            layout.itemSize = CGSize(width: Int((itemsCollectionView.frame.width-10)/2.6), height: Int((1000)) )
//            return layout.itemSize
//
//        }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            debugPrint("collectionView-indexPath",indexPath)
            guard let viewController = self.vc else{ return}
            switch headerObject.index {
            case 2:
                SubCategoriesViewController.subCategoryObject.name = Statics.jobsSubCategories [indexPath.row].categoryName
                debugPrint("subCategoriesTableView-vcTitle",Statics.jobsSubCategories [indexPath.row].categoryId)
                debugPrint("subCategoriesTableView-vcTitle",Statics.jobsSubCategories [indexPath.row].categoryName)
                debugPrint("subCategoriesTableView-vcTitle",Statics.jobsSubCategories [indexPath.row].subCategoryList.count)
                
                SubCategoriesViewController.subCategoryObject.subItemIndex=indexPath.row
            default:
                SubCategoriesViewController.subCategoryObject.name = Statics.categoyModel[indexPath.row].categoryName
                debugPrint("subCategoriesTableView-vcTitle",Statics.categoyModel[indexPath.row].categoryName)
                
            }
            
            if ((viewController.isKind(of: HomeViewController.self)) )
            {
                if let vcMainControllor:HomeViewController = vc as? HomeViewController{
                    forcePresentViewController(viewController: vcMainControllor, storyBoardId: "DetailsViewController")
                    
                   // pushtoViewController(viewController: vcMainControllor, storyBoardId: "SubCategoriesViewController", animate: true)
                    
                }
            }
        }
            
        
//        func calculateCustomViewsHeight()->CGSize{
//
//            return CGSize
//        }
}


