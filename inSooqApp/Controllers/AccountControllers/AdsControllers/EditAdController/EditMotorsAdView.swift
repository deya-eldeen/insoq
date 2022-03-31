//
//  EditMotorsAdView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 17/04/2021.
//

import UIKit
import DropDown
class EditMotorsAdView: UIView {
    @IBOutlet weak var changeMainImageButton: UIButton!
    
    @IBOutlet weak var doubleTapLabel: UILabel!
    @IBOutlet var shadowViews: [UIView]!
    @IBOutlet weak var uploadImagesMainViewHieght: NSLayoutConstraint!
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    var collectionImages = [UIImage]()
    @IBOutlet weak var selectedImageView: UIImageView!
    var picker:UIImagePickerController?=UIImagePickerController()
    var deletePath : Int!
    var primaryImage : UIImage!

    @IBOutlet weak var imagesCVHConstraint: NSLayoutConstraint!
    @IBOutlet weak var imagesCollectionView: UICollectionView!

    @IBOutlet weak var uploadImageButton: UIButton!
    
    @IBOutlet weak var itemTitleTxt: UITextField!
    @IBOutlet weak var itemMilageTxt: UITextField!
    @IBOutlet weak var itemPriceTxt: UITextField!
    @IBOutlet weak var itemTirmTxt: UITextField!
    
    @IBOutlet weak var itemHorsepowerButton: NiceButton!
    @IBOutlet weak var itemCarConditionButton: NiceButton!
    @IBOutlet weak var itemMechanicalConditionButton: NiceButton!
    @IBOutlet weak var itemTirmButton: NiceButton!
    @IBOutlet weak var itemLocationButton: NiceButton!
    @IBOutlet weak var itemCylinderButton: NiceButton!
    @IBOutlet weak var itemFuelType: NiceButton!
    @IBOutlet weak var itemBodyTypeButton: NiceButton!
    @IBOutlet weak var itemTransissionButton: NiceButton!
    @IBOutlet weak var itemWarrantyButton: NiceButton!
    @IBOutlet weak var itemDoorsButton: NiceButton!
    @IBOutlet weak var itemColorButton: NiceButton!
    @IBOutlet weak var itemSpecButton: NiceButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var ditictLocationButton: UIButton!
    
    @IBOutlet weak var cancelButton: UIButton!
    
     let speceDropDown = DropDown()
     let colorDropDown = DropDown()
     let doorsDropDown = DropDown()
     let warrantyDropDown = DropDown()
     let transmissionDropDown = DropDown()
     let bodyTypeDropDown = DropDown()
    let fuelDropDown = DropDown()
    let cylindersDropDown = DropDown()
    let locationDropDown = DropDown()
    let mechanicalConditionDropDown = DropDown()
    let carConditionDropDown = DropDown()
    let horsepowerDropDown = DropDown()
    let tirmDropDown = DropDown()
     lazy var dropDowns: [DropDown] = {
        return [
            self.speceDropDown,
            self.colorDropDown,
            self.doorsDropDown,
            self.warrantyDropDown,
            self.transmissionDropDown,
            self.bodyTypeDropDown,
            self.fuelDropDown,
            self.cylindersDropDown,
            self.locationDropDown,
            self.mechanicalConditionDropDown,
            self.carConditionDropDown,
            self.horsepowerDropDown,
            self.tirmDropDown
        ] }()

    @IBOutlet var contentView: UIView!
    var vc:UIViewController?
    
    func setVC(viewController:UIViewController)
    {
        self.vc = viewController
        if ((viewController.isKind(of: EditAdViewController.self)) )
        {
            if let vcMainControllor:EditAdViewController = vc as? EditAdViewController{
                setDropDownData()
                setDesign()
                addTargets()
                enableBtns(enable: true)
                setupbrandsDropDown()
                imagesCollectionView.delegate=self
                imagesCollectionView.dataSource=self
            //    calculateHeight()
                let imagesNib = UINib(nibName: "ItemImagesCollectionViewCell", bundle: nil)
                
                    imagesCollectionView.register(imagesNib, forCellWithReuseIdentifier: "ItemImagesCollectionViewCell")

            }
        }
        
    }
    private func addTargets(){
        submitButton.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        ditictLocationButton.addTarget(self, action: #selector(ditictLocationAction), for: .touchUpInside)

    }
    func enableBtns(enable:Bool)
    {
        self.ditictLocationButton.isEnabled=enable
        self.cancelButton.isEnabled=enable
        self.submitButton.isEnabled=enable
    }


    @objc func cancelAction(){
    guard let vc = self.vc else { return }

        vc.dismiss(animated: true, completion: nil)
    }
    
    @objc func ditictLocationAction(){
    guard let vc = self.vc else { return }
        showAlertDeprecated(controller: vc, message: "deticting location...", seconds: 1)

    }
    
    @objc func submitAction(){
        guard let vc = self.vc else {
            return
        }
        if ((vc.isKind(of: EditAdViewController.self))){
            if let vcMainControllor:EditAdViewController = vc as? EditAdViewController{
                showAlertDeprecated(controller: vc, message: "updating item...", seconds: 1)
            }
        }
        vc.dismiss(animated: true, completion: nil)
    }
    
    
    func xibSetup() {
        
        Bundle.main.loadNibNamed("EditMotorsAdView", owner: self, options: nil)
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

    //MARK:Private Methods
    private func setDesign(){
        for v in shadowViews{
            v.addShadowToView()
        }
    }
    private func setDropDownData(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        changeMainImageButton.addGestureRecognizer(tap)

        uploadImageButton.addTarget(self, action: #selector(uploadAction), for: .touchUpInside)
        itemSpecButton.addTarget(self, action: #selector(speceAction), for: .touchUpInside)
        itemColorButton.addTarget(self, action: #selector(colorsAction), for: .touchUpInside)
        itemDoorsButton.addTarget(self, action: #selector(doorsAction), for: .touchUpInside)
        itemWarrantyButton.addTarget(self, action: #selector(warrantyAction), for: .touchUpInside)
        itemTransissionButton.addTarget(self, action: #selector(transmissionAction), for: .touchUpInside)
        itemBodyTypeButton.addTarget(self, action: #selector(bodyTypeAction), for: .touchUpInside)
        itemFuelType.addTarget(self, action: #selector(fuelAction), for: .touchUpInside)
        itemCylinderButton.addTarget(self, action: #selector(cylindersAction), for: .touchUpInside)
        itemLocationButton.addTarget(self, action: #selector(locationAction), for: .touchUpInside)
        itemMechanicalConditionButton.addTarget(self, action: #selector(mechanicalConditionAction), for: .touchUpInside)
        itemCarConditionButton.addTarget(self, action: #selector(carConditionAction), for: .touchUpInside)
        itemHorsepowerButton.addTarget(self, action: #selector(horsepowerAction), for: .touchUpInside)
        itemTirmButton.addTarget(self, action: #selector(tirmAction), for: .touchUpInside)

    }
    
    @objc func doubleTapped() {
            debugPrint("######## CHANGE MAIN IMAGE #####",mainImageView.image)
        mainImageView.image=selectedImageView.image
        debugPrint("######## CHANGED MAIN IMAGE #####",mainImageView.image)

    }

    @objc func uploadAction(){
        if collectionImages.count<10{
        selectImage()
        }
        else{
            guard let vc = self.vc else{ return }

            showAlertDeprecated(controller: vc, message: "You added 10 pictures.", seconds: 1)
        }
       // calculateHeight()

    }
    @objc func speceAction (){
        speceDropDown.show()
    }

    @objc func colorsAction (){
        colorDropDown.show()
    }

    @objc func doorsAction (){
        doorsDropDown.show()
    }

    @objc func warrantyAction (){
        warrantyDropDown.show()
    }

    @objc func transmissionAction (){
        transmissionDropDown.show()
    }

    @objc func bodyTypeAction (){
        bodyTypeDropDown.show()
    }

    @objc func fuelAction (){
        fuelDropDown.show()
    }

    @objc func cylindersAction (){
        cylindersDropDown.show()
    }

    @objc func locationAction (){
        locationDropDown.show()
    }
    
    @objc func mechanicalConditionAction (){
        mechanicalConditionDropDown.show()
    }

    @objc func carConditionAction (){
        carConditionDropDown.show()
    }

    @objc func horsepowerAction (){
        horsepowerDropDown.show()
    }
    @objc func tirmAction (){
        tirmDropDown.show()
    }

    private func setupbrandsDropDown() {
        ///Draw Down down list...
        speceDropDown.anchorView = itemSpecButton
        colorDropDown.anchorView = itemColorButton
        doorsDropDown.anchorView = itemDoorsButton
        warrantyDropDown.anchorView = itemWarrantyButton
        transmissionDropDown.anchorView = itemTransissionButton
        bodyTypeDropDown.anchorView = itemBodyTypeButton
        fuelDropDown.anchorView = itemFuelType
        cylindersDropDown.anchorView = itemCylinderButton
        locationDropDown.anchorView = itemLocationButton
        mechanicalConditionDropDown.anchorView = itemMechanicalConditionButton
        carConditionDropDown.anchorView = itemCarConditionButton
        horsepowerDropDown.anchorView = itemHorsepowerButton
        tirmDropDown.anchorView = itemTirmButton

        //if you want the list to cover the screen set it yearsDropDown.anchorView=((((((yearsDropDown))))))

        speceDropDown.bottomOffset = CGPoint(x: 0, y: itemSpecButton.bounds.height)
      
        colorDropDown.bottomOffset = CGPoint(x: 0, y: itemColorButton.bounds.height)
      
        warrantyDropDown.bottomOffset = CGPoint(x: 0, y: itemWarrantyButton.bounds.height)
        
        doorsDropDown.bottomOffset = CGPoint(x: 0, y: itemDoorsButton.bounds.height)
        
        transmissionDropDown.bottomOffset = CGPoint(x: 0, y: itemTransissionButton.bounds.height)
       
        bodyTypeDropDown.bottomOffset = CGPoint(x: 0, y: itemBodyTypeButton.bounds.height)
     
        fuelDropDown.bottomOffset = CGPoint(x: 0, y: itemFuelType.bounds.height)
        
        cylindersDropDown.bottomOffset = CGPoint(x: 0, y: itemCylinderButton.bounds.height)
        
        locationDropDown.bottomOffset = CGPoint(x: 0, y: itemLocationButton.bounds.height)
      
        mechanicalConditionDropDown.bottomOffset = CGPoint(x: 0, y: itemMechanicalConditionButton.bounds.height)
      
        carConditionDropDown.bottomOffset = CGPoint(x: 0, y: itemCarConditionButton.bounds.height)
       
        horsepowerDropDown.bottomOffset = CGPoint(x: 0, y: itemHorsepowerButton.bounds.height)
    
        tirmDropDown.bottomOffset = CGPoint(x: 0, y: itemTirmButton.bounds.height)

        speceDropDown.dataSource = [
            "Option 1",
            "Option 2",
            "Option 3",
            "Option 4",
        ]
        colorDropDown.dataSource = [
            "Black",
            "Green",
            "Blue",
            "Red"
        ]
        doorsDropDown.dataSource = [
            "2",
            "3",
            "4",
            "5",
            "6"
        ]
        warrantyDropDown.dataSource = [
            "Yes",
            "No"
        ]
        bodyTypeDropDown.dataSource = [
            "Sedan",
            "Geep",
            "Pick-up",
            "Sport"
        ]
        transmissionDropDown.dataSource = [
            "Manual",
            "Automatic"
        ]
        fuelDropDown.dataSource = [
            "Diesel",
            "Gasoline"
        ]
        cylindersDropDown.dataSource = [
            "2 Cylinder",
            "4 Cylinders",
            "6 Cylinders",
            "8 Cylinders"
        ]
        locationDropDown.dataSource = [
            "All UAE",
            "Abu Dhabi",
            "Al Ain",
            "Ajman",
            "Dubai",
            "Fujairah",
            "Ras Al Khaimah"
            ]
        
        mechanicalConditionDropDown.dataSource = [
            "Option 1",
            "Option 2",
            "Option 3",
            "Option 4",
        ]

        carConditionDropDown.dataSource = [
            "Option 1",
            "Option 2",
            "Option 3",
            "Option 4",
        ]

        horsepowerDropDown.dataSource = [
            "Option 1",
            "Option 2",
            "Option 3",
            "Option 4",
        ]
        
        tirmDropDown.dataSource = [
            "Option 1",
            "Option 2",
            "Option 3",
            "Option 4",
        ]


        // Action triggered on selection
        speceDropDown.selectionAction = { [weak self] (index, item) in
            self?.itemSpecButton.setTitle(" \(item)", for: .normal)
        }
        colorDropDown.selectionAction = { [weak self] (index, item) in
            self?.itemColorButton.setTitle(" \(item)", for: .normal)
        }
        doorsDropDown.selectionAction = { [weak self] (index, item) in
            self?.itemDoorsButton.setTitle(" \(item)", for: .normal)
        }
        warrantyDropDown.selectionAction = { [weak self] (index, item) in
            self?.itemWarrantyButton.setTitle(" \(item)", for: .normal)
        }
        transmissionDropDown.selectionAction = { [weak self] (index, item) in
            self?.itemTransissionButton.setTitle(" \(item)", for: .normal)
        }
        bodyTypeDropDown.selectionAction = { [weak self] (index, item) in
            self?.itemBodyTypeButton.setTitle(" \(item)", for: .normal)
        }
        fuelDropDown.selectionAction = { [weak self] (index, item) in
            self?.itemFuelType.setTitle(" \(item)", for: .normal)
        }
        cylindersDropDown.selectionAction = { [weak self] (index, item) in
            self?.itemCylinderButton.setTitle(" \(item)", for: .normal)
        }
        locationDropDown.selectionAction = { [weak self] (index, item) in
            self?.itemLocationButton.setTitle(" \(item)", for: .normal)
        }
        mechanicalConditionDropDown.selectionAction = { [weak self] (index, item) in
            self?.itemMechanicalConditionButton.setTitle(" \(item)", for: .normal)
        }
        carConditionDropDown.selectionAction = { [weak self] (index, item) in
            self?.itemCarConditionButton.setTitle(" \(item)", for: .normal)
        }
        horsepowerDropDown.selectionAction = { [weak self] (index, item) in
            self?.itemHorsepowerButton.setTitle(" \(item)", for: .normal)
        }
        tirmDropDown.selectionAction = { [weak self] (index, item) in
            self?.itemTirmButton.setTitle(" \(item)", for: .normal)
        }
    }


}
extension EditMotorsAdView:
    UIImagePickerControllerDelegate, UIPopoverControllerDelegate,UINavigationControllerDelegate
{
    func presentCamera() {
        guard let viewController = self.vc else{ return}
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        vc.modalPresentationStyle = .formSheet
        vc.modalTransitionStyle = .crossDissolve

        viewController.present(vc, animated: true)
    }
    func Gallary()
    {
        guard let viewController = self.vc else{ return}

        let vc = UIImagePickerController()
        vc.sourceType = .savedPhotosAlbum
        vc.delegate = self
        vc.allowsEditing = true
//        vc.mediaTypes
        viewController.present(vc, animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {   picker.popViewController(animated: true)
        picker.dismiss(animated: true, completion: nil) }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let viewController = self.vc else{ return}

        guard let chosenImage = info[.originalImage] as? UIImage else { return}
       // calculateHeight()
        selectedImageView.image=chosenImage
        debugPrint("chosenImage",chosenImage)
        collectionImages.append(chosenImage)
        
      //  imagesCollectionView.reloadData()
        viewController.dismiss(animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.refresher()

        }
            
        
    }
    func calculateHeight(){
        if collectionImages.isEmpty{
            imagesCVHConstraint.constant=0
            uploadImagesMainViewHieght.constant=200
        }
        else if collectionImages.count==1 || collectionImages.count<5
        {
            imagesCVHConstraint.constant=200
            doubleTapLabel.isHidden=false
            uploadImagesMainViewHieght.constant=600

        }
        contentView.reloadInputViews()
        contentView.updateConstraints()
        contentView.layoutIfNeeded()
    }
    func refresher(){
        imagesCollectionView.reloadData()
        let i = IndexPath(row: collectionImages.count-1, section: 0)
            self.imagesCollectionView.scrollToItem(at: i, at: .centeredHorizontally, animated: true)
        self.imagesCollectionView.setNeedsLayout()
    }
    
    
    @objc func deleteImage(sender:UIButton)
    {   debugPrint("deleteing Image")
        self.collectionImages.remove(at: sender.tag)
        imagesCollectionView.reloadData()
    }
    @objc func selectImage()
    {
        guard let viewController = self.vc else{ return}

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
        
        viewController.present(actionSheet , animated: true, completion:  nil)
        
    }

}
extension EditMotorsAdView : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return collectionImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "ItemImagesCollectionViewCell", for: indexPath) as! ItemImagesCollectionViewCell
        objectCornerRadiusShadow(with: cell.itemImage)

        cell.deleteButton.tag=indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(self.deleteImage(sender:)), for: .touchDown)
            cell.setImagesData(data: collectionImages[indexPath.row])
            
            return cell
        }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          let imagecell = self.imagesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
            imagecell.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
            imagecell.minimumInteritemSpacing = 0
            imagecell.itemSize = CGSize(width:( Int(self.imagesCollectionView.frame.size.width)/5), height: Int(imagesCollectionView.frame.height)/3)
            imagesCollectionView.reloadData()
            return imagecell.itemSize
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index=indexPath.row
        selectedImageView.image=self.collectionImages[index]
    }
}

