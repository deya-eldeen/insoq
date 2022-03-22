//
//  MotorsBrandsViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 21/04/2021.
//

import UIKit
struct BrandsModel{
    var brandImage:UIImage?
    var brandName:String?
    var brandID:String?
    var brandType=[BrandType]()
}
struct BrandType{
    var typeImage:UIImage?
    var typeName:String?
    var typeID:String?

}
class MotorsBrandsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    public static var isUsed:Bool = false
    public static var markerSelect:GetAllMotorMakerModel?
    var listData: [GetAllMotorMakerModel]?

    @IBOutlet weak var vcTitle: UILabel!
    
    @IBOutlet weak var bottomBar: BottomBar!
   
    var selectedBrand:BrandsModel=BrandsModel()
    
    @IBOutlet weak var brandsTableView: UITableView!
    var _isBrandSelected:Bool=false
    
    var testBrands:[BrandsModel]=[BrandsModel()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomBar.setVC(viewController: self)

        brandsTableView.delegate=self
        brandsTableView.dataSource=self
        if MotorsBrandsViewController.isUsed && MotorsBrandsViewController.markerSelect == nil {
            self.vcTitle.text = "Maker"
            self.getMaker()
        }
        
        else if MotorsBrandsViewController.isUsed && MotorsBrandsViewController.markerSelect != nil {
            self.vcTitle.text = "Models"
            let nameEn = MotorsBrandsViewController.markerSelect!.enText  ?? ""

            self.getCarModelByMaker(maker: nameEn + "-" )
        }
    }
    override func viewWillAppear(_ animated: Bool) {
     
       
    }
    @IBAction func back_Pressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if MotorsBrandsViewController.isUsed {
            return listData?.count ?? 0
        }else{
            if _isBrandSelected{
                return selectedBrand.brandType.count
            }else{
                return testBrands.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if MotorsBrandsViewController.isUsed {
            let cell=tableView.dequeueReusableCell(withIdentifier: "BrandsTableViewCell", for: indexPath) as! BrandsTableViewCell
            cell.brand_Type.text = self.listData?[indexPath.row].enText ?? ""
            cell.brand_icon.isHidden = true
            return cell
            
            
        }else{
        if _isBrandSelected{
            let cell=tableView.dequeueReusableCell(withIdentifier: "BrandsTableViewCell", for: indexPath) as! BrandsTableViewCell
            cell.setTypes(type: selectedBrand.brandType[indexPath.row])
            return cell
        }else{
        let cell=tableView.dequeueReusableCell(withIdentifier: "BrandsTableViewCell", for: indexPath) as! BrandsTableViewCell
            cell.setBrands(brand: testBrands[indexPath.row])
            return cell
        }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if MotorsBrandsViewController.isUsed {
          debugPrint("MotorsBrandsViewController.isUsed")
            if MotorsBrandsViewController.markerSelect == nil{
                
                
            MotorsBrandsViewController.isUsed = true
            MotorsBrandsViewController.markerSelect = self.listData?[indexPath.row]
            forcePresentViewController(viewController: self, storyBoardId: "MotorsBrandsViewController" )
                
            }else{
                
                // make if false // mohammed ramdan
                SubCategoriesViewController.isUsedCard = true
                
                let modelName = self.listData?[indexPath.row].enText ?? ""

                SubCategoriesViewController.model = modelName
                SubCategoriesViewController.maker =  MotorsBrandsViewController.markerSelect?.enText ?? ""

                forcePresentViewController(viewController: self, storyBoardId: "SubCategoriesViewController")

            }
        }
        else{
        if _isBrandSelected{
            _isBrandSelected=false
            if let index=indexPath.row as? Int{
                SubCategoriesViewController.subCategoryObject.name="loo"//selectedBrand.brandType[index].typeName ?? "Motors"
            }
            forcePresentViewController(viewController: self, storyBoardId: "SubCategoriesViewController")
        }
        else{
            selectedBrand=testBrands[indexPath.row]
            vcTitle.text=selectedBrand.brandName
            _isBrandSelected=true
            brandsTableView.reloadData()
        }
        }
    }
    
    
    
    func getMaker() {
        self.view.showLoading()
        WebService.shared.GetAllMotorMakerModel { [weak self] response, error in
            guard let self = self else { return }
            self.view.hideLoading()
            guard let response = response, error == nil else {
                self.showFailureAlert(title: error?.localizedDescription)
                return
            }
            self.listData = response
            DispatchQueue.main.async {
                self.brandsTableView.reloadData()
            }
//            self.carBrandAdapter?.set(items: response.compactMap {$0.enText})
        }
    }
    func getCarModelByMaker(maker: String) {
        self.view.showLoading()
        WebService.shared.GetAllMotorModelByMaker(maker: maker) { [weak self] response, error in
            guard let self = self else { return }
            self.view.hideLoading()
            guard let response = response, error == nil else {
                self.showFailureAlert(title: error?.localizedDescription)
                return
            }
            self.listData = response
            DispatchQueue.main.async {
                self.brandsTableView.reloadData()
            }
//            self.carModelAdapter?.set(items: response.compactMap {$0.enText})
        }
    }
}
