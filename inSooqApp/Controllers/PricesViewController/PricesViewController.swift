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
    
    @IBAction func didTapContinue() {
        self.proceed()
    }
    
    var previousVC: UIViewController?
    var packages = [PackageModel]()
    var categoryId = 1
    var paymentNavigationSource = PaymentNavigationSource.none

    var selectedPackage: PackageModel?
    
    var adType: AdMainType = .none
    
    var images = [UIImage]()
    var imagesNames = [String]()

    func navigate() {
    
        guard let package = selectedPackage else { return }
        let price = package.price ?? 0.0

        if (price > 0.0) {
            let target = ViewControllersAssembly.misc.makeViewController(with: "PaymentViewController") as! PaymentViewController
            target.paymentNavigationSource = self.paymentNavigationSource
            self.present(target, animated: true)
        } else {
            
        }

    }
    
    var isUpgrading = false
    
    override func viewDidLoad() {
        
        self.tableView.prepareTableView(vc: self, withCellsIDs: [PaidPackageCell.id, FreePackageCell.id])
        
        self.categoryId = self.adType.rawValue
        
        ApiRequests.packages(CategoryId: self.categoryId) { response in
            self.packages = response.value ?? []
            if (self.isUpgrading == true) {
                self.packages.removeAll(where: { $0.price == 0.0 } )
            }
            self.tableView.reloadData()
            if(self.packages.count > 0) {
                self.selectCell(indexPath: IndexPath.init(row: 0, section: 0))
            }
        }
        
    }
    
}

extension PricesViewController {
    
    func proceed() {
        
        var typeForSwitch = AdMainType.none
        
        if (adType != .none) {
            typeForSwitch = adType
        } else {
            typeForSwitch = FormViewController.adMainType
        }
        
        print("typeForSwitch",typeForSwitch)
        let imagesWithNames = Array(zip(images, imagesNames))

        switch typeForSwitch {
        case .motor:
            let initialParams = try? FormViewController.motorInitialSubmission?.asDictionary()
            if let initialParams = initialParams {
                print("initialParams",initialParams)
                ApiRequests.submitMotor(params: initialParams) { response in
                    let fullParams = try? FormViewController.motorFullSubmission?.asDictionary()
                    let url = APIUrls.submitMotorFull()
                    if let fullParams = fullParams {
                        ApiRequests.submitForm(url: url, files: [], images: imagesWithNames, params: fullParams) { formResponse in
                            print("submitMotor",formResponse)
                            self.navigate()
                        }
                    }
                }
            }
        case .job:
            let initialParams = try? FormViewController.jobInitialSubmission?.asDictionary()
            if let initialParams = initialParams {
                print("initialParams",initialParams)
                ApiRequests.submitJob(params: initialParams) { response in
                    let fullParams = try? FormViewController.jobFullSubmission?.asDictionary()
                    let url = APIUrls.submitJobFull()
                    if let fullParams = fullParams {
                        ApiRequests.submitForm(url: url, files: [], images: imagesWithNames, params: fullParams) { formResponse in
                            print("submitJob",formResponse)
                            self.navigate()
                        }
                    }
                }
            }
        case .numbers:
            let fullParams = try? FormViewController.numbersSubmission?.asDictionary()
            let url = APIUrls.submitNumbers()
            if let fullParams = fullParams {
                
                ApiRequests.submitNumber(params: fullParams) { response in
                    print("submitNumbers",response)
                    self.navigate()
                }
                
            }
        case .electronics:
            let fullParams = try? FormViewController.electronicsSubmission?.asDictionary()
            let url = APIUrls.submitElectronics()
            if let fullParams = fullParams {
                ApiRequests.submitForm(url: url, files: [], images: imagesWithNames, params: fullParams) { formResponse in
                    print("submitElectronics",formResponse)
                    self.navigate()
                }
            }
        case .classified:
            let initialParams = try? FormViewController.classifiedInitialSubmission?.asDictionary()
            if let initialParams = initialParams {
                print("initialParams",initialParams)
                ApiRequests.submitClassified(params: initialParams) { response in
                    FormViewController.classifiedFullSubmission?.AdId = "\(response.value?.id ?? 0)"
                    
                    let fullParams = try? FormViewController.classifiedFullSubmission?.asDictionary()
                    let url = APIUrls.submitClassifiedFull()
                    if let fullParams = fullParams {
                        ApiRequests.submitForm(url: url, files: [], images: imagesWithNames, params: fullParams) { formResponse in
                            print("submitClassified",formResponse)
                            self.navigate()
                        }
                    }
                }
            }
        case .services:
            let fullParams = try? FormViewController.servicesSubmission?.asDictionary()
            let url = APIUrls.submitService()
            if let fullParams = fullParams {
                ApiRequests.submitForm(url: url, files: [], images: [], params: fullParams) { formResponse in
                    print("submitServices",formResponse)
                    self.navigate()
                }
            }
        case .business:
            let fullParams = try? FormViewController.businessSubmission?.asDictionary()
            let url = APIUrls.submitBusiness()
            if let fullParams = fullParams {
                ApiRequests.submitForm(url: url, files: [], images: imagesWithNames, params: fullParams) { formResponse in
                    print("submitBusiness",formResponse)
                    self.navigate()
                }
            }
        case .none:
            self.navigate()
        }
                
    }
    
    func selectCell(indexPath: IndexPath) {
        
        let package = self.packages[indexPath.row]
        
        for (index, _) in self.packages.enumerated() {
            self.tableView.deselectRow(at: IndexPath.init(row: index, section: 0), animated: false)
        }
        
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
    }
    
}

extension PricesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.packages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        self.selectedPackage = self.packages[indexPath.row]

        switch selectedPackage?.price {
        case 0.0:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: FreePackageCell.id) as! FreePackageCell
            return cell
        default:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: PaidPackageCell.id) as! PaidPackageCell
            cell.renderCell(name: selectedPackage?.details_En ?? "", price: selectedPackage?.price ?? 0.0, imageUrl: selectedPackage?.packImage ?? "")
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectCell(indexPath: indexPath)
        
    }
    
}
