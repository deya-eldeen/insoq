//
//  SubCategoriesViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 09/02/2021.
//

import UIKit
import IQKeyboardManagerSwift
import DropDown
class SubCategoriesViewController: UIViewController {
    //MARK:-LayoutConstraint for scorrling down and up
    private var lastContentOffset: CGFloat = 0
    private var duration:TimeInterval=6.0
    
    public static var isUsedCard = false
    public static var maker: String = ""
    public static var model: String = ""
    public static var categoryId: String = "2"
    var  listOfUsedCar  = [AdsOfCategoryModel]()
    var  jobsList: [JobsModel] = []
    var  servicesList: [ServicesModel] = []
    var  businessList: [BusinessModel] = []
    var  classifiedList: [ClassifiedModel] = []
//    public static var GetAllMotorMakerModel
    
    @IBOutlet weak var topBar_HConstraint: NSLayoutConstraint!//60
    @IBOutlet weak var tagsCollectionView_HConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomBar_HConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomBar_BConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollTotopButton: UIButton!
    
  //  @IBOutlet weak var saveSearchHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var segmentView: UIView!
    //@IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var shimmerView: UIView!
    @IBOutlet weak var bottomView: BottomBar!
    //MARK:-Icons
    
    @IBOutlet weak var saveSearchButton: UIButton!
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var fillterButton: UIButton!
    @IBOutlet weak var girdButton: UIButton!
    
    //MARK:-SideMenu Data
    @IBOutlet weak var sideMenu_FillterView: UIView!
    @IBOutlet weak var sideMenu_ViewToDismiss: UIView!
    @IBOutlet weak var sideMenuView: UIView!
    @IBOutlet weak var sideMenuRightConstraint: NSLayoutConstraint!
    var  _sideMenuShown:Bool = false
    //MARK:- Test Object
    static var subCategoryObject = SubCategoryObject(viewColor: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), name: "", icon: #imageLiteral(resourceName: "sms_icon"), index: 0, subItemIndex: 0)
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var vcTitle: UILabel!
    var _isGrid:Bool=false
    var _isSaved:Bool=false
    ///constraints outlets
    @IBOutlet weak var fillterCollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    ///collectionviews outlets
    @IBOutlet weak var fillterCollectionView: UICollectionView!
    
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    var subCategoryObject = SubCategoryObject(viewColor: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), name: "", icon: #imageLiteral(resourceName: "sms_icon"), index: 0,subItemIndex: 0)
    //MARK:Variables
    var timer=Timer()
    var testFilltered:[String]=["small Text","long text to checkt","small Text","very Long fillter Text to check ","very Long fillter Text to"]
    
    
    var who = -1
    
    /// job fields // entry level - fulltime
    static var careerLevel = ""
    static var employmentType = ""
    var catID = 3 // 3 = opening jobs 4 = wanted jobs
    var subCatID = 3 // 3 = opening jobs 4 = wanted jobs
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomView.setVC(viewController: self)
        hideSideMenu()
        setGradientBackground(view: topView, colorTop: #colorLiteral(red: 0.5490196078, green: 0.3882352941, blue: 0.9058823529, alpha: 1), colorBottom: #colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1))
        setGradientBackground(view: segmentView, colorTop: #colorLiteral(red: 0.5490196078, green: 0.3882352941, blue: 0.9058823529, alpha: 1), colorBottom: #colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1))
    }
    override func viewWillAppear(_ animated: Bool) {
        
    fillterCollectionViewHeightConstraint.constant=0
        setData()
        setDesign()
        setDelegates()
        setCollectionViewNib()
        //calculateHeight()
        setupTapGusture()
        self.shimmerView.isHidden=false
//        self.scrollView.isHidden=true
        shimmerView.start()

        if Shared.shared.category == 2{
            
        }

//        if SubCategoriesViewController.isUsedCard{
//            getMotorFilter()
//        }
//
//        switch subCategoryObject.index{
//
//        case 2:
//            if subCategoryObject.subItemIndex == 1{
//                catID = 4
//                getJobsFilter(category: 4)
//            }else{
//                getJobsFilter(category: catID)
//            }
//            break
//
//        case 3:
//            self.view.showLoading()
//            subCatID = 12 // to test without filter
//            getServicesFilter(category: catID, subCategoryID: subCatID, location: "")
//            break
//        case 4:
//            self.view.showLoading()
//            subCatID = 66 // to test without filter
//            getBusinessFilter(category: catID, subCategoryID: subCatID, location: "")
//            break
//        case 5:
//            getClassified(category: 39, subCategoryID: 68, location: "")
//            break
//        default:
//            break
//        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.shimmerView.stop()
            self.shimmerView.isHidden=true
            //self.scrollView.isHidden=false
        }
        sortButton.addTarget(self, action: #selector(showSortPopUp), for: .touchUpInside)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if self.isKind(of: SubCategoriesViewController.self){
            let touch = touches.first
            if touch?.view?.tag != 100{
                deleteAction()
            }

        }
    }
    @objc func showSortPopUp(){
///Show
        registerDeleteView()
    }
    @IBAction func back_Pressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        // self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func scrollToTop_Pressed(_ sender: Any) {
        self.itemsCollectionView.scrollToTop()
    }
    @IBAction func grid_Pressed(_ sender: Any) {

        if _isGrid{
            girdButton.setImage(UIImage(systemName: "square.grid.2x2.fill"), for: .normal)
        }
        else{
            girdButton.setImage(UIImage(systemName: "line.horizontal.3"), for: .normal)
        }
        _isGrid = !_isGrid
        itemsCollectionView.reloadData()


    }
    @IBAction func saveSearch_Pressed(_ sender: Any) {
          
        registerSaveSearchView(isSaved:_isSaved)
        _isSaved = !_isSaved
    }
    
    
    @IBAction func sideMenu_Pressed(_ sender: Any) {
        if _sideMenuShown{
            //show
            showSideMenu(index: subCategoryObject.index)
        }
        
    }
    
    //MARK:-Private Methods-
    private func setData(){
        subCategoryObject.name=SubCategoriesViewController.subCategoryObject.name
        subCategoryObject.index=SubCategoriesViewController.subCategoryObject.index
        subCategoryObject.subItemIndex=SubCategoriesViewController.subCategoryObject.subItemIndex
    }
    private func setDesign(){
        objectCornerRadius(object: girdButton, cornerRadius: girdButton.width/2)
        girdButton.addShadowToView()
        vcTitle.text=subCategoryObject.name
    }

    private func setupTapGusture(){
        let dissmiss = UITapGestureRecognizer(target: self, action: #selector(hideSideMenu))
        sideMenu_ViewToDismiss.addGestureRecognizer(dissmiss)
    }
    private func showSideMenu(index:Int){
        registerViews(index: index)
        sideMenuView.animateViewHeight(controller: self, height: 0, heightConstraint: sideMenuRightConstraint)
        _sideMenuShown  = !_sideMenuShown
        
    }
    @objc func hideSideMenu(){
        sideMenuView.animateViewHeight(controller: self, height: sideMenuView.frame.width, heightConstraint: sideMenuRightConstraint)
        _sideMenuShown  = !_sideMenuShown
        
    }
    //MARK:Delete custom views
    @objc func deleteAction(){
        for v in self.view.subviews{
            debugPrint("name..",v)
            if v.tag == 101 || v.tag == 100 || v.tag==106 {
                v.removeFromSuperview()
                debugPrint("Found Back View")
            }
            
        }
    }
    @objc func sortByAction(){
        for v in self.view.subviews{
            debugPrint("name..",v)
            if v.tag == 101 || v.tag == 100 {
                v.removeFromSuperview()
                debugPrint("Found Back View")
            }
        }
        DispatchQueue.main.async {
            self.shimmerView.start()
            self.stopShimmerView()
        }
    }
    //MARK:register background View
    func registerDeleteView(){
        registerBackView(c: self)
        let deleteAdView: SortView = {
            let v = SortView()
            // view.backgroundColor = .white
            v.addShadowToView()
            v.translatesAutoresizingMaskIntoConstraints = false
            return v
        }()
        
        view.addSubview(deleteAdView)
        deleteAdView.tag=100
        deleteAdView.setVC(viewController: self)
        deleteAdView.sortButton.addTarget(self, action: #selector(sortByAction), for: .touchUpInside)
        deleteAdView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive=true
        let dHeight:CGFloat=CGFloat((deleteAdView.fillter.count+1)*45)+35
        debugPrint("dHeight",dHeight)
        deleteAdView.heightAnchor.constraint(equalToConstant: dHeight) .isActive=true
        //(equalTo: c.view.heightAnchor, multiplier: 0.35).isActive=true
        deleteAdView.centerXAnchor.constraint(equalTo:  view.centerXAnchor).isActive=true
        deleteAdView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive=true
        
    }
    //MARK:-Registering Fillters Views
    
    @objc func startShimmerView(){
        debugPrint("FillterButton ,startShimmerView")
        hideSideMenu()
        self.shimmerView.isHidden=false
       // self.scrollView.isHidden=true
        self.shimmerView.start()
        self.stopShimmerView()
        
    }
    @objc func stopShimmerView(){
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.shimmerView.stop()
            self.shimmerView.isHidden=true
           // self.scrollView.isHidden=false
            
        }
    }
    private func registerSaveSearchView(isSaved:Bool){
        registerBackView(c: self)
        debugPrint("registerSaveSearchView")
        let saveSearchView: SeaveSearchsView = {
            let view = SeaveSearchsView()
            // view.backgroundColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        view.addSubview(saveSearchView)
        saveSearchView.setVC(viewController: self, isSaved: isSaved)
        saveSearchView.cancelButton.addTarget(self, action: #selector(deleteAction), for: .touchUpInside)
        saveSearchView.actionButton.addTarget(self, action: #selector(deleteAction), for: .touchUpInside)
        saveSearchView.tag=106
        saveSearchView.widthAnchor.constraint(equalToConstant: 350).isActive=true
        saveSearchView.heightAnchor.constraint(equalToConstant: 140).isActive=true
        saveSearchView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        saveSearchView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive=true

    }
    private func registerViews(index:Int){
        ///    set switch  to set view base on item selected
        switch index {
        case 1:
            debugPrint("Setting MotorsFillter")
            let fillterView: PropertyFillterView = {
                let view = PropertyFillterView()
                // view.backgroundColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            
            sideMenu_FillterView.addSubview(fillterView)
            fillterView.setVC(viewController: self)
            fillterView.cancelButton.addTarget(self, action: #selector(hideSideMenu), for: .touchUpInside)
            fillterView.widthAnchor.constraint(equalTo: sideMenu_FillterView.widthAnchor, multiplier: 1).isActive=true
            fillterView.fillterResultButton.addTarget(self, action: #selector(startShimmerView), for: .touchUpInside)
            fillterView.heightAnchor.constraint(equalTo: sideMenu_FillterView.heightAnchor, multiplier: 1).isActive=true
            fillterView.centerXAnchor.constraint(equalTo: sideMenu_FillterView.centerXAnchor).isActive=true
            fillterView.centerYAnchor.constraint(equalTo: sideMenu_FillterView.centerYAnchor).isActive=true
            break
        case 2:
            switch subCategoryObject.subItemIndex {
            case 1:
                debugPrint("Setting jobsDetailsView-Wanted")
                let fillterView: WantedJobFillter = {
                    let view = WantedJobFillter()
                    // view.backgroundColor = .white
                    view.translatesAutoresizingMaskIntoConstraints = false
                    return view
                }()
                sideMenu_FillterView.addSubview(fillterView)
                fillterView.setVC(viewController: self)
                fillterView.cancelButton.addTarget(self, action: #selector(hideSideMenu), for: .touchUpInside)
                fillterView.fillterResultButton.addTarget(self, action: #selector(startShimmerView), for: .touchUpInside)
                fillterView.widthAnchor.constraint(equalTo: sideMenu_FillterView.widthAnchor, multiplier: 1).isActive=true
                fillterView.heightAnchor.constraint(equalTo: sideMenu_FillterView.heightAnchor, multiplier: 1).isActive=true
                fillterView.centerXAnchor.constraint(equalTo: sideMenu_FillterView.centerXAnchor).isActive=true
                fillterView.centerYAnchor.constraint(equalTo: sideMenu_FillterView.centerYAnchor).isActive=true
                
                
            default:
                debugPrint("Setting jobsDetailsView-Oppining")
                let fillterView: JobsFillter = {
                    let view = JobsFillter()
                    // view.backgroundColor = .white
                    view.translatesAutoresizingMaskIntoConstraints = false
                    return view
                }()
                sideMenu_FillterView.addSubview(fillterView)
                fillterView.setVC(viewController: self)
                fillterView.cancelButton.addTarget(self, action: #selector(hideSideMenu), for: .touchUpInside)
                fillterView.fillterResultButton.addTarget(self, action: #selector(startShimmerView), for: .touchUpInside)
                fillterView.widthAnchor.constraint(equalTo: sideMenu_FillterView.widthAnchor, multiplier: 1).isActive=true
                fillterView.heightAnchor.constraint(equalTo: sideMenu_FillterView.heightAnchor, multiplier: 1).isActive=true
                fillterView.centerXAnchor.constraint(equalTo: sideMenu_FillterView.centerXAnchor).isActive=true
                fillterView.centerYAnchor.constraint(equalTo: sideMenu_FillterView.centerYAnchor).isActive=true
            }
            break
        case 3:
            debugPrint("ServicesDetailsView")
            let fillterView: ServicesFillter = {
                let view = ServicesFillter()
                // view.backgroundColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            
            sideMenu_FillterView.addSubview(fillterView)
            fillterView.setVC(viewController: self)
            fillterView.cancelButton.addTarget(self, action: #selector(hideSideMenu), for: .touchUpInside)
            fillterView.fillterResultButton.addTarget(self, action: #selector(startShimmerView), for: .touchUpInside)
            fillterView.widthAnchor.constraint(equalTo: sideMenu_FillterView.widthAnchor, multiplier: 1).isActive=true
            fillterView.heightAnchor.constraint(equalTo: sideMenu_FillterView.heightAnchor, multiplier: 1).isActive=true
            fillterView.centerXAnchor.constraint(equalTo: sideMenu_FillterView.centerXAnchor).isActive=true
            fillterView.centerYAnchor.constraint(equalTo: sideMenu_FillterView.centerYAnchor).isActive=true
            break
        case 6,4,5,7:
            let fillterView: PlatesFillter = {
                let view = PlatesFillter()
                // view.backgroundColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            
            sideMenu_FillterView.addSubview(fillterView)
            fillterView.setVC(viewController: self)
            fillterView.cancelButton.addTarget(self, action: #selector(hideSideMenu), for: .touchUpInside)
            fillterView.fillterResultButton.addTarget(self, action: #selector(startShimmerView), for: .touchUpInside)
            fillterView.widthAnchor.constraint(equalTo: sideMenu_FillterView.widthAnchor, multiplier: 1).isActive=true
            fillterView.heightAnchor.constraint(equalTo: sideMenu_FillterView.heightAnchor, multiplier: 1).isActive=true
            fillterView.centerXAnchor.constraint(equalTo: sideMenu_FillterView.centerXAnchor).isActive=true
            fillterView.centerYAnchor.constraint(equalTo: sideMenu_FillterView.centerYAnchor).isActive=true
            break
        default:
            debugPrint("Setting motorsDetailsView")
            let fillterView: MotorsFillter = {
                let view = MotorsFillter()
                // view.backgroundColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            
            sideMenu_FillterView.addSubview(fillterView)
            fillterView.setVC(viewController: self)
            fillterView.cancelButton.addTarget(self, action: #selector(hideSideMenu), for: .touchUpInside)
            fillterView.fillterResultButton.addTarget(self, action: #selector(startShimmerView), for: .touchUpInside)
            fillterView.widthAnchor.constraint(equalTo: sideMenu_FillterView.widthAnchor, multiplier: 1).isActive=true
            fillterView.heightAnchor.constraint(equalTo: sideMenu_FillterView.heightAnchor, multiplier: 1).isActive=true
            fillterView.centerXAnchor.constraint(equalTo: sideMenu_FillterView.centerXAnchor).isActive=true
            fillterView.centerYAnchor.constraint(equalTo: sideMenu_FillterView.centerYAnchor).isActive=true
            break
        }
    }
    //MARK:-Registering Collection View Custom Cell
    private func setCollectionViewNib(){
        
        let  motorsUsedCarRowXib = UINib(nibName: "RowCollecctionUsedCarCell", bundle: nil)
        itemsCollectionView.register(motorsUsedCarRowXib, forCellWithReuseIdentifier: "RowCollecctionUsedCarCell")
        
        //CollectionViewCells
        ///Row's
        let  motorsRowXib = UINib(nibName: "RowCollectionViewCell", bundle: nil)
        itemsCollectionView.register(motorsRowXib, forCellWithReuseIdentifier: "RowCollectionViewCell")
        let  propertiesRowXib = UINib(nibName: "PropertiesRowCollectionViewCell", bundle: nil)
        itemsCollectionView.register(propertiesRowXib, forCellWithReuseIdentifier: "PropertiesRowCollectionViewCell")
        let  jobsRowXib = UINib(nibName: "JobsRowCollectionViewCell", bundle: nil)
        itemsCollectionView.register(jobsRowXib, forCellWithReuseIdentifier: "JobsRowCollectionViewCell")
        let  serviceRowXib = UINib(nibName: "ServiceRowCollectionViewCell", bundle: nil)
        itemsCollectionView.register(serviceRowXib, forCellWithReuseIdentifier: "ServiceRowCollectionViewCell")
        let  platesRowXib = UINib(nibName: "RowPlatesCollectionViewCell", bundle: nil)
        itemsCollectionView.register(platesRowXib, forCellWithReuseIdentifier: "RowPlatesCollectionViewCell")
        let  wantedJobRowXib = UINib(nibName: "WantedJobRowCollectionViewCell", bundle: nil)
        itemsCollectionView.register(wantedJobRowXib, forCellWithReuseIdentifier: "WantedJobRowCollectionViewCell")

        ///Grid
        let  motorsGridXib = UINib(nibName: "GridCollectionViewCell", bundle: nil)
        itemsCollectionView.register(motorsGridXib, forCellWithReuseIdentifier: "GridCollectionViewCell")
        let  propertiesGridXib = UINib(nibName: "PropertiesGridCollectionViewCell", bundle: nil)
        itemsCollectionView.register(propertiesGridXib, forCellWithReuseIdentifier: "PropertiesGridCollectionViewCell")
        let  jobsGridXib = UINib(nibName: "JobsGridCollectionViewCell", bundle: nil)
        itemsCollectionView.register(jobsGridXib, forCellWithReuseIdentifier: "JobsGridCollectionViewCell")
        let  serviceGridXib = UINib(nibName: "ServiceGridCollectionViewCell", bundle: nil)
        itemsCollectionView.register(serviceGridXib, forCellWithReuseIdentifier: "ServiceGridCollectionViewCell")
        let  platesGridXib = UINib(nibName: "GridPlatesCollectionViewCell", bundle: nil)
        itemsCollectionView.register(platesGridXib, forCellWithReuseIdentifier: "GridPlatesCollectionViewCell")
        let  wantedJobGridXib = UINib(nibName: "WantedJobGridCollectionViewCell", bundle: nil)
        itemsCollectionView.register(wantedJobGridXib, forCellWithReuseIdentifier: "WantedJobGridCollectionViewCell")
    }
    private func setDelegates(){
        //scrollView.delegate=self
        fillterCollectionView.delegate=self
        fillterCollectionView.dataSource=self
        itemsCollectionView.delegate=self
        itemsCollectionView.dataSource=self
    }
//    private func calculateHeight(){
//        fillterCollectionViewHeightConstraint.constant=50
//        switch subCategoryObject.index
//        {
//        case 2,6:
//            collectionViewHeightConstraint.constant=CGFloat((Statics.adsArray.count/2)*130)+450
//            break
//        default:
//            collectionViewHeightConstraint.constant=CGFloat((Statics.adsArray.count/2)*170)+450
//            break
//        }
//        debugPrint("tableViewHeightConstraint_constant",collectionViewHeightConstraint.constant)
//        debugPrint("tableViewHeightConstraint_constant",Statics.adsArray.count/2)
//        debugPrint("tableViewHeightConstraint_constant",((Statics.adsArray.count/2)*170))
//        debugPrint("tableViewHeightConstraint_constant",(((Statics.adsArray.count/2)*170)+460))
//    }
}
//MARK:-CollectionView Controllers-
extension SubCategoriesViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
              if SubCategoriesViewController.isUsedCard{
                  return listOfUsedCar.count
              }

        
        switch SubCategoriesViewController.subCategoryObject.index {
        case 2:
            return jobsList.count
        case 3:
            return servicesList.count
        case 4:
            return businessList.count
        case 5:
            return classifiedList.count
        default:
            return 0
        }
        
        if collectionView==itemsCollectionView{
            if _isGrid{
                return Statics.adsArray.count
            }
            else {
                return Statics.adsArray.count
            }
        }
        else
        {
            return testFilltered.count
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if SubCategoriesViewController.isUsedCard{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RowCollecctionUsedCarCell", for: indexPath) as! RowCollecctionUsedCarCell
            
            let item = listOfUsedCar[indexPath.row]
            var imgsArray: [String] = []
            if let imgs = item.pictures{
                for imgItem in imgs {
                    if let imgURL = imgItem.imageURL {
                        var repImg = imgURL.replacingOccurrences(of: "\\", with: ",,")
                        repImg = repImg.replacingOccurrences(of: ",," , with: #"/"#)
                        imgsArray.append(repImg)
                    }
                }
            }

            cell.setViewData(motorsObject:
                                MotorsModel(itemDate: "just 1now", itemPriceLabel: "\(item.price!)", itemYear: "\(item.year!.integerValue)", itemKM: "\(item.kilometers!.integerValue)", itemLocationLabel: "\(item.en_Location!.stringValue)" , itemNameLabel: "\(item.title!.stringValue)", isFavorite: false, itemImages: []) , imgs: imgsArray)
            
            return cell
        }
        
        if collectionView == fillterCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FillterCollectionViewCell", for: indexPath) as! FillterCollectionViewCell
            cell.setFillterLabel(title: testFilltered[indexPath.row])
            return cell
        }
        else {
            switch _isGrid {
            case true:
                switch subCategoryObject.index{
                case 0:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCollectionViewCell", for: indexPath) as! GridCollectionViewCell
                    cell.setViewData(motorsObject: MotorsModel(itemDate: "just now", itemPriceLabel: "AED 130000", itemYear: "2021", itemKM: "32000 KM", itemLocationLabel: "Dubai", itemNameLabel: "Audi, S5", isFavorite: true, itemImages: Statics.adsArray))
                    cell.reloadCollectionView()
                    return cell
                case 1:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertiesGridCollectionViewCell", for: indexPath) as! PropertiesGridCollectionViewCell
                    debugPrint("subCategoryObject-",subCategoryObject.index,subCategoryObject.name)
                    cell.setViewData(propertyObject: PropertyModel(itemDescLabel: "d", itemSqFtLabel: "1000 sq.ft", itemWcLabel: "4", ItemRoomsLabel: "9", itemPriceLabel: "1000,000,000", itemLocationLabel: "UAE", itemNameLabel: "Brand New 5 BR...", itemTypeLabel: "2", isFavorite: false, itemDate: "just now", itemImages: Statics.adsArray) )
                    cell.reloadCollectionView()
                    return cell
                case 2:
                    switch subCategoryObject.subItemIndex {
                    case 1://wanted jobs
                        let itemsData = collectionView.dequeueReusableCell(withReuseIdentifier: "WantedJobGridCollectionViewCell", for: indexPath) as! WantedJobGridCollectionViewCell
                        let job = jobsList[indexPath.row]
                        let jobObject:WantedJobModel=WantedJobModel(jobTitle: job.title , jobLocation: job.enLocation , jobPositions: job.companyName ?? "" , jobType: job.enEmploymentType ?? "" , jobExperiance: job.enMinWorkExperience ?? "", jobDate: job.postDate, isFavorite: job.isFavorite)
                        itemsData.setJobData(data: jobObject)
                        return itemsData
                        
                    default://oppining jobs
                        let itemsData = collectionView.dequeueReusableCell(withReuseIdentifier: "JobsGridCollectionViewCell", for: indexPath) as! JobsGridCollectionViewCell
                        let jobObject:JobModel=JobModel(jobImage: #imageLiteral(resourceName: "sms_icon"), jobTitle: "Manager", companyName: "Nike", jobType: "full time", jobSalary: "9000 $", jobDate: "just now", isFavorite: false)
                        itemsData.setJobData(data: jobObject)
                        itemsData.favoriteButton.tag=indexPath.row
                        return itemsData
                        
                    }
                    
                case 3,4,5,7:
                    let itemsData = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceGridCollectionViewCell", for: indexPath) as! ServiceGridCollectionViewCell
                    itemsData.images=Statics.adsArray
                    switch subCategoryObject.index{
                    case 4:
                        itemsData.serviceDate.textColor=#colorLiteral(red: 1, green: 0.7098039216, blue: 0.2745098039, alpha: 1)
                        itemsData.serviceDate.text="1234444 $"
                        itemsData.serviceDate.font=UIFont.boldSystemFont(ofSize: 16)
                        itemsData.ageLabel.isHidden=true
                        break
                    case 7,5:
                        itemsData.serviceDate.textColor=#colorLiteral(red: 1, green: 0.7098039216, blue: 0.2745098039, alpha: 1)
                        itemsData.serviceDate.text="200000 $"
                        itemsData.serviceDate.font=UIFont.boldSystemFont(ofSize: 16)
                        itemsData.ageLabel.isHidden=false
                        itemsData.ageLabel.text="Age: 1-6 Month"
                        break
                    default:
                        itemsData.ageLabel.isHidden=true
                        itemsData.serviceTitle.text = "Item Title "
                        break
                    }
                    return itemsData
                    
                case 6:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridPlatesCollectionViewCell", for: indexPath) as! GridPlatesCollectionViewCell
                    let numbersObject:NumbersModel=NumbersModel(plateOrgineLabel: " Dubai ", plateNumber: "D-22", plateLocation: "Dubai", platePrice: "120000 $", plateImage:#imageLiteral(resourceName: "Plate.png"), isFavorite: false,plateDate: "just now")
                    cell.setPlateData(data: numbersObject)
                    return cell
                default:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCollectionViewCell", for: indexPath) as! GridCollectionViewCell
                    cell.setViewData(motorsObject: MotorsModel(itemDate: "just now", itemPriceLabel: "AED 130000", itemYear: "2021", itemKM: "32000 KM", itemLocationLabel: "Dubai", itemNameLabel: "Audi, S5", isFavorite: true, itemImages: Statics.adsArray))
                    cell.reloadCollectionView()
                    return cell
                }
            default:
                //0:- Motors,1:-Properties,2_1:-wanted jobs,2_2:-Opping Jobs,3,4,5,7:-Services,6:Plates
                switch subCategoryObject.index {
                case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RowCollectionViewCell", for: indexPath) as! RowCollectionViewCell
                cell.setViewData(motorsObject: MotorsModel(itemDate: "just now", itemPriceLabel: "AED 130000", itemYear: "2021", itemKM: "32000 KM", itemLocationLabel: "Dubai", itemNameLabel: "Audi, S5", isFavorite: true, itemImages: Statics.adsArray))
                cell.reloadCollectionView()
                return cell
                case 1:
                 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertiesRowCollectionViewCell", for: indexPath) as! PropertiesRowCollectionViewCell
                 debugPrint("subCategoryObject-",subCategoryObject.index,subCategoryObject.name)
                 cell.setViewData(propertyObject: PropertyModel(itemDescLabel: "d", itemSqFtLabel: "1000 sq.ft", itemWcLabel: "4", ItemRoomsLabel: "9", itemPriceLabel: "1000,000,000", itemLocationLabel: "UAE", itemNameLabel: "Brand New 5 BR...", itemTypeLabel: "2", isFavorite: false, itemDate: "just now", itemImages: Statics.adsArray) )
                 cell.reloadCollectionView()
                 return cell

                case 2:
                    switch subCategoryObject.subItemIndex {
                    case 1://wanted jobs
                        let itemsData = collectionView.dequeueReusableCell(withReuseIdentifier: "WantedJobRowCollectionViewCell", for: indexPath) as! WantedJobRowCollectionViewCell
                        let job = jobsList[indexPath.row]
                        let jobObject:WantedJobModel=WantedJobModel(jobTitle: job.title , jobLocation: job.enLocation , jobPositions: job.companyName ?? "" , jobType: job.enEmploymentType ?? "" , jobExperiance: job.enMinWorkExperience ?? "", jobDate: job.postDate, isFavorite: job.isFavorite)
                        itemsData.setJobData(data: jobObject)
                        return itemsData
                        
                    default://oppining jobs
                        let itemsData = collectionView.dequeueReusableCell(withReuseIdentifier: "JobsRowCollectionViewCell", for: indexPath) as! JobsRowCollectionViewCell
                        let job = jobsList[indexPath.row]
                        let jobObject:JobModel=JobModel(jobImage: #imageLiteral(resourceName: "default_image"), jobTitle: job.title, companyName: job.companyName ?? "" , jobType: job.enEmploymentType ?? "", jobSalary: job.enMinWorkExperience ?? ""  , jobDate: job.postDate, isFavorite: job.isFavorite)
                        itemsData.setJobData(data: jobObject)
                        itemsData.favoriteButton.tag=indexPath.row
                        return itemsData
                        
                    }
                    
                case 3,4,5,7:
                    let itemsData = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceRowCollectionViewCell", for: indexPath) as! ServiceRowCollectionViewCell
                    itemsData.images=Statics.adsArray
                    switch subCategoryObject.index{
                    case 3:
                        itemsData.images = Statics.normalImages
                        itemsData.serviceTitle.text = servicesList[indexPath.row].categoryEnName
                        itemsData.serviceLocation.text = servicesList[indexPath.row].title
                        itemsData.ageLabel.text = servicesList[indexPath.row].enLocation
                        itemsData.serviceDate.textColor=#colorLiteral(red: 1, green: 0.7098039216, blue: 0.2745098039, alpha: 1)
                        itemsData.serviceDate.font=UIFont.boldSystemFont(ofSize: 16)
                        itemsData.serviceDate.text = servicesList[indexPath.row].postDate
                        break
                    case 4:
                        itemsData.serviceTitle.text = businessList[indexPath.row].title
                        itemsData.serviceLocation.text = businessList[indexPath.row].enLocation
                        itemsData.ageLabel.text = "\(businessList[indexPath.row].price)"
                        itemsData.serviceDate.textColor=#colorLiteral(red: 1, green: 0.7098039216, blue: 0.2745098039, alpha: 1)
                        itemsData.serviceDate.font=UIFont.boldSystemFont(ofSize: 16)
                        itemsData.serviceDate.text = businessList[indexPath.row].postDate
                        break
                    case 5:
                        let item = classifiedList[indexPath.row]
//                        var imgsArray: [String] = []
//                         let imgs = item.pictures
//                            for imgItem in imgs {
//                                 let imgURL = imgItem.imageURL
//                                    var repImg = imgURL.replacingOccurrences(of: "\\", with: ",,")
//                                    repImg = repImg.replacingOccurrences(of: ",," , with: #"/"#)
//                                if imgItem.mainPicture{
//                                    imgsArray.append(repImg)
//                                }
//
//                            }
                    
                        itemsData.imagesStr = item.pictures
                        itemsData.serviceTitle.text = classifiedList[indexPath.row].title
                        itemsData.serviceLocation.text = classifiedList[indexPath.row].enLocation
                        itemsData.ageLabel.text = "\(classifiedList[indexPath.row].price)"
                        itemsData.serviceDate.textColor=#colorLiteral(red: 1, green: 0.7098039216, blue: 0.2745098039, alpha: 1)
                        itemsData.serviceDate.font=UIFont.boldSystemFont(ofSize: 16)
                        itemsData.serviceDate.text = classifiedList[indexPath.row].postDate
                        break
                    case 7:
                        itemsData.serviceDate.textColor=#colorLiteral(red: 1, green: 0.7098039216, blue: 0.2745098039, alpha: 1)
                        itemsData.serviceDate.text="1234444 $"
                        itemsData.serviceDate.font=UIFont.boldSystemFont(ofSize: 16)
                        itemsData.ageLabel.isHidden=false
                        itemsData.ageLabel.text="Age: 1-6 Month"
                        break
                    default:
                        itemsData.ageLabel.isHidden=true
                        itemsData.serviceTitle.text = servicesList[indexPath.row].title
                        
                        break
                    }
                    return itemsData
                    
                case 6:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RowPlatesCollectionViewCell", for: indexPath) as! RowPlatesCollectionViewCell
                    let numbersObject:NumbersModel=NumbersModel(plateOrgineLabel: " Dubai ", plateNumber: "D-22", plateLocation: "Dubai", platePrice: "120000 $", plateImage:#imageLiteral(resourceName: "Plate.png"), isFavorite: false,plateDate: "just now")
                    cell.setPlateData(data: numbersObject)
                    return cell
                default:
                 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RowCollectionViewCell", for: indexPath) as! RowCollectionViewCell
                 cell.setViewData(motorsObject: MotorsModel(itemDate: "just now", itemPriceLabel: "AED 130000", itemYear: "2021", itemKM: "32000 KM", itemLocationLabel: "Dubai", itemNameLabel: "Audi, S5", isFavorite: true, itemImages: Statics.adsArray))
                 cell.reloadCollectionView()
                 return cell
                }

            }
            
        }
    }
    ///0:- Motors,1:-Properties,2_1:-wanted jobs,2_2:-Opping Jobs,3,4,5,7:-Services,6:Plates
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == itemsCollectionView{
            if _isGrid{
                switch subCategoryObject.index{
                case 0:
                    let layout = self.itemsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
                    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    layout.minimumInteritemSpacing = 0
                    layout.itemSize = CGSize(width: Int((itemsCollectionView.frame.width)/2), height: Int((itemsCollectionView.frame.width)/1.5) )
                    debugPrint("isGrid")
                    return layout.itemSize

                case 1:
                    let layout = self.itemsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
                    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    layout.minimumInteritemSpacing = 0
                    layout.itemSize = CGSize(width: Int((itemsCollectionView.frame.width)/2), height: Int((itemsCollectionView.frame.width)/1.5) )
                    debugPrint("isGrid")
                    return layout.itemSize

                case 2:
                    switch subCategoryObject.subItemIndex
                    {
                    case 1:
                        let layout = self.itemsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
                        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                        layout.minimumInteritemSpacing = 0
                        layout.itemSize = CGSize(width: Int((itemsCollectionView.frame.width)/2), height: Int((itemsCollectionView.frame.width)/1.9) )
                        debugPrint("isGrid")
                        return layout.itemSize
                                                
                    default:
                        let layout = self.itemsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
                        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                        layout.minimumInteritemSpacing = 0
                        layout.itemSize = CGSize(width: Int((itemsCollectionView.frame.width)/2), height: Int((itemsCollectionView.frame.width)/2) )
                        debugPrint("isGrid")
                        return layout.itemSize

                    }
                case 3,4,5,7:
                    switch subCategoryObject.index{
                    case 4:
                        let layout = self.itemsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
                        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                        layout.minimumInteritemSpacing = 0
                        layout.itemSize = CGSize(width: Int((itemsCollectionView.frame.width)/2), height: Int((itemsCollectionView.frame.width)/1.8) )
                        return layout.itemSize
                    case 7,5:
                        let layout = self.itemsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
                        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                        let w:Int = getWidth()
                        layout.minimumInteritemSpacing = 0
                        layout.itemSize = CGSize(width: Int((itemsCollectionView.frame.width)/2), height: w )
                        debugPrint("isGrid",w)
                        return layout.itemSize
                    default:
                        let layout = self.itemsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
                        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                        let w:Int = getWidth()
                        layout.minimumInteritemSpacing = 0
                        layout.itemSize = CGSize(width: Int((itemsCollectionView.frame.width)/2), height: w )
                        debugPrint("isGrid",w)
                        return layout.itemSize
                    }
                case 6:
                    let layout = self.itemsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
                    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    layout.minimumInteritemSpacing = 0
                    layout.itemSize = CGSize(width: Int((itemsCollectionView.frame.width)/2), height: Int((itemsCollectionView.frame.width)/2) )
                    debugPrint("isGrid",itemsCollectionView.frame.width/2)
                    return layout.itemSize

                default:
                    let layout = self.itemsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
                    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    layout.minimumInteritemSpacing = 0
                    layout.itemSize = CGSize(width: Int((itemsCollectionView.frame.width)/2), height: Int((itemsCollectionView.frame.width)/1.5) )
                    debugPrint("isGrid")
                    return layout.itemSize

                    
                            
                }
            }else{
                debugPrint("isRow")
                return CGSize(width: itemsCollectionView.width, height: 130)
            }
        }else{
            let size = (testFilltered[indexPath.row] as NSString).size(withAttributes: nil)
            return size
        }
    }
    private func getWidth()->Int{
        let width = Int((itemsCollectionView.frame.width)/1.8)
        if width < 230{
            return 270
        }
        return width
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint("Selected indexPath = ", indexPath.item)
        debugPrint("Property selected")
        //fitch This data from Selecteed Object
        let index=indexPath.row
        if collectionView==fillterCollectionView{
        }
        else if collectionView == itemsCollectionView
        {
            if (subCategoryObject.index == 2){
                presentDetailsVC(viewController: self, catIndex: subCategoryObject.index, subCatIndex: subCategoryObject.subItemIndex, data: jobsList[indexPath.row])
                return
            }
            if (subCategoryObject.index == 3){
                presentDetailsVC(viewController: self, catIndex: subCategoryObject.index, subCatIndex: subCategoryObject.subItemIndex, data: servicesList[indexPath.row])
                return
            }
            if (subCategoryObject.index == 4){
                presentDetailsVC(viewController: self, catIndex: subCategoryObject.index, subCatIndex: subCategoryObject.subItemIndex, data: businessList[indexPath.row])
                return
            }
            if (subCategoryObject.index == 5){
                presentDetailsVC(viewController: self, catIndex: subCategoryObject.index, subCatIndex: subCategoryObject.subItemIndex, data: classifiedList[indexPath.row])
                return
            }
            presentDetailsVC(viewController: self, catIndex: subCategoryObject.index, subCatIndex: subCategoryObject.subItemIndex, data: listOfUsedCar[indexPath.row])
//                DetailsViewController.selectedCategory=
//                DetailsViewController.jobSubCategoryIndex=
//                forcePresentViewController(viewController: self, storyBoardId: "DetailsViewController")
                //pushtoViewController(viewController: self, storyBoardId: "DetailsViewController", animate: true)
        
            }
    }
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        if collectionView==itemsCollectionView{
//            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ItemsHeaderCollectionReusableView", for: indexPath) as! ItemsHeaderCollectionReusableView
//
//            header.headerLabel.text=subCategoryObject.name
//            return header
//        }else{
//            return UICollectionReusableView()
//        }
//    }
    @objc func sortDropDownAction(){
      //  sortDropDown.show()
        
    }

}
//MARK: ScrollView Delegate:-OnScroll-HideTabBar
extension SubCategoriesViewController: UIScrollViewDelegate
{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        debugPrint("EndScrolling")

        self.showAddButton( hidden: true)
        self.changeTabBarHeight(height: 0, hidden: false)
        self.changeTopBarHeight(height: 60, hidden: false)

    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.lastContentOffset > scrollView.contentOffset.y) {
            // move up
            debugPrint("Scorlling up")
            self.showAddButton( hidden: true)
            self.changeTabBarHeight(height: 0, hidden: false)
            self.changeTopBarHeight(height: 60, hidden: false)

        }
        else if (self.lastContentOffset < scrollView.contentOffset.y) {
            // move down
            debugPrint("Scorlling down-scrollViewDidScroll")
            self.showAddButton(hidden: false)
            self.changeTabBarHeight(height: -70, hidden: false)
            self.changeTopBarHeight(height: 0, hidden: true)

        }

        ///update the new position acquired
        self.lastContentOffset = scrollView.contentOffset.y
    }
private func showAddButton(hidden:Bool){
    scrollTotopButton.isEnabled = !hidden
    scrollTotopButton.isHidden = hidden
    
    }
    private func changeTabBarHeight(height:CGFloat,hidden:Bool){
        UIView.animate(withDuration: duration) {
            self.bottomBar_BConstraint.constant=height
            self.bottomView.isHidden=hidden
            self.topBar_HConstraint.constant=height
            self.topView.isHidden=hidden
        } completion: { (true) in
            // self.tabBarView.isHidden=hidden
            debugPrint("Done")
        }
    }
    private func changeTopBarHeight(height:CGFloat,hidden:Bool){
        UIView.animate(withDuration: duration) {
            self.topBar_HConstraint.constant=height
            self.fillterCollectionView.isHidden=hidden
            self.topView.isHidden=hidden
        } completion: { (true) in
            // self.tabBarView.isHidden=hidden
            debugPrint("Done")
        }
    }
    
    func getClassified(category: Int ,subCategoryID: Int , location: String?) {
        WebService.shared.getClassified(categoryId: category,
                                       subCategoryID: subCategoryID  ,
                                   postedIN: 4,
                                        age:"" ,
                                        usage: "",
                                        brand: "",
                                        keyword: "",
                                        subTypeId: "9",
                                        sortBy: 1,
                                   location: "",
                                   fromPrice: 0,
                                   toPrice: 99999999999999,
                                  completion: { [weak self] response, error in
            
            guard let self = self else { return }
//                debugPrint("\(model.categoyID) model.categoyID")
            self.view.hideLoading()
            guard let response = response, error == nil else {

                self.showFailureAlert(title: error?.localizedDescription)
                 return
            }
            
            self.classifiedList =  response
            DispatchQueue.main.async {
                self.itemsCollectionView.reloadData()
            }
            
        })
    }
    
    func getBusinessFilter(category: Int ,subCategoryID: Int , location: String?) {
        WebService.shared.getBusinesses(categoryId: category,
                                       subCategoryID: subCategoryID  ,
                                   postedIN: 4,
                                   location: "",
                                   fromPrice: 0,
                                   toPrice: 9999999999999,
                                  completion: { [weak self] response, error in
            
            guard let self = self else { return }
//                debugPrint("\(model.categoyID) model.categoyID")
            self.view.hideLoading()
            guard let response = response, error == nil else {

                self.showFailureAlert(title: error?.localizedDescription)
                 return
            }
            
            self.businessList =  response
            DispatchQueue.main.async {
                self.itemsCollectionView.reloadData()
            }
            
        })
    }
    func getServicesFilter(category: Int ,subCategoryID: Int , location: String?) {
        WebService.shared.getServices(categoryId: category,
                                       subCategoryID: subCategoryID  ,
                                   postedIN: 4,
                                   location: "",
                                  completion: { [weak self] response, error in
            
            guard let self = self else { return }
//                debugPrint("\(model.categoyID) model.categoyID")
            self.view.hideLoading()
            guard let response = response, error == nil else {

                self.showFailureAlert(title: error?.localizedDescription)
                 return
            }
            
            self.servicesList =  response
            DispatchQueue.main.async {
                self.itemsCollectionView.reloadData()
            }
            
        })
        
    }
    func getJobsFilter(category: Int) { // 3 openning jobs --- 4 wanted
        

        WebService.shared.getJobs(categoryId: "\(category)"
                                  ,careerLevel: SubCategoriesViewController.careerLevel
                                  , employmentType: SubCategoriesViewController.employmentType
                                  , completion: { [weak self] response, error in
            guard let self = self else { return }
//                debugPrint("\(model.categoyID) model.categoyID")
            guard let response = response, error == nil else {

                self.showFailureAlert(title: error?.localizedDescription)
                 return
            }
            
            self.jobsList =  response
            DispatchQueue.main.async {
                self.itemsCollectionView.reloadData()
            }
            
        })
        
    }
    func getMotorFilter() {
        

        WebService.shared.getMotorFilter(maker: SubCategoriesViewController.maker, model: SubCategoriesViewController.model, categoryId: SubCategoriesViewController.categoryId, completion: { [weak self] response, error in
            guard let self = self else { return }
//                debugPrint("\(model.categoyID) model.categoyID")
            guard let response = response, error == nil else {

                self.showFailureAlert(title: error?.localizedDescription)
                 return
            }
            
            self.listOfUsedCar =  response
            DispatchQueue.main.async {
                self.itemsCollectionView.reloadData()
            }
            
        })
        
    }

}


//MARK:-Table View Controllers-
