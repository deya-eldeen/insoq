//
//  HomeViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 07/02/2021.
//

import UIKit
import IQKeyboardManagerSwift

class HomeViewController: UIViewController {

    @IBOutlet weak var mainNavBar: MainNavView!
    private var lastContentOffset: CGFloat = 0
    @IBOutlet weak var tabbarBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var tabBarView: BottomView!
    @IBOutlet weak var hiddenButton: UIButton!
    
    @IBOutlet weak var scrollViewBottonConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollViewLeftConstraint: NSLayoutConstraint!
       
    private var duration: TimeInterval = 6.0
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var adsCollectionView: UICollectionView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var adspageController: UIPageControl!
    @IBOutlet weak var itemTableView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var setupAlertButton: UIButton!
    
    var listOfSubCategories =  [Category]()
    var listOfAdsCategories =  [String:[AdsOfCategoryModel]]()

    lazy var heightOFAdsCategorye:CGFloat = {
        return  270 //self.view.bounds.height  / 4
    }()
    
    //Categories Test Data
    
    var counter:Int = 0
    var timer = Timer()
    var indexPath:Int = 0
    
    //MARK: - dropDown Variables
    let dropDown = MakeDropDown()
    var cityModelArr: [CountryModel] = [CountryModel]()
    var dropDownRowHeight: CGFloat = 50
    
    //MARK: -  subcategory pop up
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var subCategoriesTableView: UITableView!
    @IBOutlet weak var subCategoriesTableViewHeightConstraint: NSLayoutConstraint!
    
    //subCategoriesVariables
    var headerObject=SubCategoryObject(viewColor: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), name: "", icon: #imageLiteral(resourceName: "sms_icon"), index: 0, subItemIndex: 0)

    override func viewDidLoad() {

        super.viewDidLoad()

        print(Shared.shared.getUserId())
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = #colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 0.4523653575)
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)

        Statics.defaults.setValue("UAE", forKey: "city")
        mainNavBar.setVC(viewController: self)
        //showAddButton(alpha: 0, hidden: true)
        tabBarView.setVC(viewController: self)
        hiddenButton.addTarget(self, action: #selector(self.addPressed), for: .touchUpInside)
        registerXib()
        
    }
    
    @objc func addPressed(){
        let controller = Assembly.addViewController
        present(controller, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
       // tabBarView.setVC(viewController: self)
        hideSubCategoryView()
        setDesign()
        setupDelegates()
     //   calculateheight()
        categoriesCollectionView.reloadData()
        getAllAdsData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
      //  setUpDropDown()
        //  populateCityModelArray()
       // setUpGestures()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    
    @IBAction func setupAlert_Pressed(_ sender: Any) {
        debugPrint("setupAlert_Pressed")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.isKind(of: HomeViewController.self) {
            let touch = touches.first
            if touch?.view?.tag != 2 {
                debugPrint("touchesBegan,subCategoriesTableView")
                backgroundView.isHidden=true
                subCategoriesTableView.isHidden=true
            }
            if touch?.view == subCategoriesTableView{
                debugPrint("Something")
            }
        }
    }
    
    private func registerXib() {

        let nib = UINib(nibName: "CustomSectionHeader", bundle: nil)
        itemTableView.register(nib, forHeaderFooterViewReuseIdentifier: "customSectionHeader")
        
        itemTableView.sectionHeaderHeight=25
        itemTableView.estimatedSectionHeaderHeight=25
        
        let xib = UINib(nibName: "SubCategoryHeader", bundle: nil)
        subCategoriesTableView.register(xib, forHeaderFooterViewReuseIdentifier: "subCategoryHeader")
        subCategoriesTableView.sectionHeaderHeight=25
        subCategoriesTableView.estimatedSectionHeaderHeight=25

    }
    
    @objc private func hideSubCategoryView( ){
        backgroundView.isHidden=true
        subCategoriesTableView.isHidden=true
    }
    
    @objc func showSubCategoryView(image:UIImage ,name:String ,index:Int) {

        headerObject.icon=image
        headerObject.name=name
        headerObject.index=index
        headerObject.viewColor = Statics.categoyModel[index].categoyColor
        getSubCategory(id: Statics.categoyModel[index].categoyID)
        
    }
    
    private func setDesign() {
        subCategoriesTableView.layer.cornerRadius = 10
        setupAlertButton.layer.cornerRadius=setupAlertButton.frame.height / 2
        self.adspageController.numberOfPages = Statics.adsArray.count
        DispatchQueue.main.async {
            //  if !Statics.adsArray.isEmpty{
            self.timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
            // }
        }

    }
    
    private func setupDelegates() {
        scrollView.delegate=self
      //  searchTextField.delegate = self
        categoriesCollectionView.delegate=self
        categoriesCollectionView.dataSource=self
        adsCollectionView.delegate = self
        adsCollectionView.dataSource = self
        itemTableView.delegate = self
        itemTableView.dataSource = self
        subCategoriesTableView.delegate = self
        subCategoriesTableView.dataSource = self
    }
    //MARK: - Selector Methods
    
    @objc func didTapCategory(gesture: UITapGestureRecognizer) {
            view.endEditing(true)
            let touchLocation:CGPoint = gesture.location(ofTouch: 0, in: self.categoriesCollectionView)
            let indexPath = self.categoriesCollectionView.indexPathForItem(at: touchLocation)
            if indexPath != nil {
                let cell = self.categoriesCollectionView.cellForItem(at: indexPath!)
                if (cell?.isSelected)! {
                    debugPrint("cell?.isSelected")
                    ///PREFORM DESELECT
                } else {
                    ///PREFORM SELECT HERE
                               debugPrint("cell?.unSelected")

                    if let index = indexPath?.row{
                        //print("Category Index = \(index)")
                        self.indexPath = index
                        SubCategoriesViewController.subCategoryObject.index = index

                        showSubCategoryView(image: Statics.categoyModel[index].categoryImage, name: Statics.categoyModel[index].categoryName, index: index)
                        

                        //performSegue(withIdentifier: "categoryToSubCategorySegue", sender: nil)
                    }else{
                        print("Error - indexPath nil !")
                    }
                }
            }
        }
    
    @objc func testLabelTapped() {
        // Give height to drop down according to requirement
        // In this it will show 5 rows in dropdown as per calculations
        self.dropDown.showDropDown(height: self.dropDownRowHeight * 5)
    }
    
    //Ads Explor button pressed
    @objc func explor_Pressed(sender:UIButton){
        debugPrint("sender",sender.tag)
    }
    
    //Auto scroll collectionview
    @objc func changeImage() {
        
        if counter < Statics.adsArray.count {
            let index = IndexPath.init(item: counter, section: 0)
            if let rect = self.adsCollectionView.layoutAttributesForItem(at: index)?.frame{
                self.adsCollectionView.scrollRectToVisible(rect, animated: true)}
            adspageController.currentPage = counter
            counter += 1
        }
        else
        {
            counter = 0
            let index = IndexPath(item: counter, section: 0)
            if let rect = self.adsCollectionView.layoutAttributesForItem(at: index)?.frame{
                self.adsCollectionView.scrollRectToVisible(rect, animated: true)}
            adspageController.currentPage = counter
            counter = 1
        }
        
    }
    //tableview header "view all buttom" pressed
    @objc func viewAll_Pressed(sender:UIButton){
        debugPrint("viewAll_Pressed",sender.tag)
        let index =  sender.tag
        

showSubCategoryView(image: Statics.categoyModel[index].categoryImage, name:             Statics.categoyModel[index].categoryName, index: index)
        SubCategoriesViewController.subCategoryObject.index = index
//        forcePresentViewController(viewController: self, storyBoardId: "SubCategoriesViewController")
    }
    
    ///calculating views height
    private func calculateTableViewheight(){

//        bottomViewHeightConstraint.constant = 0
    var height = CGFloat(((listOfSubCategories.count + 1)*70) + (listOfSubCategories.count * 8))
        if height > self.view.bounds.height - 100 {
            height = self.view.bounds.height - 100
        }
        subCategoriesTableViewHeightConstraint.constant = height
        debugPrint("subCategoriesTableViewHeightConstraint",subCategoriesTableViewHeightConstraint.constant)
        debugPrint("calculateheight",bottomViewHeightConstraint.constant)
    }

}
//MARK:-
extension HomeViewController: MakeDropDownDataSourceProtocol{
    func getDataToDropDown(cell: UITableViewCell, indexPos: Int, makeDropDownIdentifier: String) {
        if makeDropDownIdentifier == "DROP_DOWN_NEW"{
            let customCell = cell as! DropDownTableViewCell
            customCell.titleLabel.text = self.cityModelArr[indexPos].countryName
          //  customCell.cityNameLabel.text = self.cityModelArr[indexPos].cityName
            print("test")
        }
    }
    
    func numberOfRows(makeDropDownIdentifier: String) -> Int {
        return self.cityModelArr.count
    }
}

//MARK:-CollectionView Controllers-
extension HomeViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == adsCollectionView {
            return Statics.categoyModelTop.count
        }else {
            return Statics.categoyModelTop.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoriesCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
            cell.setCategoriesData(data: Statics.categoyModelTop[indexPath.row])
            return cell
        }
        else {
            let adsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdsCollectionViewCell", for: indexPath) as! AdsCollectionViewCell
            //adsCell.backgroundColor  = .red
            adsCell.setAdsData(image: Statics.adsArray[indexPath.row])
            adsCell.explorButton.tag=indexPath.row
            adsCell.explorButton.addTarget(self, action: #selector(explor_Pressed(sender:)), for: .touchUpInside)
            return adsCell
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
        header.setHeader(headerName:"Choose a category")
        header.headerLabel.adjustsFontSizeToFitWidth=true
        return header
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint("Selected indexPath = ", indexPath.item)
                debugPrint("Property selected")
                    //fitch This data from Selecteed Object
        let index=indexPath.row
        if collectionView==categoriesCollectionView{
            SubCategoriesViewController.subCategoryObject.index = indexPath.row
            showSubCategoryView(image: Statics.categoyModelTop[index].categoryImage, name: Statics.categoyModelTop[index].categoryName, index: index)

            

        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView==adsCollectionView{
            
            let layout = self.adsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionInset = UIEdgeInsets(top: 5, left: 2, bottom: 5, right: 2)
            layout.minimumInteritemSpacing = 2
            layout.itemSize = CGSize(width: Int(adsCollectionView.frame.width), height: Int(adsCollectionView.frame.height-30) )
            return layout.itemSize
            
        }else{
            
            let layout = self.categoriesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionInset = UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0)
            layout.minimumInteritemSpacing = 0
            layout.itemSize = CGSize(width: Int((categoriesCollectionView.frame.width-10)/4), height: 100 )
            return layout.itemSize
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView==adsCollectionView{
            return 0
        }
        else{ return 2}
    }
    
}
//MARK:-TableView Controllers-
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView==subCategoriesTableView{
            return  70
        }else{
            return heightOFAdsCategorye
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView==subCategoriesTableView {
            return 70
        }
        else {
            return 25
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if tableView == subCategoriesTableView {
            
            let subCategoryHeader = self.subCategoriesTableView.dequeueReusableHeaderFooterView(withIdentifier: "subCategoryHeader") as! SubCategoryHeader
            subCategoryHeader.cancelButton.tag=section
            subCategoryHeader.categoryImage.image=headerObject.icon
            subCategoryHeader.categoryname.text=headerObject.name
            subCategoryHeader.viewToColor.backgroundColor=headerObject.viewColor
            subCategoryHeader.cancelButton.addTarget(self, action: #selector(hideSubCategoryView), for: .touchUpInside)
            return subCategoryHeader

        } else {
            
            let header = self.itemTableView.dequeueReusableHeaderFooterView(withIdentifier: "customSectionHeader") as! CustomSectionHeader
            let keyIndex = section
            
            if(Statics.categoyModel.count >= (keyIndex + 1)) {
                let image =  Statics.categoyModel[keyIndex].categoryImage
                let categoryModel =  Statics.categoyModel[keyIndex]
                header.itemImage.image = image.withRenderingMode(.alwaysTemplate)
                header.itemImage.tintColor = Statics.categoyModel[keyIndex].categoyColor
                header.titleLabel.text = categoryModel.categoryName
            }
            
            header.viewAllButton.tag = keyIndex
            header.viewAllButton.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .normal)
            header.titleLabel.adjustsFontSizeToFitWidth=true
            header.titleLabel.font=UIFont.boldSystemFont(ofSize: 16)
            header.viewAllButton.addTarget(self, action: #selector(viewAll_Pressed(sender:)), for: .touchUpInside)
            
            return header
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {

        if tableView == subCategoriesTableView {
            return  1
        } else {
            return  listOfAdsCategories.keys.count
        }

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if tableView==itemTableView{
            return 1
        } else {
            return  listOfSubCategories.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView == subCategoriesTableView) {
            
            let subCategoryData:SubCategoriesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SubCategoriesTableViewCell", for: indexPath) as! SubCategoriesTableViewCell
                let model = listOfSubCategories[indexPath.row]
                subCategoryData.setSubCategoryDataModel(model: model)
            
            return subCategoryData

        } else {
            let itemsData:ItemsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ItemsTableViewCell", for: indexPath) as! ItemsTableViewCell
            
            let key = Statics.categoyModel[indexPath.section].categoyID
            
            if let list = listOfAdsCategories[key] {
                itemsData.setCollectionViewDataByModel(list: list,categoryId: key)
            }
            
            itemsData.vc = self
            itemsData.reloadCollectionView()
            
            return itemsData

        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
        if (tableView == subCategoriesTableView) {
             
             print(headerObject.index)
             print(indexPath.row)
             print(listOfSubCategories[indexPath.row].id!)

             Shared.shared.categoryId = listOfSubCategories[indexPath.row].id!
             Shared.shared.category = headerObject.index
             Shared.shared.categoryIndex = indexPath.row
             
             if headerObject.index == 0 || headerObject.index == 2 || headerObject.index == 5 || headerObject.index == 6 || headerObject.index == 7 {
                 let storyboard = UIStoryboard(name: "Main2", bundle: nil)
                 let controller = storyboard.instantiateViewController(withIdentifier: "BrandVc")
                 controller.modalPresentationStyle = .fullScreen
                 self.present(controller, animated: true, completion: nil)
             }else if headerObject.index == 3 || headerObject.index == 4{
                 let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                 SubCategoriesViewController.subCategoryObject.subItemIndex = headerObject.index
                 SubCategoriesViewController.subCategoryObject.name = Statics.categoyModel[headerObject.index].categoryName
                 let vc = mainStoryboard.instantiateViewController(identifier: "SubCategoriesViewController") as! SubCategoriesViewController
                 vc.modalPresentationStyle = .fullScreen
                 vc.catID = listOfSubCategories[indexPath.row].id!
                 self.present(vc, animated: false)
             }


        } else if tableView==itemTableView {
            debugPrint("-indexPath",indexPath)
            
        }
        debugPrint("---indexPath",indexPath)

    }

}
// request API
extension HomeViewController{

    func getSubCategory(id:String) {
        
        print("getSubCategory_",id)
        
        view.showLoading()
        WebService.shared.CategoriesGetByTypeId(id: id) { [weak self] response, error in
            guard let self = self else { return }
            self.view.hideLoading()
            
            guard let response = response, error == nil else {
                self.showFailureAlert(title: error?.localizedDescription)
                return
            }

            print("getSubCategory_response",response)
            
            self.listOfSubCategories = response
                
            self.calculateTableViewheight()
            self.subCategoriesTableView.reloadData()
            
            self.backgroundView.isHidden=false
            self.subCategoriesTableView.isHidden=false
        }
    }
    
    func getAllAdsData(index:Int = 0) {
        
        print("getAllAdsData", index)
        
        if index < Statics.categoyModel.count {
            getAdsOfCategory(model: Statics.categoyModel[index], completeParsing: { goNext() } )
        } else {
            self.view.hideLoading()
            let count:CGFloat = CGFloat(listOfAdsCategories.keys.count )
            debugPrint("FINISHLOADING ,\(count)")

            DispatchQueue.main.async {
                let heightRow = self.heightOFAdsCategorye
                self.bottomViewHeightConstraint.constant=CGFloat((count*35)+( count * heightRow )+100)
                debugPrint("FINISHLOADING bottomViewHeightConstraint,\(self.bottomViewHeightConstraint.constant)")
                self.itemTableView.reloadData()
            }
            
        }
        
        func goNext() {
            let nextIndex = index + 1
            self.getAllAdsData(index: nextIndex)
        }
        
        func getAdsOfCategory(model:CategoriesModel,completeParsing:@escaping(()->Void)) {
            
            WebService.shared.CategoriesADSGetByTypeId(id: model.categoyID) { [weak self] response, error in
                guard let self = self else { return }
                guard let response = response, error == nil else {
                    debugPrint("\(model.categoyID) model.categoyID error:\(error)")

                    self.showFailureAlert(title: error?.localizedDescription)
                    completeParsing()
                    return
                }
                
                self.listOfAdsCategories[model.categoyID] = response
                completeParsing()
                
            }
        }
        
    }
        
}
