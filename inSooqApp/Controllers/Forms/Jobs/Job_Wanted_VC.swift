//
//  File.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

class Job_Wanted_VC: FormViewController {
    
    // Data
    var dataTypes = [ListItem]()

    var otherJobType = ""
    
    // Requests
    func requestTypes() {
        ApiRequests.jobTypes { response in
            self.dataTypes = response.value ?? []
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextViewController = ViewControllersAssembly.forms.makeViewController(with: "Job_Wanted_Details_VC")
        
        // Calls
        requestTypes()
    }
    
    override func feedStackView() {
        self.formElements = self.formElements()
        super.feedStackView()
    }
    
    // Selection Logic
    @objc override func didTapPicker(picker: PickerButton) {
        
        customeListView.pickerID = picker.id
        
        switch picker.id {
            case .jobType:
            customeListView.setData(vc:self,list: self.dataTypes, hideOther: false)
            default: break
        }
        
        customeListView.didSelectListItem = { (item, pickerID) in
            
            print("DIDSELECT",item.id ?? 0)

            switch picker.id {
            case .jobType:
                if(item.id == 0) {
                    self.otherJobType = (item.en_Name ?? item.en_Text ?? "")
                }
            default: break
            }
            
            self.updateTextForPicker(with: pickerID, value: item)
        }
        
        self.customeListView.showListing(vc: self)
    }

    override func didTapContinue() {
        
        if ( self.isValid().0 == true ) {
            
            FormViewController.jobInitialSubmission = JobInitialSubmission(
                title: getFormValue(id: .title),
                jobTitle: getFormValue(id: .title),
                jobType: getPickerValue(id: .jobType),
                otherJobType: self.otherJobType,
                phoneNumber: getFormValue(id: .phoneNumber)
            )

            print("FormViewController.jobInitialSubmission",FormViewController.jobInitialSubmission)

        }
        
        super.didTapContinue()

    }
    
}
