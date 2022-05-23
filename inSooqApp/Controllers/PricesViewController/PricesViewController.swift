//
//  PricesViewController.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit

class PricesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    @IBAction func didTapDismiss() {
        self.dismiss(animated: true)
    }
    
    var previousVC: UIViewController?
    var packages = [PackageModel]()
    
    func dismissThenPopToRoot() {
    
        self.dismiss(animated: true) {
            self.previousVC?.navigationController?.popToRootViewController(animated: true)
        }
    
    }
    
    var isUpgrading = false
    
    override func viewDidLoad() {
        
        self.tableView.prepareTableView(vc: self, withCellsIDs: [PaidPackageCell.id, FreePackageCell.id])
        
        ApiRequests.packages(CategoryId: FormViewController.adMainType.rawValue) { response in
            self.packages = response.value ?? []
            if (self.isUpgrading == true) {
                self.packages.removeAll(where: { $0.price == 0.0 } )
            }
            self.tableView.reloadData()
        }
        
    }
    
    @IBAction func didTapContinue() {
        
        proceed()
        
    }
    
}

extension PricesViewController {
    
    func proceed() {
        switch FormViewController.adMainType {
        
        case .motor:
            let initialParams = try? FormViewController.motorInitialSubmission?.asDictionary()
            if let initialParams = initialParams {
                ApiRequests.submitMotor(params: initialParams) { response in
                    let fullParams = try? FormViewController.motorFullSubmission?.asDictionary()
                    let url = APIUrls.submitMotorFull()
                    if let fullParams = fullParams {
                        ApiRequests.submitForm(url: url, files: [], images: [], params: fullParams) { formResponse in
                            print("submitMotor",formResponse)
                            self.dismissThenPopToRoot()
                        }
                    }
                }
            }
        case .job:
            let initialParams = try? FormViewController.jobInitialSubmission?.asDictionary()
            if let initialParams = initialParams {
                ApiRequests.submitJob(params: initialParams) { response in
                    let fullParams = try? FormViewController.jobFullSubmission?.asDictionary()
                    let url = APIUrls.submitJobFull()
                    if let fullParams = fullParams {
                        ApiRequests.submitForm(url: url, files: [], images: [], params: fullParams) { formResponse in
                            print("submitMotor",formResponse)
                            self.dismissThenPopToRoot()
                        }
                    }
                }
            }
        case .numbers:
            let fullParams = try? FormViewController.numbersSubmission?.asDictionary()
            let url = APIUrls.submitNumbers()
            if let fullParams = fullParams {
                ApiRequests.submitForm(url: url, files: [], images: [], params: fullParams) { formResponse in
                    print("submitMotor",formResponse)
                    self.dismissThenPopToRoot()
                }
            }
        case .electronics:
            let fullParams = try? FormViewController.electronicsSubmission?.asDictionary()
            let url = APIUrls.submitElectronics()
            if let fullParams = fullParams {
                ApiRequests.submitForm(url: url, files: [], images: [], params: fullParams) { formResponse in
                    print("submitMotor",formResponse)
                    self.dismissThenPopToRoot()
                }
            }
        case .classified:
            let initialParams = try? FormViewController.classifiedInitialSubmission?.asDictionary()
            if let initialParams = initialParams {
                ApiRequests.submitClassified(params: initialParams) { response in
                    let fullParams = try? FormViewController.classifiedFullSubmission?.asDictionary()
                    let url = APIUrls.submitClassifiedFull()
                    if let fullParams = fullParams {
                        ApiRequests.submitForm(url: url, files: [], images: [], params: fullParams) { formResponse in
                            print("submitMotor",formResponse)
                            self.dismissThenPopToRoot()
                        }
                    }
                }
            }
        case .services:
            let fullParams = try? FormViewController.servicesSubmission?.asDictionary()
            let url = APIUrls.submitService()
            if let fullParams = fullParams {
                ApiRequests.submitForm(url: url, files: [], images: [], params: fullParams) { formResponse in
                    print("submitMotor",formResponse)
                    self.dismissThenPopToRoot()
                }
            }
        case .business:
            let fullParams = try? FormViewController.businessSubmission?.asDictionary()
            let url = APIUrls.submitBusiness()
            if let fullParams = fullParams {
                ApiRequests.submitForm(url: url, files: [], images: [], params: fullParams) { formResponse in
                    print("submitMotor",formResponse)
                    self.dismissThenPopToRoot()
                }
            }
        case .none:
            return
        }
                
    }
    
}

extension PricesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.packages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let package = self.packages[indexPath.row]
        
        switch package.price {
        case 0.0:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: FreePackageCell.id) as! FreePackageCell
            return cell
        default:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: PaidPackageCell.id) as! PaidPackageCell
            cell.renderCell(name: "N/A", price: package.price ?? 0.0)
            return cell
        }

    }
    
}
