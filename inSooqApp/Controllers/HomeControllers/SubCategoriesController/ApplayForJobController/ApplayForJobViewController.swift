//
//  ApplayForJobViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 20/04/2021.
//

import UIKit
import DropDown
import MobileCoreServices
import UniformTypeIdentifiers

class ApplayForJobViewController: UIViewController, UIDocumentMenuDelegate {
    @IBOutlet weak var bottomView: BottomBar!
    
    
    @IBOutlet weak var phoneTxt: UITextField!
    
    
    @IBOutlet weak var cvView: UIView!
    
    @IBOutlet weak var genderButton: NiceButton!
    @IBOutlet weak var locationButton: NiceButton!
    @IBOutlet weak var nationalityButton: NiceButton!
    @IBOutlet weak var workExpButton: NiceButton!
    @IBOutlet weak var  commitmentButton: NiceButton!
    @IBOutlet weak var noticeButton: NiceButton!
    @IBOutlet weak var visaStutsButton: NiceButton!
    
    @IBOutlet weak var educationButton: NiceButton!
    @IBOutlet weak var careerButton: NiceButton!
    
    @IBOutlet weak var birthDate: UIDatePicker!
    @IBOutlet weak var companyTxt: UITextField!
    @IBOutlet weak var jobPositionTxt: UITextField!
    
    @IBOutlet weak var uploadCVButton: UIButton!
    @IBOutlet weak var coverNoteTxv: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    
    
    let locationDropDown = DropDown()
    let genderDropDown = DropDown()
    let nationalityDropDown = DropDown()
    let educationDropDown = DropDown()
    let worckExperianceDropDown = DropDown()
    let commitmentDropDown = DropDown()
    let noticeDropDown = DropDown()
    let careerDropDown = DropDown()
    let visaDropDown = DropDown()
    
    lazy var dropDowns: [DropDown] = {
        return [
            self.genderDropDown,
            self.locationDropDown,
            self.educationDropDown,
            self.worckExperianceDropDown,
            self.careerDropDown,
            self.nationalityDropDown,
            self.visaDropDown,
            self.noticeDropDown,
            self.commitmentDropDown
        ]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomView.setVC(viewController: self)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        setDesign()
        setupDropDownTregers()
        setupbrandsDropDown()
    }
    
    
    @IBAction func back_Pressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    //MARK:-Private Methods-
    
    private func setDesign(){
        view.layoutIfNeeded()
        
        cvView.addShadowToView()
        objectCornerRadius(object: cvView, cornerRadius: 5)
        cvView.addShadowToView()
        view.setNeedsLayout()
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
        
        let uploadFileGesture = UITapGestureRecognizer(target: self, action: #selector(selectFiles))
        cvView.addGestureRecognizer(uploadFileGesture)
        
        genderButton.addTarget(self, action: #selector(genderAction), for: .touchUpInside)
        locationButton.addTarget(self, action: #selector(locationAction), for: .touchUpInside)
        educationButton.addTarget(self, action: #selector(educationAction), for: .touchUpInside)
        careerButton.addTarget(self, action: #selector(careerAction), for: .touchUpInside)
        
        nationalityButton.addTarget(self, action: #selector(nationalityAction), for: .touchUpInside)
        workExpButton.addTarget(self, action: #selector(workExpAction), for: .touchUpInside)
        commitmentButton.addTarget(self, action: #selector(commitmentAction), for: .touchUpInside)
        noticeButton.addTarget(self, action: #selector(noticeAction), for: .touchUpInside)
        visaStutsButton.addTarget(self, action: #selector(visaAction), for: .touchUpInside)
        
        
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
    
    @objc func nationalityAction (){
        nationalityDropDown.show()
    }
    
    @objc func workExpAction (){
        worckExperianceDropDown.show()
    }
    
    @objc func commitmentAction (){
        commitmentDropDown.show()
    }
    
    @objc func noticeAction (){
        noticeDropDown.show()
    }
    
    @objc func visaAction (){
        visaDropDown.show()
    }
    
    
    private func setupbrandsDropDown() {
        ///Draw Down down list...
        
        genderDropDown.anchorView = genderButton
        locationDropDown.anchorView = locationButton
        educationDropDown.anchorView = educationButton
        careerDropDown.anchorView = careerButton
        nationalityDropDown.anchorView = nationalityButton
        worckExperianceDropDown.anchorView = workExpButton
        commitmentDropDown.anchorView = commitmentButton
        noticeDropDown.anchorView = noticeButton
        visaDropDown.anchorView = visaStutsButton
        //if you want the list to cover the screen set it yearsDropDown.anchorView=((((((yearsDropDown))))))
        
        genderDropDown.bottomOffset = CGPoint(x: 0, y: genderButton.bounds.height)
        locationDropDown.bottomOffset = CGPoint(x: 0, y: locationButton.bounds.height)
        educationDropDown.bottomOffset = CGPoint(x: 0, y: educationButton.bounds.height)
        careerDropDown.bottomOffset = CGPoint(x: 0, y: careerButton.bounds.height)
        nationalityDropDown.bottomOffset = CGPoint(x: 0, y: nationalityButton.bounds.height)
        worckExperianceDropDown.bottomOffset = CGPoint(x: 0, y: workExpButton.bounds.height)
        commitmentDropDown.bottomOffset = CGPoint(x: 0, y: commitmentButton.bounds.height)
        noticeDropDown.bottomOffset = CGPoint(x: 0, y: noticeButton.bounds.height)
        visaDropDown.bottomOffset = CGPoint(x: 0, y: visaStutsButton.bounds.height)
        
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
        commitmentDropDown.dataSource = [
            "i.e 1","i.e 2","i.e 3"
        ]
        noticeDropDown.dataSource = [
            "i.e 1","i.e 2","i.e 3"
        ]
        visaDropDown.dataSource = [
            "i.e 1","i.e 2","i.e 3"
        ]
        nationalityDropDown.dataSource = [
            "i.e 1","i.e 2","i.e 3"
        ]
        worckExperianceDropDown.dataSource = [
            "i.e 1","i.e 2","i.e 3"
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
        nationalityDropDown.selectionAction = { [weak self] (index, item) in
            self?.nationalityButton.setTitle(" \(item)", for: .normal)
        }
        // Action triggered on selection
        worckExperianceDropDown.selectionAction = { [weak self] (index, item) in
            self?.workExpButton.setTitle(" \(item)", for: .normal)
        }
        // Action triggered on selection
        commitmentDropDown.selectionAction = { [weak self] (index, item) in
            self?.commitmentButton.setTitle(" \(item)", for: .normal)
        }
        // Action triggered on selection
        noticeDropDown.selectionAction = { [weak self] (index, item) in
            self?.noticeButton.setTitle(" \(item)", for: .normal)
        }
        // Action triggered on selection
        visaDropDown.selectionAction = { [weak self] (index, item) in
            self?.visaStutsButton.setTitle(" \(item)", for: .normal)
        }
        
    }
    
}

extension ApplayForJobViewController: UIDocumentPickerDelegate,UINavigationControllerDelegate {
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

extension ApplayForJobViewController: UITextViewDelegate{
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
