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
            customeListView.setData(vc:self,list: self.dataTypes)
            default: break
        }
        
        customeListView.didSelectListItem = { (item, pickerID) in
            self.updateTextForPicker(with: pickerID, value: item)
        }
        
        self.customeListView.showListing(vc: self)
    }

}
