//
//  Experiments.swift
//  inSooqApp
//
//  Created by Deya on 09/06/2022.
//

import UIKit

extension AppDelegate {
    
    func exp1() {
        
        FormViewController.classifiedInitialSubmission = .init(
            title: "Title",
            categoryId: "39",
            subCategoryId: "68",
            otherSubCategory: "",
            subTypeId: "0",
            otherSubType: "")
        
        let initialParams = try? FormViewController.classifiedInitialSubmission?.asDictionary()
        
        if let initialParams = initialParams {
            print("initialParams",initialParams)
            ApiRequests.submitClassified(params: initialParams) { response in
                print("response__",response.value?.id ?? 0)
                let fullParams = try? FormViewController.classifiedFullSubmission?.asDictionary()
                let url = APIUrls.submitClassifiedFull()
                
                let imageID = "default_image"
                let sampleImage = UIImage(named: imageID)!
                
                if let fullParams = fullParams {
                    ApiRequests.submitForm(url: url, files: [], images: [(sampleImage,imageID)], params: fullParams) { formResponse in
                        print("submitClassified",formResponse)
                        //self.navigate()
                    }
                }
            }
        }
        
    }
    
    
    func exp2() {
        
        let postfix = "-"
        let fullParams =
                try! ElectronicsSubmission(
                    Age: "0_1 months\(postfix)",
                    Color: "Black\(postfix)",
                    Description: "",
                    Lat: "32.572339",
                    Lng: "35.730077",
                    Location: "Abu Dhabi\(postfix)",
                    Price: "111111",
                    Title: "23123123",
                    Usage: "Daily use since purchase\(postfix)",
                    Warranty: "1",
                    MainPhoto: "B424F4F7-FF61-4772-9360-4B021B2BF7FC.jpeg",
                    SubCategoryId: "15",
                    OtherSubCategory: "",
                    SubTypeId: "0",
                    OtherSubType: "",
                    PhoneNumber: "0797228550",
                    Version: "INT\(postfix)",
                    Ram: "12 GB\(postfix)",
                    Storage: "1 TB\(postfix)",
                    Id: "0",
                    AdId: "0",
                    CategoryId: "19"
                ).asDictionary()

        let url = APIUrls.submitElectronics()

        let imageID = "default_image"
        let sampleImage = UIImage(named: imageID)!

        ApiRequests.submitForm(url: url, files: [], images: [(sampleImage,imageID)], params: fullParams) { formResponse in
            print("_____________________submitForm",formResponse)
            //self.navigate()
        }


    }
    
}



