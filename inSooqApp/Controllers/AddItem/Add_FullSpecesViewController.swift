//
//  Add_FullSpecesViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 01/03/2021.
//

import UIKit
import DropDown
import PhotosUI
public let TAG_ME = "mhmathkour"
class Add_FullSpecesViewController: UIViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var reasonDescTxv: UITextView!
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var uploadImageView: UIImageView!
    
    @IBOutlet weak var itemPriceTxt: UITextField!
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var spacsTextFiled: UITextField!
    @IBOutlet weak var colorTextFiled: UITextField!
    @IBOutlet weak var doorsTextFiled: UITextField!
    @IBOutlet weak var warrntyTextFiled: UITextField!
    @IBOutlet weak var transmissionTextFiled: UITextField!
    @IBOutlet weak var bodyTypeTextField: UITextField!
    @IBOutlet weak var fuelTypeTextFiled: UITextField!
    @IBOutlet weak var numberOfCylindersTextField: UITextField!
    
    @IBOutlet weak var txtFSteeringSide: UITextField!
    @IBOutlet weak var txtFHorsepower: UITextField!
    @IBOutlet weak var txtFYourLocation: UITextField!
    @IBOutlet weak var txtFYourMilage: UITextField!
    @IBOutlet weak var txtFPhoneNumber: UITextField!
    var imageName = "";

    
    @IBOutlet var textFields: [UITextField]!
    // MARK: DropDowns
    var viewPopupListOfItems:ViewPopupListOfItems = .fromNib()
    //MARK: - Variables
    var addedUsesCarItemsID:Int?
    var allModel: AllSelectedModel?
    var response: AddInitialMotorModel?
    
    var specsOptions = [GetAllMotorMakerModel]()
    var colorOptions = [GetAllMotorMakerModel]()
    var doorsOptions = [GetAllMotorMakerModel]()
    var warrentyOptions = [GetAllMotorMakerModel]()
    var transmissionsOptions = [GetAllMotorMakerModel]()
    var bodyOptions = [GetAllMotorMakerModel]()
    var fuelOptions = [GetAllMotorMakerModel]()
    var cylindersOptions = [GetAllMotorMakerModel]()
    var listSteeringSide = [GetAllMotorMakerModel]()
    var listHorsepower = [GetAllMotorMakerModel]()
    var listYourLocation = [GetAllMotorMakerModel]()

    var motorObject = MotorsModel(itemDate: "", itemPriceLabel: "", itemYear: "", itemKM: "", itemLocationLabel: "", itemNameLabel: "", isFavorite: false, itemImages: Statics.adsArray)
    
    var collectionImages = [UIImage]()
    var picker:UIImagePickerController?=UIImagePickerController()
    var selectedTextField: UITextField?
    //MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sell an Item"
        //        bottomView.setVC(viewController: self)
        
        textFields.forEach({$0.delegate = self})
        getAllDropDowns()
        //
        viewPopupListOfItems.frame = self.view.bounds
        viewPopupListOfItems.isHidden = true
        self.view.addSubview(viewPopupListOfItems)


        [spacsTextFiled,colorTextFiled,doorsTextFiled,
         warrntyTextFiled,transmissionTextFiled,bodyTypeTextField,
         fuelTypeTextFiled,numberOfCylindersTextField,txtFSteeringSide,txtFHorsepower,txtFYourLocation,txtFPhoneNumber,txtFYourMilage].forEach{
            $0?.textColor = .black
            $0?.font = UIFont.systemFont(ofSize: 14)
            $0?.borderWidth = 0
        }
        textFields.forEach{
            $0.textColor = .black
            $0.font = UIFont.systemFont(ofSize: 14)
            $0.borderWidth = 0
        }
        
        itemPriceTxt.font = UIFont.systemFont(ofSize: 14)
        itemPriceTxt.borderWidth = 0
    }
    
    func getAllDropDowns() {
        
        view.showLoading()
        let list: [EndPoint] = [
            .GetAllColor,
            .GetAllBodyType,
            .GetAllDoor,
            .GetAllFuelType,
            .GetAllMotorRegionalSpecs,
            .GetAllTransmission,
            .GetAllNoOfCylinders,
                . GetSteeringSide,
                . GetHorsepower,
                .GetYourLocation
        ]
        
        let group = DispatchGroup()
        
        for service in list {
            
            group.enter()
            getDropdown(serviceName: service) {
                group.leave()
            }
        }
        
        group.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            self.view.hideLoading()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setDesign()
        debugPrint("motorsObject",motorObject)
        reasonDescTxv.text = "Tell us more...".localized
        reasonDescTxv.textColor = UIColor.lightGray
        
        imagesCollectionView.delegate=self
        imagesCollectionView.dataSource=self
        
        let imagesNib = UINib(nibName: "ItemImagesCollectionViewCell", bundle: nil)
        
        imagesCollectionView.register(imagesNib, forCellWithReuseIdentifier: "ItemImagesCollectionViewCell")
        registerViews()
    }
    
    private func setDesign() {
        
        objectCornerRadius(object: reasonDescTxv, cornerRadius: 5)
        reasonDescTxv.addShadowToView()
        reasonDescTxv.borderWidth=0
    }
    
    
    @objc func uploadImage() {
        
        debugPrint("uploadImage")
        selectImage()
    }
    
    private func registerViews() {
        
        let card: MotorCardView = {
            let view = MotorCardView()
            view.backgroundColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        cardView.addSubview(card)
        card.setViewData(motorsObject: motorObject)
        card.widthAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 1).isActive=true
        card.heightAnchor.constraint(equalTo: cardView.heightAnchor, multiplier: 1).isActive=true
        objectShadow(object: card, cornerRadius: 10)
    }
}

extension Add_FullSpecesViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "ItemImagesCollectionViewCell", for: indexPath) as! ItemImagesCollectionViewCell
        cell.deleteButton.tag=indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(self.deleteImage(sender:)), for: .touchDown)
        objectCornerRadiusShadow(with: cell.itemImage)
        cell.setImagesData(data: collectionImages[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let imagecell = self.imagesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        imagecell.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        imagecell.minimumInteritemSpacing = 4
        imagecell.itemSize = CGSize(width:( Int(self.imagesCollectionView.frame.size.width)/5), height: Int(imagesCollectionView.frame.height)-20)
        imagesCollectionView.reloadData()
        return imagecell.itemSize
    }
}

extension Add_FullSpecesViewController: UIImagePickerControllerDelegate, UIPopoverControllerDelegate, UINavigationControllerDelegate {
    
    func presentCamera() {
        
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func Gallary() {
        
        let vc = UIImagePickerController()
        vc.sourceType = .savedPhotosAlbum
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.popViewController(animated: true)
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if collectionImages.count == 0{
            if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
                   let  fileName = url.lastPathComponent
                   let fileType = url.pathExtension
                imageName =  fileName
                debugPrint("\(TAG_ME) imageName:\(imageName)")

                }
            
        }
        guard let chosenImage = info[.originalImage] as? UIImage else { return}
        collectionImages.append(chosenImage)
    
        //  imagesCollectionView.reloadData()
        self.dismiss(animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.refresher()
            
        }
    }
    
    func refresher() {
        
        imagesCollectionView.reloadData()
        let i = IndexPath(row: collectionImages.count-1, section: 0)
        self.imagesCollectionView.scrollToItem(at: i, at: .centeredHorizontally, animated: true)
        self.imagesCollectionView.setNeedsLayout()
        
        
    }
    
    @objc func deleteImage(sender:UIButton) {
        
        debugPrint("deleteing Image")
        self.collectionImages.remove(at: sender.tag)
        imagesCollectionView.reloadData()
    }
    
    @objc func selectImage() {
        
        let imagePickerController = UIImagePickerController()
        
        let actionSheet = UIAlertController(title: "Choose Photo Source".localized, message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera".localized, style: .default, handler: { (action: UIAlertAction)
            in
            if (UIImagePickerController.isSourceTypeAvailable(.camera))
            {
                self.presentCamera()
                // self.present(imagePickerController , animated:  true , completion:  nil)
            }
            else{
                debugPrint ("Camera has no permission")
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Gallary".localized, style: .default , handler: { (action: UIAlertAction)
            
            in
            self.Gallary()
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel".localized, style: .cancel , handler: nil))
        
        present(actionSheet , animated: true, completion:  nil)
    }
    func requestApis() {
        self.view.showLoading()
        let adId = (self.addedUsesCarItemsID ?? 0)
        let description = reasonDescTxv.text ?? ""
        
        let location = getValueFrmList(textFeild: txtFYourLocation, list: listYourLocation)
        let lat = "0"
        let lng = "0"
        let mainPhoto =  collectionImages.count > 0 ? imageName  : ""
        let categoryId = allModel?.selectedCategory?.id ?? 0
        let kilometers = txtFYourMilage.text ?? ""
        let color = getValueFrmList(textFeild: colorTextFiled, list: colorOptions)
        let doors = getValueFrmList(textFeild: doorsTextFiled, list: doorsOptions)
        let warranty = getWarrentyValue()
        let transmission = getValueFrmList(textFeild: transmissionTextFiled, list: transmissionsOptions)
        let bodyType =  getValueFrmList(textFeild: bodyTypeTextField, list: bodyOptions)
        let fuelType = getValueFrmList(textFeild: fuelTypeTextFiled, list: fuelOptions)
        let noOfCylinders = getValueFrmList(textFeild: numberOfCylindersTextField, list: cylindersOptions)
        let steeringSide =  getValueFrmList(textFeild: txtFSteeringSide, list: listSteeringSide)
        let horsepower = getHorsePowerValie()
        let price = itemPriceTxt.text ?? ""
        let phoneNumber = txtFPhoneNumber.text ?? ""

   
        let params:[String:Any] = ["adId":adId,
                                   "description":description,
                                   "location":location,
                                   "lat":lat,
                                   "lng":lng,
                                   "mainPhoto":mainPhoto,
                                   "categoryId":categoryId,
                                   "kilometers":kilometers,
                                   "color":color,
                                   "doors":doors,
                                   "warranty":warranty,
                                   "transmission":transmission,
                                   "bodyType":bodyType,
                                   "fuelType":fuelType,
                                   "noOfCylinders":noOfCylinders,
                                   "steeringSide":steeringSide,
                                   "horsepower":horsepower,
                                   "price":price,
                                   "phoneNumber":phoneNumber
        ]
        debugPrint("\(TAG_ME) params:\(params)")
        // the first add is Done // please chack this aqurding to
        WebService.shared.AddInitialMotor(param: params) { response, error in
            self.view.hideLoading()
            guard let response = response, error == nil else {
                self.showFailureAlert(title: error?.localizedDescription)

                return
            }
            
            self.showSuccessAlert(title: "Done", completion: {
                let controller = Assembly.menuController
                self.present(controller, animated: true)
                
            })
            

        }
        
        func getValueFrmList(textFeild:UITextField,list:[GetAllMotorMakerModel])-> String{
            let tag =  textFeild.tag
            if tag >= 0 && tag < list.count {
                let arText = list[tag].arText ?? ""
                let enText = list[tag].enText ?? ""
                let text = enText  + "-" + arText
                return text
            }
            return ""
        }
        
        func getHorsePowerValie()-> String{
            let tag =  txtFHorsepower.tag
            if tag >= 0 && tag < listHorsepower.count {
                let arText = listHorsepower[tag].arText ?? ""
                let enText = listHorsepower[tag].enText ?? ""
                let text = enText  + "^" + arText

                return text
            }
            return ""
        }
        func getWarrentyValue()-> String{
       
                let text = warrntyTextFiled.text ?? ""
                if text.lowercased().contains("yes"){
                    return "true"
                }
                return "false"
      
        }
    }
    
}

extension Add_FullSpecesViewController {
    
    @IBAction func add_imagePressed(_ sender: Any) {
        
        if collectionImages.count < 10 {
            selectImage()
        }
        else{ showAlertDeprecated(controller: self, message: "You've added 10 photos.", seconds: 1)}
    }
    
    @IBAction func back_Pressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continue_Pressed(_ sender: Any) {
        requestApis()
       
    }
}


extension Add_FullSpecesViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        var list = [String]()
        switch textField {
            
        case spacsTextFiled: list = specsOptions.map{$0.enText ?? ""}
        case colorTextFiled: list = colorOptions.map{$0.enText ?? ""}
        case doorsTextFiled: list = doorsOptions.map{$0.enText ?? ""}
        case warrntyTextFiled: list = warrentyOptions.map{$0.enText ?? ""}
        case transmissionTextFiled: list = transmissionsOptions.map{$0.enText ?? ""}
        case bodyTypeTextField: list = bodyOptions.map{$0.enText ?? ""}
        case fuelTypeTextFiled: list = fuelOptions.map{$0.enText ?? ""}
        case numberOfCylindersTextField: list = cylindersOptions.map{$0.enText ?? ""}
            
        case txtFSteeringSide: list = listSteeringSide.map{$0.enText ?? ""}
        case txtFHorsepower: list = listHorsepower.map{$0.enText ?? ""}
        case txtFYourLocation: list = listYourLocation.map{$0.enText ?? ""}

        default: return true
        }
        
        if textFields.contains(where: {$0 == textField}) {
            
            selectedTextField = textField
            
            if textField == warrntyTextFiled{
                list = ["Yes","No"]
            }
            
            viewPopupListOfItems.setData(vc:self,list: list,hideOther: true)
        viewPopupListOfItems.onItmeClick = { (index, item) in
            self.selectedTextField?.text = item
            self.selectedTextField?.tag = index
        }
//
//
//            let vc = UIStoryboard.Main.popupSearchViewController
//            vc.delegate = self
//            vc.modalPresentationStyle = .overFullScreen
//            vc.modalTransitionStyle = .crossDissolve
//            vc.list = list
//            present(vc, animated: true)
            
            return false
        }
        return true
    }
}

extension Add_FullSpecesViewController: PopupSearchViewControllerDelegat {
    
    func selectedField(value: String) {
        
        selectedTextField?.text = value
    }
}

extension Add_FullSpecesViewController {
    
    func getDropdown(serviceName: EndPoint, completion: (() -> ())? = nil) {
        
        var completion = completion
        WebService.shared.getAllSpacesDropDowns(serviceName: serviceName, completion: { [weak self] response, error in
            guard let self = self else { return }
            if completion != nil {completion!(); completion = nil}
            
            guard let value = response, error == nil else {
                self.showFailureAlert(title: error?.localizedDescription)
                return
            }
            
            switch serviceName {
            case .GetAllColor: self.colorOptions = value
            case .GetAllBodyType: self.bodyOptions = value
            case .GetAllDoor: self.doorsOptions = value
            case .GetAllFuelType: self.fuelOptions = value
            case .GetAllMotorRegionalSpecs: self.specsOptions = value
            case .GetAllTransmission: self.transmissionsOptions = value
            case .GetAllNoOfCylinders: self.cylindersOptions = value
            case .GetSteeringSide: self.listSteeringSide = value
            case .GetHorsepower: self.listHorsepower = value
            case .GetYourLocation:self.listYourLocation = value
                
            default: return
            }
        })
    }
}
