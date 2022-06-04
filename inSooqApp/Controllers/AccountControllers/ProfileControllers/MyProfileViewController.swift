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
    @IBOutlet weak var industryView: UIView!

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
    @IBOutlet weak var updateButton: UIButton!
    
    @IBOutlet weak var uploadCVButton: UIButton!
    @IBOutlet weak var uploadIndustryButton: UIButton!

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
    
    
    var documentURL = ""
    var cvURL = ""
    
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
    
    private var _isNewsChecked:Bool=false
    private var _isAdsChecked:Bool=false
    private var _hideData:Bool=false
    
    var nationalitiesData = [ListItem]()
    var locationsData = [LocationModel]()
    var educationLevelsData = [ListItem]()
    var careerLevelsData = [ListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.renderAdsFlag()
        self.renderDataFlag()
        self.renderNewsFlag()
        
        let loc = Locale(identifier: "en")
        birthDate.locale = loc

        
        bottomBar.setVC(viewController: self)
        setGradientBackground(view: topBar, colorTop: #colorLiteral(red: 0.5490196078, green: 0.3882352941, blue: 0.9058823529, alpha: 1), colorBottom: #colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1))
        
//        hideDataCheck.setImage(#imageLiteral(resourceName: "checked_checkbox"), for: .normal)


        setTargets()
        setupbrandsDropDown()
        setupDropDownTregers()
        hideCustomViews(hide:true)
        

        let id = Shared.shared.getUserId() ?? 0

        self.requestDetails()

        ApiRequests.profileDetails(id: id) { [weak self] response in

            guard let self = self else { return }

            let firstName = response.value?.firstName ?? ""
            let lastName = response.value?.lastName ?? ""
            let email = response.value?.email ?? ""
            let gender = (response.value?.gender ?? "")
            let defaultLocation = (response.value?.defaultLocation ?? "")
            let defaultLanguage = (response.value?.defaultLanguage ?? "")
            let careerLevel = (response.value?.careerLevel ?? "")
            let education = (response.value?.education ?? "")
            let nationality = (response.value?.nationality ?? "")

            self.genderButton.setTitle(gender, for: .normal)
            self.locationButton.setTitle(defaultLocation, for: .normal)
            self.languageButton.setTitle(defaultLanguage, for: .normal)
            self.careerButton.setTitle(careerLevel, for: .normal)
            self.educationButton.setTitle(education, for: .normal)
            self.countryButton.setTitle(nationality, for: .normal)

            self.userName.text = "\(firstName) \(lastName)"
            let imageURL = response.value?.profilePicture ?? ""
            self.userImage.setImage(url: imageURL.fullImageUrl())
            self.firstNameTxt.text = firstName
            self.lastNameTxt.text = lastName
            self.emailTxt.text = email

            self.locationTxt.text = (response.value?.currentLocation ?? "")
            self.jobPositionTxt.text = (response.value?.currentPosition ?? "")
            self.companyTxt.text = (response.value?.currentCompany ?? "")
            self.coverNoteTxv.text = (response.value?.coverNote ?? "")

        }
        

    }
    
    func requestDetails() {

        ApiRequests.nationalities { response in
            self.nationalitiesData = response.value ?? []
            self.countryDropDown.dataSource = self.nationalitiesData.compactMap { $0.en_Text }
        }
        
        ApiRequests.locations { response in
            self.locationsData = response.value ?? []
            self.locationDropDown.dataSource = self.locationsData.compactMap { $0.en_Text }
        }

        ApiRequests.educationLevels { response in
            self.educationLevelsData = response.value ?? []
            self.educationDropDown.dataSource = self.educationLevelsData.compactMap { $0.en_Text }
        }

        ApiRequests.careerLevels { response in
            self.careerLevelsData = response.value ?? []
            self.careerDropDown.dataSource = self.careerLevelsData.compactMap { $0.en_Text }
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {

    }
    
    override func viewWillAppear(_ animated: Bool) {

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
        
        let alertViewController = UIAlertController(title: "Are you sure you want to logout?", message: "", preferredStyle: .alert)
        alertViewController.addAction(.init(title: "Yes", style: .destructive, handler: { action in
            Shared.shared.saveIsLogin(login: false)
            newRoot(NavId: "RegistrationNav")
        }))
        alertViewController.addAction(.init(title: "No", style: .default))
        
        self.present(alertViewController, animated: true)
        

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
    
        
    //    --form 'FirstName="voluptate tempor"' \
    //    --form 'LastName="sed aliqua laboris"' \
    //    --form 'Gender="veniam aute quis dolor"' \
    //    --form 'DOB="1994-04-20"' \
    //    --form 'Nationality="nisi ex aute adipisicing"' \
    //    --form 'DefaultLocation="fugiat quis enim"' \
    //    --form 'DefaultLanguage="amet"' \
    //    --form 'CareerLevel="Ut esse"' \
    //    --form 'Education="irure elit"' \
    //    --form 'CurrentLocation="sit exercitation"' \
    //    --form 'CurrentPosition="sint"' \
    //    --form 'CurrentCompany="et est Duis dolor"' \
    //    --form 'CVFile=@"/path/to/file"' \
    //    --form 'CoverNote="ipsum Lorem in"' \
    //    --form 'ProfilePictureFile=@"/path/to/file"' \
    //    --form 'IndustryFile=@"/path/to/file"' \
    //    --form 'HideInfromation="true"'
    
    
    @IBAction func update_Pressed(_ sender: Any) {
        
        let HideInfromation = (_hideData == true) ? ("true") : ("false")
        let offers = (_isAdsChecked == true) ? ("true") : ("false")
        let newsletter = (_isNewsChecked == true) ? ("true") : ("false")
        
        let params: [String : Any] = [
            "FirstName": "\(self.firstNameTxt.text ?? "")", //="voluptate tempor"' \
            "LastName": "\(self.lastNameTxt.text ?? "")", //="sed aliqua laboris"' \
            "Gender": "\(self.genderButton.titleLabel?.text ?? "")", //="veniam aute quis dolor"' \
            "DOB": self.birthDate.date.toYMDDateString(), //="1994-04-20"' \
            "Nationality": "\(self.countryButton.titleLabel?.text ?? "")", //="nisi ex aute adipisicing"' \
            "DefaultLocation": "\(self.locationButton.titleLabel?.text ?? "")", //="fugiat quis enim"' \
            "DefaultLanguage": "\(self.languageButton.titleLabel?.text ?? "")", //="amet"' \
            "CareerLevel": "\(self.careerButton.titleLabel?.text ?? "")", //="Ut esse"' \
            "Education": "\(self.educationButton.titleLabel?.text ?? "")", //="irure elit"' \
            "CurrentLocation": "\(self.locationTxt.text ?? "")", //="sit exercitation"' \
            "CurrentPosition": "\(self.jobPositionTxt.text ?? "")", //="sint"' \
            "CurrentCompany": "\(self.companyTxt.text ?? "")", //="et est Duis dolor"' \
            //"CVFile": "t", //=@"/path/to/file"' \
            "CoverNote": "\(self.coverNoteTxv.text ?? "")", //="ipsum Lorem in"' \
            //"ProfilePictureFile": "u", //=@"/path/to/file"' \
            //"IndustryFile": "i", //=@"/path/to/file"' \
            "HideInfromation": HideInfromation, //="true"'
            "offers": offers,
            "newsletter": newsletter
        ]
        
        let image = self.userImage.image
//        let data = Data()

        let cvData = try? Data(contentsOf: self.cvURL.asURL())
        let docData = try? Data(contentsOf: self.documentURL.asURL())
        
        ApiRequests.editProfile(CVFile: cvData, ProfilePictureFile: image, IndustryFile: docData, params: params) { response in
            print("R",response.value)
            self.showAlert(title: "Success", body: "")
        }
        
//        dismiss(animated: true) {
//            clearViewData(controller: self)
//        }
    }
    
    @IBAction func birthDate_Selected(_ sender: Any) {
        debugPrint(birthDate.date.toIsoDateString())
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
        coverNoteTxv.textColor = UIColor.black

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

        genderDropDown.dataSource = ["Male","Female"]
        languageDropDown.dataSource = ["Arabic","English"]
        
        locationDropDown.dataSource = []
        educationDropDown.dataSource = []
        careerDropDown.dataSource = []
        countryDropDown.dataSource = []

        // Action triggered on selection
        genderDropDown.selectionAction = { [weak self] (index, item) in
            print("DID_SELECT_GENDER")
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
        industryView.addShadowToView()
        
        customView.addShadowToView()
        customView.clipsToBounds=true
        objectCornerRadius(object: customView, cornerRadius: 10)
        
        objectCornerRadius(object: cvView, cornerRadius: 5)
        objectCornerRadius(object: industryView, cornerRadius: 5)
        
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
        let uploadFileGestureIndustry = UITapGestureRecognizer(target: self, action: #selector(selectFilesForIndustry))

        cvView.addGestureRecognizer(uploadFileGesture)
        industryView.addGestureRecognizer(uploadFileGestureIndustry)

        changePhoneButton.addTarget(self, action: #selector(showPhoneView), for: .touchUpInside)
        
        changePasswordButton.addTarget(self, action: #selector(showPasswordView), for: .touchUpInside)
        
        changeEmailButton.addTarget(self, action: #selector(showEmailView), for: .touchUpInside)
        
        showPasswordButton.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
       
        newsCheck.addTarget(self, action: #selector(checkNews), for: .touchUpInside)
        hideDataCheck.addTarget(self, action: #selector(hideData), for: .touchUpInside)
        adsCheck.addTarget(self, action: #selector(checkAds), for: .touchUpInside)

    }
    
    func renderNewsFlag() {
        if _isNewsChecked {
            newsCheck.setImage(#imageLiteral(resourceName: "checked_checkbox"), for: .normal)
        }else{
            newsCheck.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    @objc func checkNews() {
        _isNewsChecked.toggle()
        renderNewsFlag()
    }
    func renderAdsFlag() {
        if _isAdsChecked {
            adsCheck.setImage(#imageLiteral(resourceName: "checked_checkbox"), for: .normal)
        }else{
            adsCheck.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    @objc func checkAds() {
        _isAdsChecked.toggle()
        renderAdsFlag()
    }
    func renderDataFlag() {
        if _hideData {
            hideDataCheck.setImage(#imageLiteral(resourceName: "checked_checkbox"), for: .normal)
        }else{
            hideDataCheck.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    @objc func hideData() {
        _hideData.toggle()
        renderDataFlag()
    }
    
    //MARK:-Upload Fiels
    
    var documentSelectionType = ""
    
    @objc func selectFiles() {
        documentSelectionType = "cv"
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
    
    @objc func selectFilesForIndustry() {
        
     if #available(iOS 14.0, *) {
         
         documentSelectionType = "industry"
         
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
        
        if (documentSelectionType == "cv") {
            let cvName:String = myURL.lastPathComponent
            uploadCVButton.setTitle(cvName, for: .normal)
            self.cvURL = myURL.path
            print("import result : \(myURL)")
        } else {
            let industryName:String = myURL.lastPathComponent
            uploadIndustryButton.setTitle(industryName, for: .normal)
            self.documentURL = myURL.path
            print("import result : \(myURL)")
        }
        

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


