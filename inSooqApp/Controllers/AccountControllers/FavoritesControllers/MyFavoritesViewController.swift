//
//  MyFavoritesViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 21/02/2021.
//

import UIKit

class MyFavoritesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var bottomBar: BottomBar!
    @IBOutlet weak var topBar: TopNavigationbar!
    @IBOutlet weak var ItemsDataTableView: UITableView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    //How to show All types of Cells in this tableview
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomBar.setVC(viewController: self)
        topBar.setVC(viewController: self)
        
        ApiRequests.favoriteAdsCount { response in
            print("R")
        }
        
        ApiRequests.favoriteAds(typeId: 0) { response in
            print("F")
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupDelegates()
        registerXib()
    }
    
    //MARK:-Private Functions-
    private func setupDelegates() {
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        ItemsDataTableView.delegate = self
        ItemsDataTableView.dataSource = self
        
    }
    
    @IBAction func back_Pressed(_ sender: Any) {
        
        dismiss(animated: true) {
            clearViewData(controller: self)
        }
        
    }
    
    private func registerXib(){

        let JobsNib = UINib(nibName: "JobsTableViewCell", bundle: nil)
        ItemsDataTableView.register(JobsNib, forCellReuseIdentifier: "JobsTableViewCell")
        
        let ServicesNib = UINib(nibName: "ServicesTableViewCell", bundle: nil)
        ItemsDataTableView.register(ServicesNib, forCellReuseIdentifier: "ServicesTableViewCell")
        let NumbersNib = UINib(nibName: "PlatesTableViewCell", bundle: nil)
        ItemsDataTableView.register(NumbersNib, forCellReuseIdentifier: "PlatesTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Statics.adsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.index {
        case 2:
            let itemsData:JobsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "JobsTableViewCell", for: indexPath) as! JobsTableViewCell
            let jobObject:JobModel=JobModel(jobImage: #imageLiteral(resourceName: "sms_icon"), jobTitle: "Manager", companyName: "Nike", jobType: "full time", jobSalary: "9000 $", jobDate: "posted 2 days ago", isFavorite: false)
            itemsData.setJobData(data: jobObject)
            
            return itemsData
        case 3,4,5,7:
            let itemsData:ServicesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ServicesTableViewCell", for: indexPath) as! ServicesTableViewCell
            itemsData.images=Statics.adsArray
            switch index{
            case 4:
                itemsData.serviceDate.textColor=#colorLiteral(red: 1, green: 0.7098039216, blue: 0.2745098039, alpha: 1)
                itemsData.serviceDate.text="1234444 $"
                itemsData.serviceDate.font=UIFont.boldSystemFont(ofSize: 16)
                itemsData.ageLabel.isHidden=true
                
                break
            case 7,5:
                itemsData.serviceDate.textColor=#colorLiteral(red: 1, green: 0.7098039216, blue: 0.2745098039, alpha: 1)
                itemsData.serviceDate.text="1234444 $"
                itemsData.serviceDate.font=UIFont.boldSystemFont(ofSize: 16)
                itemsData.ageLabel.isHidden=false
                itemsData.ageLabel.text="Age: 1-6 Month"
                break
            default:
                itemsData.ageLabel.isHidden=true
                itemsData.serviceTitle.text = "Some Description"
                break
            }
            itemsData.favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)

            return itemsData
            
        case 6:
            let itemsData:PlatesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PlatesTableViewCell", for: indexPath) as! PlatesTableViewCell
            let numbersObject:NumbersModel=NumbersModel(plateOrgineLabel: " Dubai ", plateNumber: "D-22", plateLocation: "Dubai", platePrice: "120000 $", plateImage:#imageLiteral(resourceName: "Plate.png"), isFavorite: false,plateDate: "just now")
            itemsData.setPlateData(data: numbersObject)
            itemsData.favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)

            return itemsData
        default:
            switch indexPath.row {
            case 0,3,4:
                let itemsData:JobsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "JobsTableViewCell", for: indexPath) as! JobsTableViewCell
                let jobObject:JobModel=JobModel(jobImage: #imageLiteral(resourceName: "sms_icon"), jobTitle: "Manager", companyName: "Nike", jobType: "full time", jobSalary: "9000 $", jobDate: "just now", isFavorite: false)
                itemsData.setJobData(data: jobObject)
                itemsData.favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)

                return itemsData
            case 1,5:
                let itemsData:PlatesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PlatesTableViewCell", for: indexPath) as! PlatesTableViewCell
                let numbersObject:NumbersModel=NumbersModel(plateOrgineLabel: " Dubai ", plateNumber: "D-22", plateLocation: "Dubai", platePrice: "120000 $", plateImage:#imageLiteral(resourceName: "Plate.png"), isFavorite: false, plateDate: "just now")
                itemsData.setPlateData(data: numbersObject)
                itemsData.favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)

                return itemsData
            default:
                let itemsData:AllItemsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "AllItemsTableViewCell", for: indexPath) as! AllItemsTableViewCell
                itemsData.setCollectionImagesData(images: Statics.adsArray, index: index)
                itemsData.favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
                itemsData.setUIViewData(id: index)
                itemsData.reloadCollectionView()
                return itemsData
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SubCategoriesViewController.subCategoryObject.name = Statics.categoyModel[indexPath.row].categoryName
        debugPrint("subCategoriesTableView-vcTitle",Statics.categoyModel[indexPath.row].categoryName)
        forcePresentViewController(viewController: self, storyBoardId: "DetailsViewController")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch index {
        case 2:
            return 150
        case 6:
            return 150
        default:
            switch indexPath.row {
            case  0,3,4,1,5:
                return 150
            default:
            return 190

            }
        }
        
    }

}

extension MyFavoritesViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Statics.favoModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
        cell.setCategoriesData(data: Statics.favoModel[indexPath.row])
        // cell.contentView.layer.cornerRadius=cell.contentView.frame.height/2
        if indexPath.row==0{
            cell.coloredView.backgroundColor=#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
            cell.coloredView.layer.cornerRadius=cell.coloredView.frame.height/2

        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        debugPrint("Selected indexPath = ", indexPath.item)
        debugPrint("Property selected")
        //fitch This data from Selecteed Object
        index=indexPath.row
        ItemsDataTableView.reloadData()
        // Reload Table View Data
        // didselect index == 0  : reload uitableVie wwith All cells Type else reload depending on Category...
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let layout = self.categoriesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: Int((categoriesCollectionView.frame.width-10)/5), height: 110 )
        debugPrint("MyFavoCells:=",layout.itemSize.height,layout.itemSize.width)
        return layout.itemSize
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}
