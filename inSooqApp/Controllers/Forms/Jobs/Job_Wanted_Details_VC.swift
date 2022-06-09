//
//  File2.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

class Job_Wanted_Details_VC: FormViewController {
    
    // Data
    var data_gender = [ListItem]()
    var data_nationality = [ListItem]()
    var data_location = [LocationModel]()
    var data_educationLevel = [ListItem]()
    var data_workExperience = [ListItem]()
    var data_commitment = [ListItem]()
    var data_noticePeriod = [ListItem]()
    var data_visaStatus = [ListItem]()
    var data_professionalLevel = [ListItem]()
    var data_expectedMonthlySalary = [ListItem]()
    
    // Requests
    func request_gender() {
        //
    }
    func request_nationality() {
        ApiRequests.nationalities { response in
            self.data_nationality = response.value ?? []
        }
    }
    func request_location() {
        ApiRequests.locations { response in
            self.data_location = response.value ?? []
        }
    }
    func request_educationLevel() {
        ApiRequests.educationLevels { response in
            self.data_educationLevel = response.value ?? []
        }
    }
    func request_workExperience() {
        ApiRequests.workExperiences { response in
            self.data_workExperience = response.value ?? []
        }
    }
    func request_commitment() {
        ApiRequests.commitments { response in
            self.data_commitment = response.value ?? []
        }
    }
    func request_noticePeriod() {
        ApiRequests.noticePeriods { response in
            self.data_noticePeriod = response.value ?? []
        }
    }
    func request_visaStatus() {
        ApiRequests.visaStatuses { response in
            self.data_visaStatus = response.value ?? []
        }
    }
    func request_professionalLevel() {
        ApiRequests.careerLevels { response in
            self.data_professionalLevel = response.value ?? []
        }
    }
    func request_expectedMonthlySalary() {
        ApiRequests.monthlySalary { response in
            self.data_expectedMonthlySalary = response.value ?? []
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextViewController = ViewControllersAssembly.misc.makeViewController(with: "PricesViewController")
        self.leadsToPrices = true
        
        request_gender()
        request_nationality()
        request_location()
        request_educationLevel()
        request_workExperience()
        request_commitment()
        request_noticePeriod()
        request_visaStatus()
        request_professionalLevel()
        request_expectedMonthlySalary()
        
    }
    
    override func feedStackView() {
        self.formElements = self.formElements()
        super.feedStackView()
    }
    
    // Selection Logic
    @objc override func didTapPicker(picker: PickerButton) {
        
        customeListView.pickerID = picker.id
        
        switch picker.id {
            
            case .gender:
            customeListView.setData(vc:self,list: self.dataGender)
            case .nationality:
            customeListView.setData(vc:self,list: self.data_nationality)
            case .location:
            customeListView.setData(vc:self,list: self.data_location)
            case .educationLevel:
            customeListView.setData(vc:self,list: self.data_educationLevel)
            case .workExperience:
            customeListView.setData(vc:self,list: self.data_workExperience)
            case .commitment:
            customeListView.setData(vc:self,list: self.data_commitment)
            case .noticePeriod:
            customeListView.setData(vc:self,list: self.data_noticePeriod)
            case .visaStatus:
            customeListView.setData(vc:self,list: self.data_visaStatus)
            case .professionalLevel:
            customeListView.setData(vc:self,list: self.data_professionalLevel)
            case .expectedMonthlySalary:
            customeListView.setData(vc:self,list: self.data_expectedMonthlySalary)
            
            default: break
        }
        
        customeListView.didSelectListItem = { (item, pickerID) in
            print("DIDSELECT",item.id ?? 0)

            
            self.updateTextForPicker(with: pickerID, value: item)
            
        }
        
        self.customeListView.showListing(vc: self)
    }

    override func didTapContinue() {
        
        if ( self.isValid().0 == true ) {
            
            FormViewController.jobFullSubmission = JobFullSubmission(
                Description: getDescriptionValue(),
                Lat: String(describing: locationLatitude ?? 0.0),
                Lng: String(describing: locationLongitude ?? 0.0),
                Location: getPickerValue(id: .location),
                CategoryId: "????????????",
                AdId: "0",
                CV: "",
                Gender: "???????????????",
                Nationality: getPickerValue(id: .nationality),
                CurrentLocation: getPickerValue(id: .location),
                EducationLevel: getPickerValue(id: .educationLevel),
                CurrentPosition: getPickerValue(id: .currentLocation),
                WorkExperience: getPickerValue(id: .workExperience),
                Commitment: getPickerValue(id: .commitment),
                NoticePeriod: getPickerValue(id: .noticePeriod),
                VisaStatus: getPickerValue(id: .visaStatus),
                CareerLevel: getPickerValue(id: .professionalLevel),
                ExpectedMonthlySalary: getPickerValue(id: .expectedMonthlySalary),
                CvFile: "??????????????????"
            )

            print("FormViewController.jobFullSubmission",FormViewController.jobFullSubmission)

        }
        
        super.didTapContinue()

    }
    
}
