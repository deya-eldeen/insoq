//
//  MyProfileViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 05/04/2021.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers
import DropDown
class MyProfileViewController: UIViewController, UIDocumentMenuDelegate {
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var bottomBar: BottomBar!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var customViewHConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var phoneTxt: UITextField!
    @IBOutlet weak var showPasswordButton: UIButton!
    
    @IBOutlet weak var changePhoneButton: UIButton!
    @IBOutlet weak var changeEmailButton: UIButton!
    @IBOutlet weak var changePasswordButton: UIButton!
    
    @IBOutlet weak var cvView: UIView!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var backGroundView: UIView!
    
    @IBOutlet weak var genderButton: NiceButton!
    @IBOutlet weak var locationButton: NiceButton!
    @IBOutlet weak var countryButton: NiceButton!
    @IBOutlet weak var educationButton: NiceButton!
    @IBOutlet weak var careerButton: NiceButton!
    @IBOutlet weak var languageButton: NiceButton!
    
    @IBOutlet weak var birthDate: UIDatePicker!
    @IBOutlet weak var companyTxt: UITextField!
    @IBOutlet weak var jobPositionTxt: UITextField!
    @IBOutlet weak var locationTxt: UITextField!
    @IBOutlet weak var industryTxt: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    
    @IBOutlet weak var uploadCVButton: UIButton!
    @IBOutlet weak var coverNoteTxv: UITextView!
    
    @IBOutlet weak var hideDataCheck: UIButton!
    @IBOutlet weak var adsCheck: UIButton!
    @IBOutlet weak var newsCheck: UIButton!
    
    @IBOutlet var viewsToDesign: [UIView]!
    /**
     @IBOutlet weak var genderButton: NiceButton!
     @IBOutlet weak var locationButton: NiceButton!
     @IBOutlet weak var countryButton: NiceButton!
     @IBOutlet weak var educationButton: NiceButton!
     @IBOutlet weak var careerButton: NiceButton!
     @IBOutlet weak var languageButton: NiceButton!

     */
    let genderDropDown = DropDown()
    let locationDropDown = DropDown()
    let countryDropDown = DropDown()
    let educationDropDown = DropDown()
    let careerDropDown = DropDown()
    let languageDropDown = DropDown()
    lazy var dropDowns: [DropDown] = {
        return [
            self.genderDropDown,
            self.locationDropDown,
            self.educationDropDown,
            self.countryDropDown,
            self.careerDropDown,
            self.languageDropDown
        ]
    }()
    //MARK:-VC Life cicle-
    static var _NewPhone:String=""
    private var _isNewsChecked:Bool=true
    private var _isAdsChecked:Bool=true
    private var _hideData:Bool=false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomBar.setVC(viewController: self)
        setGradientBackground(view: topBar, colorTop: #colorLiteral(red: 0.5490196078, green: 0.3882352941, blue: 0.9058823529, alpha: 1), colorBottom: #colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1))
    }
    override func viewWillAppear(_ animated: Bool) {
        setTargets()
        setupbrandsDropDown()
        setupDropDownTregers()
        hideCustomViews(hide:true)
    }
    override func viewDidLayoutSubviews() {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        setDesign()
        CATransaction.commit()
    }
    @IBAction func back_Pressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logout_Pressed(_ sender: Any) {
        newRoot(NavId: "RegistrationNav")
    }
    //MARK:-override touches-
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if self.isKind(of: MyProfileViewController.self){
            let touch = touches.first
            if touch?.view == backGroundView {
                debugPrint("touchesBegan,subCategoriesTableView")
                hideCustomViews(hide: true)
                view.endEditing(true)
            }
        }
    }

    
    @IBAction func uploadImage_Pressed(_ sender: Any) {
        presentPhotoActionSheet()

    }
    
    @IBAction func update_Pressed(_ sender: Any) {
        dismiss(animated: true) {
            clearViewData(controller: self)
        }
    }
    
    @IBAction func birthDate_Selected(_ sender: Any) {
        debugPrint(birthDate.date)
    }
    //MARK:-Private Methods-
    private func setupDropDownTregers(){
        /**
         self.genderDropDown,
         self.locationDropDown,
         self.educationDropDown,
         self.careerDropDown,
         self.languageDropDown
*/
        ///Draw Down down list...
        coverNoteTxv.delegate=self
        coverNoteTxv.text = "Tell us more...".localized
        coverNoteTxv.textColor = UIColor.lightGray

        genderButton.addTarget(self, action: #selector(genderAction), for: .touchUpInside)
        locationButton.addTarget(self, action: #selector(locationAction), for: .touchUpInside)
        educationButton.addTarget(self, action: #selector(educationAction), for: .touchUpInside)
        careerButton.addTarget(self, action: #selector(careerAction), for: .touchUpInside)
        languageButton.addTarget(self, action: #selector(languageAction), for: .touchUpInside)
        countryButton.addTarget(self, action: #selector(countryAction), for: .touchUpInside)

    }
    @objc func genderAction (){
        genderDropDown.show()
    }
    @objc func locationAction (){
        locationDropDown.show()
    }
    @objc func educationAction (){
        educationDropDown.show()
    }

    @objc func careerAction (){
        careerDropDown.show()
    }
    @objc func languageAction (){
        languageDropDown.show()
    }
    @objc func countryAction (){
        countryDropDown.show()
    }
    
    private func setupbrandsDropDown() {
        ///Draw Down down list...
        
        genderDropDown.anchorView = genderButton
        locationDropDown.anchorView = locationButton
        educationDropDown.anchorView = educationButton
        careerDropDown.anchorView = careerButton
        languageDropDown.anchorView = languageButton
        countryDropDown.anchorView = countryButton
        //if you want the list to cover the screen set it yearsDropDown.anchorView=((((((yearsDropDown))))))

        genderDropDown.bottomOffset = CGPoint(x: 0, y: genderButton.bounds.height)
        locationDropDown.bottomOffset = CGPoint(x: 0, y: locationButton.bounds.height)
        educationDropDown.bottomOffset = CGPoint(x: 0, y: educationButton.bounds.height)
        careerDropDown.bottomOffset = CGPoint(x: 0, y: careerButton.bounds.height)
        languageDropDown.bottomOffset = CGPoint(x: 0, y: languageButton.bounds.height)
        countryDropDown.bottomOffset = CGPoint(x: 0, y: countryButton.bounds.height)

        genderDropDown.dataSource = [
            "Male","Female","Other"
        ]
        
        locationDropDown.dataSource=[
            "All UAE",
            "Abu Dhabi",
            "Al Ain",
            "Ajman",
            "Dubai",
            "Fujairah",
            "Ras Al Khaimah"
            ]
        educationDropDown.dataSource = [
            "i.e 1","i.e 2","i.e 3"
        ]
        careerDropDown.dataSource = [
            "i.e 1","i.e 2","i.e 3"
        ]
        languageDropDown.dataSource = [
            "Arabic","English"
        ]
        countryDropDown.dataSource = [
            "Jordan", "China", "UK","UAE", "USA"
        ]

        
        // Action triggered on selection
        genderDropDown.selectionAction = { [weak self] (index, item) in
            self?.genderButton.setTitle(" \(item)", for: .normal)
        }
        // Action triggered on selection
        locationDropDown.selectionAction = { [weak self] (index, item) in
            self?.locationButton.setTitle(" \(item)", for: .normal)
        }
        // Action triggered on selection
        educationDropDown.selectionAction = { [weak self] (index, item) in
            self?.educationButton.setTitle(" \(item)", for: .normal)
        }
        // Action triggered on selection
        careerDropDown.selectionAction = { [weak self] (index, item) in
            self?.careerButton.setTitle(" \(item)", for: .normal)
        }
        // Action triggered on selection
        languageDropDown.selectionAction = { [weak self] (index, item) in
            self?.languageButton.setTitle(" \(item)", for: .normal)
        }
        // Action triggered on selection
        countryDropDown.selectionAction = { [weak self] (index, item) in
            self?.countryButton.setTitle(" \(item)", for: .normal)
        }
    }
    private func hideCustomViews(hide:Bool){
        backGroundView.isHidden=hide
        customView.isHidden=hide
    }
    @objc func hidepopups(){
        backGroundView.isHidden=true
        customView.isHidden=true
    }

    private func setDesign(){
        view.layoutIfNeeded()

        objectCornerRadius(object: userImage, cornerRadius: userImage.width/2)
        
        objectCornerRadius(object: changePhoneButton, cornerRadius: changePhoneButton.height/2)
        objectCornerRadius(object: changeEmailButton, cornerRadius: changeEmailButton.height/2)
        objectCornerRadius(object: changePasswordButton, cornerRadius: changePasswordButton.height/2)
        objectCornerRadius(object: updateButton, cornerRadius: updateButton.height/2)
        
        emailTxt.isUserInteractionEnabled=false
        passwordTxt.isUserInteractionEnabled=false
        phoneTxt.isUserInteractionEnabled=false
        cvView.addShadowToView()
        customView.addShadowToView()
        customView.clipsToBounds=true
        objectCornerRadius(object: customView, cornerRadius: 10)
        
        objectCornerRadius(object: cvView, cornerRadius: 5)
        for v in viewsToDesign{
            bottomBorder(object: v)
        }
        view.setNeedsLayout()
    }
    private func setTargets(){
     //MARK:- Need icloud Container...Read more about it.
       /// let uploadFileGesture = UITapGestureRecognizer(target: self, action: #selector(uploadFileAction))
///https://stackoverflow.com/questions/29300772/my-app-is-getting-crashed-on-uidocumentpickerviewcontroller
        
       let uploadFileGesture = UITapGestureRecognizer(target: self, action: #selector(selectFiles))
        cvView.addGestureRecognizer(uploadFileGesture)

        changePhoneButton.addTarget(self, action: #selector(showPhoneView), for: .touchUpInside)
        
        changePasswordButton.addTarget(self, action: #selector(showPasswordView), for: .touchUpInside)
        
        changeEmailButton.addTarget(self, action: #selector(showEmailView), for: .touchUpInside)
        
        showPasswordButton.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
       
        newsCheck.addTarget(self, action: #selector(checkNews), for: .touchUpInside)
        hideDataCheck.addTarget(self, action: #selector(hideData), for: .touchUpInside)
        adsCheck.addTarget(self, action: #selector(checkAds), for: .touchUpInside)

    }
    @objc func checkNews(){
        if _isNewsChecked {
            newsCheck.setImage(#imageLiteral(resourceName: "checked_checkbox"), for: .normal)
        }else{
            newsCheck.setImage(UIImage(systemName: "square"), for: .normal)
        }
        _isNewsChecked = !_isNewsChecked
    }
    @objc func checkAds(){
        if _isAdsChecked {
            adsCheck.setImage(#imageLiteral(resourceName: "checked_checkbox"), for: .normal)
        }else{
            adsCheck.setImage(UIImage(systemName: "square"), for: .normal)
        }
        _isAdsChecked = !_isAdsChecked
    }
    @objc func hideData(){
        if _hideData {
            hideDataCheck.setImage(#imageLiteral(resourceName: "checked_checkbox"), for: .normal)
        }else{
            hideDataCheck.setImage(UIImage(systemName: "square"), for: .normal)
        }
        _hideData = !_hideData
    }
    //MARK:-Upload Fiels
    
    @objc func selectFiles() {
     if #available(iOS 14.0, *) {
         
         let documentPickerController = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF), String(kUTTypeImage), String(kUTTypeMovie), String(kUTTypeVideo), String(kUTTypePlainText), String(kUTTypeText)], in: .import)
         documentPickerController.delegate = self
         present(documentPickerController, animated: true, completion: nil)

 //        let typess = UTType.types(tag: "json",
 //                                  tagClass: UTTagClass.filenameExtension,
 //                                  conformingTo: nil)
        // let documentPickerController = UIDocumentPickerViewController(             forOpeningContentTypes: typess)
         
         //documentPickerController.delegate = self
        /// self.present(documentPickerController, animated: true, completion: nil)
         
     } else {
         // Fallback on earlier versions
         debugPrint(" selectFiles not available ")
     }
     }
    
    @objc func uploadFileAction(){
    let importMenu = UIDocumentMenuViewController(documentTypes: [String(kUTTypePDF),String(kUTTypePNG)  ,String(kUTTypeJPEG)], in: .import)
        importMenu.delegate = self
        importMenu.modalPresentationStyle = .formSheet
        
        self.present(importMenu, animated: true, completion: nil)
    }

    @objc func showPhoneView(){
        showPopupView(index: 3)
    }
    
    @objc func showPasswordView(){
        showPopupView(index: 2)
        
    }
    
    @objc func showEmailView(){
        showPopupView(index: 1)
    }
    
    @objc func showPassword(){
        passwordTxt.isSecureTextEntry = !passwordTxt.isSecureTextEntry
        debugPrint("passwordTxt.isSecureTextEntry",passwordTxt.isSecureTextEntry)
        if passwordTxt.isSecureTextEntry{
            showPasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }else {
            showPasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
        }
    }
    private func showPopupView(index:Int){
        hideCustomViews(hide: false)
        for sv in customView.subviews{
            debugPrint("Removing...",sv)
            sv.removeFromSuperview()
        }
        switch index {
        case 1://changeEmail
            debugPrint("Setting propertyDetailsView")
            let changeEmail: ChangeEmailView = {
                let view = ChangeEmailView()
                view.backgroundColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            customViewHConstraint.constant=250
            customView.addSubview(changeEmail)
            changeEmail.setVC(viewController: self)
            changeEmail.verifyButton.addTarget(self, action: #selector(showChangeEmail_PhoneView), for: .touchUpInside)
            changeEmail.widthAnchor.constraint(equalTo: customView.widthAnchor, multiplier: 1).isActive=true
            changeEmail.heightAnchor.constraint(equalTo: customView.heightAnchor, multiplier: 1).isActive=true
            changeEmail.centerXAnchor.constraint(equalTo: customView.centerXAnchor).isActive=true
            changeEmail.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive=true
            break
        case 2:// ChangePassword
            debugPrint("Setting ChangePasswordView")
            let changePasswordView: ChangePasswordView = {
                let view = ChangePasswordView()
                view.backgroundColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            customViewHConstraint.constant=400
            customView.addSubview(changePasswordView)
            changePasswordView.setVC(viewController: self)
            changePasswordView.changePassButton.addTarget(self, action: #selector(hidepopups), for: .touchUpInside)
            changePasswordView.widthAnchor.constraint(equalTo: customView.widthAnchor, multiplier: 1).isActive=true
            changePasswordView.heightAnchor.constraint(equalTo: customView.heightAnchor, multiplier: 1).isActive=true
            changePasswordView.centerXAnchor.constraint(equalTo: customView.centerXAnchor).isActive=true
            changePasswordView.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive=true
            
            
            break
        case 3: //changenumber
            customViewHConstraint.constant=290
            debugPrint("Setting propertyDetailsView")
            let changeNumberView: ChangePhoneView = {
                let view = ChangePhoneView()
                view.backgroundColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            
            customView.addSubview(changeNumberView)
            changeNumberView.setVC(viewController: self)
            changeNumberView.changePhoneButton.addTarget(self, action: #selector(showOTPView), for: .touchUpInside)
            changeNumberView.widthAnchor.constraint(equalTo: customView.widthAnchor, multiplier: 1).isActive=true
            changeNumberView.heightAnchor.constraint(equalTo: customView.heightAnchor, multiplier: 1).isActive=true
            changeNumberView.centerXAnchor.constraint(equalTo: customView.centerXAnchor).isActive=true
            changeNumberView.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive=true
            
            break
        case 4://note View ->after change email show note view
            debugPrint("Setting propertyDetailsView")
            let noteView: ChangeEmail_PhoneView = {
                let view = ChangeEmail_PhoneView()
                view.backgroundColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            customView.addSubview(noteView)
            customViewHConstraint.constant=330
            noteView.sendCodeButton.addTarget(self, action: #selector(showOTPView), for: .touchUpInside)
            noteView.widthAnchor.constraint(equalTo: customView.widthAnchor, multiplier: 1).isActive=true
            noteView.heightAnchor.constraint(equalTo: customView.heightAnchor, multiplier: 1).isActive=true
            noteView.centerXAnchor.constraint(equalTo: customView.centerXAnchor).isActive=true
            noteView.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive=true
            
            break
        case 5://Auth Code
            debugPrint("Setting FIRAuthCodeView")
            let oTPView: FIRAuthCodeView = {
                let view = FIRAuthCodeView()
                view.backgroundColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            
            customViewHConstraint.constant=300
            customView.addSubview(oTPView)
            
            oTPView.setVC(viewController: self)
            oTPView.verifyButton.addTarget(self, action: #selector(hidepopups), for: .touchUpInside)
            oTPView.widthAnchor.constraint(equalTo: customView.widthAnchor, multiplier: 1).isActive=true
            oTPView.heightAnchor.constraint(equalTo: customView.heightAnchor, multiplier: 1).isActive=true
            oTPView.centerXAnchor.constraint(equalTo: customView.centerXAnchor).isActive=true
            oTPView.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive=true
            break
        default:
            debugPrint("non of choises")
        }
    }

    @objc func showOTPView(){
        //FitchPhone using a static variable
        debugPrint("IN Myprofile", MyProfileViewController._NewPhone)
        
        debugPrint("Myprofile",PhoneCheck(phone: MyProfileViewController._NewPhone))
      //  if PhoneCheck(phone: MyProfileViewController._NewPhone)
      //  {
            showPopupView(index: 5)
            
       // }else{
           // showActionAlert(with: self, title: "Warning", body: "Please Enter A Valid Phone", actionTitle: "Ok")
       // }
    }
    @objc func showChangeEmail_PhoneView(){
        showPopupView(index: 4)
    }
    
}


extension MyProfileViewController: UIDocumentPickerDelegate,UINavigationControllerDelegate {
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let myURL = urls.first else {
            return
        }
        let cvName:String = myURL.lastPathComponent
        uploadCVButton.setTitle(cvName, for: .normal)
        print("import result : \(myURL)")
    }
          

    public func documentMenu(_ documentMenu:UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }


    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
        dismiss(animated: true, completion: nil)
    }
    
}

    extension MyProfileViewController: UIImagePickerControllerDelegate{

    func presentPhotoActionSheet() {
        let actionSheet = UIAlertController(title: "Profile Picture".localized,
                                            message: "How would you like to select a picture?".localized,
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel".localized,
                                            style: .cancel,
                                            handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take Photo".localized,
                                            style: .default,
                                            handler: { [weak self] _ in
                                                
                                                self?.presentCamera()
                                                
                                            }))
        actionSheet.addAction(UIAlertAction(title: "Chose Photo".localized,
                                            style: .default,
                                            handler: { [weak self] _ in
                                                
                                                self?.presentPhotoPicker()
                                                
                                            }))
        
        present(actionSheet, animated: true)
    }
    
    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        
        self.userImage.image = selectedImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
extension MyProfileViewController: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Tell us more...".localized
            textView.textColor = UIColor.lightGray
        }
    }
}
