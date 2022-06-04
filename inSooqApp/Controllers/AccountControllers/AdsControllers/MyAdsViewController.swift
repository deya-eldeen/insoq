//
//  MyAdsViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 23/02/2021.
//

import UIKit

class MyAdsViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var ItemsDataTableView: UITableView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var topBar: TopNavigationbar!
    @IBOutlet weak var bottomView: BottomBar!
    
    @IBOutlet weak var stateView: UIView!

    var motors_data = [MotorAdModel]()
    var jobs_data = [JobAdModel]()
    var numbers_data = [NumberAdModel]()
    var electronics_data = [ElectronicsAdModel]()
    var classified_data = [ClassifiedAdModel]()
    var services_data = [ServiceAdModel]()
    var business_data = [BusinessAdModel]()
    
    //How to show All types of Cells in this tableview
    var index : Int = 0
    var icon = FontAwesomeIcons()
    
    var adTypeIndex = 1

    func fetchData(adType: AdMainType) {
        
        print("adType",adType)
        
        switch adType {
        case .motor:
            ApiRequests.myMotorAds { r in
                self.motors_data = r.value ?? []
                print("self.motors_data",self.motors_data)
                self.stateView.isHidden = (self.motors_data.count > 0)
                self.ItemsDataTableView.reloadData()
            }
        case .job:
            ApiRequests.myJobAds { r in
                self.jobs_data = r.value ?? []
                self.stateView.isHidden = (self.jobs_data.count > 0)
                self.ItemsDataTableView.reloadData()
            }
        case .numbers:
            ApiRequests.myNumberAds { r in
                self.numbers_data = r.value ?? []
                self.stateView.isHidden = (self.numbers_data.count > 0)
                self.ItemsDataTableView.reloadData()
            }
        case .electronics:
            ApiRequests.myElectronicsAds { r in
                self.electronics_data = r.value ?? []
                self.stateView.isHidden = (self.electronics_data.count > 0)
                self.ItemsDataTableView.reloadData()
            }
        case .classified:
            ApiRequests.myClassifiedAds { r in
                self.classified_data = r.value ?? []
                self.stateView.isHidden = (self.classified_data.count > 0)
                self.ItemsDataTableView.reloadData()
            }
        case .services:
            ApiRequests.myServicesAds { r in
                self.services_data = r.value ?? []
                self.stateView.isHidden = (self.services_data.count > 0)
                self.ItemsDataTableView.reloadData()
            }
        case .business:
            ApiRequests.myBusinessAds { r in
                self.business_data = r.value ?? []
                self.stateView.isHidden = (self.business_data.count > 0)
                self.ItemsDataTableView.reloadData()
            }
        case .none:
            break
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomView.setVC(viewController: self)
        topBar.setVC(viewController: self)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.categoriesCollectionView.selectItem(at: .init(row: 0, section: 0), animated: false, scrollPosition: .top)
            self.fetchData(adType: AdMainType.motor)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupDelegates()
        registerXib()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //MARK:- animate Swipe Hint -
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            debugPrint("Animations Start")
            if self.ItemsDataTableView.visibleCells.count > 0 {
                let cell = self.ItemsDataTableView.visibleCells[0] as? MyAdsMotorsTableViewCell
                cell?.animateSwipeHint()
            }
        }
        

        let selectedItems = self.categoriesCollectionView.indexPathsForSelectedItems ?? []
        for ip in selectedItems {
            categoriesCollectionView.deselectItem(at: ip, animated: false)
        }
        //categoriesCollectionView.reloadData()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.isKind(of: MyAdsViewController.self){
            let touch = touches.first
            if touch?.view?.tag != 100{
                deleteAction()
            }
        }
    }
    
    //MARK:-Private Functions-
    private func setupDelegates(){
        categoriesCollectionView.delegate=self
        categoriesCollectionView.dataSource=self
        ItemsDataTableView.delegate=self
        ItemsDataTableView.dataSource=self
        
        categoriesCollectionView.selectItem(at: IndexPath.init(row: 0, section: 0), animated: false, scrollPosition: .top)
       
    }
    
    @objc func deleteAction() {
        for v in self.view.subviews {
            debugPrint("name..",v)
            if v.tag == 101 || v.tag == 100 {
                v.removeFromSuperview()
                debugPrint("Found Back View")
            }
        }
    }
    
    private func registerXib() {
        
        let motorsNib = UINib(nibName: "MyAdsMotorsTableViewCell", bundle: nil)
        ItemsDataTableView.register(motorsNib, forCellReuseIdentifier: "MyAdsMotorsTableViewCell")
        
        //        let JobsNib = UINib(nibName: "JobsTableViewCell", bundle: nil)
        //        ItemsDataTableView.register(JobsNib, forCellReuseIdentifier: "JobsTableViewCell")
        //
        //        let ServicesNib = UINib(nibName: "ServicesTableViewCell", bundle: nil)
        //        ItemsDataTableView.register(ServicesNib, forCellReuseIdentifier: "ServicesTableViewCell")
        //        let NumbersNib = UINib(nibName: "PlatesTableViewCell", bundle: nil)
        //        ItemsDataTableView.register(NumbersNib, forCellReuseIdentifier: "PlatesTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let adType = AdMainType.init(rawValue: adTypeIndex) ?? AdMainType.none
        
        switch adType {
        case .motor:
            return self.motors_data.count
        case .job:
            return self.jobs_data.count
        case .numbers:
            return self.numbers_data.count
        case .electronics:
            return self.electronics_data.count
        case .classified:
            return self.classified_data.count
        case .services:
            return self.services_data.count
        case .business:
            return self.business_data.count
        case .none:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let targetCell:MyAdsMotorsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyAdsMotorsTableViewCell", for: indexPath) as! MyAdsMotorsTableViewCell
        let adType = AdMainType.init(rawValue: adTypeIndex) ?? AdMainType.none

        switch adType {
        case .motor:
            targetCell.images = self.motors_data[indexPath.row].pictures ?? []
            targetCell.isLiveLabel.text = PackageStatus.init(rawValue: self.motors_data[indexPath.row].packageStatus ?? 0)?.description
            targetCell.serviceTitle.text = self.motors_data[indexPath.row].title
            targetCell.servicePrice.text = "\(self.motors_data[indexPath.row].price ?? 0.0) AED"
            targetCell.serviceLocationLabel.text = self.motors_data[indexPath.row].enLocation ?? ""
        case .job:
            targetCell.images = self.jobs_data[indexPath.row].pictures ?? []
            targetCell.isLiveLabel.text = PackageStatus.init(rawValue: self.jobs_data[indexPath.row].packageStatus ?? 0)?.description
            targetCell.serviceTitle.text = self.jobs_data[indexPath.row].title
            targetCell.servicePrice.text = "" //"\(self.jobs_data[indexPath.row].price ?? 0.0) AED"
            targetCell.serviceLocationLabel.text = self.jobs_data[indexPath.row].enLocation ?? ""
        case .numbers:
            targetCell.images = []
            targetCell.isLiveLabel.text = PackageStatus.init(rawValue: self.numbers_data[indexPath.row].packageStatus ?? 0)?.description
            targetCell.serviceTitle.text = self.numbers_data[indexPath.row].title
            targetCell.servicePrice.text = "" // "\(self.numbers_data[indexPath.row].price ?? 0.0) AED"
            targetCell.serviceLocationLabel.text = self.numbers_data[indexPath.row].enLocation ?? ""
        case .electronics:
            targetCell.images = self.electronics_data[indexPath.row].pictures ?? []
            targetCell.isLiveLabel.text = PackageStatus.init(rawValue: self.electronics_data[indexPath.row].packageStatus ?? 0)?.description
            targetCell.serviceTitle.text = self.electronics_data[indexPath.row].title
            targetCell.servicePrice.text = "" // "\(self.electronics_data[indexPath.row].price ?? 0.0) AED"
            targetCell.serviceLocationLabel.text = self.electronics_data[indexPath.row].enLocation ?? ""
        case .classified:
            targetCell.images = self.classified_data[indexPath.row].pictures ?? []
            targetCell.isLiveLabel.text = PackageStatus.init(rawValue: self.classified_data[indexPath.row].packageStatus ?? 0)?.description
            targetCell.serviceTitle.text = self.classified_data[indexPath.row].title
            targetCell.servicePrice.text = "" // "\(self.classified_data[indexPath.row].price ?? 0.0) AED"
            targetCell.serviceLocationLabel.text = self.classified_data[indexPath.row].enLocation ?? ""
        case .services:
            targetCell.images = self.services_data[indexPath.row].pictures ?? []
            targetCell.isLiveLabel.text = PackageStatus.init(rawValue: self.services_data[indexPath.row].packageStatus ?? 0)?.description
            targetCell.serviceTitle.text = self.services_data[indexPath.row].title
            targetCell.servicePrice.text = ""// "\(self.services_data[indexPath.row].pri ?? 0.0) AED"
            targetCell.serviceLocationLabel.text = self.services_data[indexPath.row].enLocation ?? ""
        case .business:
            targetCell.images = self.business_data[indexPath.row].pictures ?? []
            targetCell.isLiveLabel.text = PackageStatus.init(rawValue: self.business_data[indexPath.row].packageStatus ?? 0)?.description
            targetCell.serviceTitle.text = self.business_data[indexPath.row].title
            targetCell.servicePrice.text = "" //"\(self.business_data[indexPath.row].price ?? 0.0) AED"
            targetCell.serviceLocationLabel.text = self.business_data[indexPath.row].enLocation ?? ""
        case .none:
            targetCell.images = []
        }
        
        
        targetCell.getMoreViewsButton.addTarget(self, action: #selector(goGetMoreViews), for: .touchUpInside)
        return targetCell
        
    }
    
    // {
    //        switch self.index {
    //        case 2:
    //            let itemsData:JobsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "JobsTableViewCell", for: indexPath) as! JobsTableViewCell
    //            let jobObject:JobModel=JobModel(jobImage: #imageLiteral(resourceName: "sms_icon"), jobTitle: "Manager", companyName: "Nike", jobType: "full time", jobSalary: "9000 $", jobDate: "posted 2 days ago")
    //            itemsData.setJobData(data: jobObject)
    //
    //            return itemsData
    //        case 3,4,5,7:
    //            let itemsData:ServicesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ServicesTableViewCell", for: indexPath) as! ServicesTableViewCell
    //            itemsData.images=Statics.adsArray
    //            switch index{
    //            case 4:
    //                itemsData.serviceDate.textColor=#colorLiteral(red: 1, green: 0.7098039216, blue: 0.2745098039, alpha: 1)
    //                itemsData.serviceDate.text="1234444 $"
    //                itemsData.serviceDate.font=UIFont.boldSystemFont(ofSize: 16)
    //                itemsData.ageLabel.isHidden=true
    //
    //                break
    //            case 7,5:
    //                itemsData.serviceDate.textColor=#colorLiteral(red: 1, green: 0.7098039216, blue: 0.2745098039, alpha: 1)
    //                itemsData.serviceDate.text="1234444 $"
    //                itemsData.serviceDate.font=UIFont.boldSystemFont(ofSize: 16)
    //                itemsData.ageLabel.isHidden=false
    //                itemsData.ageLabel.text="Age: 1-6 Month"
    //                break
    //            default:
    //                itemsData.ageLabel.isHidden=true
    //                itemsData.serviceTitle.text = "Some Description"
    //                break
    //            }
    //            return itemsData
    //
    //        case 6:
    //            let itemsData:PlatesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PlatesTableViewCell", for: indexPath) as! PlatesTableViewCell
    //            let numbersObject:NumbersModel=NumbersModel(plateOrgineLabel: " Dubai ", plateNumber: "D-22", plateLocation: "Dubai", platePrice: "120000 $", plateImage:#imageLiteral(resourceName: "Plate.png"))
    //            itemsData.setPlateData(data: numbersObject)
    //            return itemsData
    //        default:
    //            switch indexPath.row {
    //            case 0,3,4:
    //                let itemsData:JobsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "JobsTableViewCell", for: indexPath) as! JobsTableViewCell
    //                let jobObject:JobModel=JobModel(jobImage: #imageLiteral(resourceName: "sms_icon"), jobTitle: "Manager", companyName: "Nike", jobType: "full time", jobSalary: "9000 $", jobDate: "posted 2 days ago")
    //                itemsData.setJobData(data: jobObject)
    //                return itemsData
    //            case 1,5:
    //                let itemsData:PlatesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PlatesTableViewCell", for: indexPath) as! PlatesTableViewCell
    //                let numbersObject:NumbersModel=NumbersModel(plateOrgineLabel: " Dubai ", plateNumber: "D-22", plateLocation: "Dubai", platePrice: "120000 $", plateImage:#imageLiteral(resourceName: "Plate.png"))
    //                itemsData.setPlateData(data: numbersObject)
    //                return itemsData
    //            default:
    //                let itemsData:AllItemsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "AllItemsTableViewCell", for: indexPath) as! AllItemsTableViewCell
    //                itemsData.setCollectionImagesData(images: Statics.adsArray, index: index)
    //                itemsData.setUIViewData(id: index)
    //                itemsData.reloadCollectionView()
    //                return itemsData
    //            }
    //        }
    //    }
    
    @objc func goGetMoreViews() {
        
        let targetVC = ViewControllersAssembly.misc.makeViewController(with: "PricesViewController") as! PricesViewController
        targetVC.paymentNavigationSource = .myAds
        targetVC.adType = .init(rawValue: self.adTypeIndex) ?? .none
        self.present(targetVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SubCategoriesViewController.subCategoryObject.name = Statics.categoyModel[indexPath.row].categoryName
        debugPrint("subCategoriesTableView-vcTitle",Statics.categoyModel[indexPath.row].categoryName)
        forcePresentViewController(viewController: self, storyBoardId: "SubCategoriesViewController")
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [
            makeDeleteContextualAction(forRowAt: indexPath)
        ])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let statistics = UIContextualAction(style: .normal, title: "Statistics") { action, view, completion in
            debugPrint("statistics Action")
            // Your swipe action code!
            forcePresentViewController(viewController: self,storyBoardId: "StatisticsViewController")
        }
        
        statistics.backgroundColor=#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        let statisticsLabel = UILabel()
        statisticsLabel.text = icon.statistics_icon//// Your swipe action text!
        statisticsLabel.font = UIFont(name: "FontAwesome5Pro-Regular", size: 15)
        statisticsLabel.textColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        statisticsLabel.sizeToFit()
        statistics.image = UIImage(view: statisticsLabel)
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { action, view, completion in
            debugPrint("Edit Action")
            // iPresentViewController(viewController: self, storyBoardId: "GetMoreViewsViewController")
            forcePresentViewController(viewController: self, storyBoardId: "EditAdViewController")
        }
        
        edit.backgroundColor=#colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1)
        let editLabel = UILabel()
        editLabel.text = icon.edit_icon //// Your swipe action text!
        editLabel.textColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        editLabel.font = UIFont(name: "FontAwesome5Pro-Regular", size: 15)
        editLabel.sizeToFit()
        edit.image = UIImage(view: editLabel)
        
        return UISwipeActionsConfiguration(actions: [edit,statistics])
    }
    
    //MARK: - Contextual Actions
    private func makeDeleteContextualAction(forRowAt indexPath: IndexPath) -> UIContextualAction {
        return UIContextualAction(style: .destructive, title: "Delete") { (action, swipeButtonView, completion) in
            print("DELETE HERE")
            self.registerDeleteView()
            completion(true)
        }
    }
    
    @objc func jumpToEditVC(){
        //Preform segue
    }
    
    func registerDeleteView(){
        registerBackView(c: self)
        let deleteAdView: DeleteAdView = {
            let v = DeleteAdView()
            // view.backgroundColor = .white
            v.addShadowToView()
            v.translatesAutoresizingMaskIntoConstraints = false
            return v
        }()
        
        view.addSubview(deleteAdView)
        deleteAdView.tag=100
        deleteAdView.setVC(viewController: self)
        deleteAdView.continueButton.addTarget(self, action: #selector(deleteAction), for: .touchUpInside)
        deleteAdView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive=true
        deleteAdView.heightAnchor.constraint(equalToConstant: 325).isActive=true
        //(equalTo: c.view.heightAnchor, multiplier: 0.35).isActive=true
        deleteAdView.centerXAnchor.constraint(equalTo:  view.centerXAnchor).isActive=true
        deleteAdView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive=true
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // switch index {
        //  case 2://
        //    return 150/
        
        //  case 6:
        //     return 150
        //  default:
        return 170
        // }
    }
    
}


extension MyAdsViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let targetCell = cell as! CategoriesCollectionViewCell
        targetCell.renderColors()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Statics.favoModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
        cell.setCategoriesData(data: Statics.favoModel[indexPath.row])
        cell.catColor = Statics.favoModel[indexPath.row].categoyColor
        
        //cell.contentView.layer.cornerRadius=cell.contentView.frame.height/2
        if indexPath.row == 0 {
           // setGradientBackground(view: cell.coloredView, colorTop: #colorLiteral(red: 0.5490196078, green: 0.3882352941, blue: 0.9058823529, alpha: 1), colorBottom: #colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1))
            cell.coloredView.backgroundColor=#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
            cell.coloredView.layer.cornerRadius=cell.coloredView.frame.height/2

        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let targetID = Int(Statics.favoModel[indexPath.row].categoyID) ?? 0
        self.adTypeIndex = targetID
        
        print("targetID",targetID)
        print("adTypeIndex",adTypeIndex)
        
        
        let selectedItems = collectionView.indexPathsForSelectedItems ?? []
        for ip in selectedItems {
            collectionView.deselectItem(at: ip, animated: false)
        }
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .top)
        
        fetchData(adType: AdMainType.init(rawValue: targetID) ?? AdMainType.none)
        
        //fitch This data from Selecteed Object
        //categoriesCollectionView.cellForItemAt(indexPath.row)
        index=indexPath.row
        //   ItemsDataTableView.reloadData()
        //Reload Table View Data
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

//MARK:-Register Shared Views-

func registerBackView(c:UIViewController){
    let backGroundView:UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        v.alpha=0.4
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    c.view.addSubview(backGroundView)
    backGroundView.tag=101
    backGroundView.widthAnchor.constraint(equalTo: c.view.widthAnchor, multiplier: 1.2).isActive=true
    backGroundView.heightAnchor.constraint(equalTo: c.view.heightAnchor, multiplier: 1.2).isActive=true
    backGroundView.centerXAnchor.constraint(equalTo: c.view.centerXAnchor).isActive=true
    backGroundView.centerYAnchor.constraint(equalTo: c.view.centerYAnchor).isActive=true
}

