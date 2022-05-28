//
//  DetailsViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 11/02/2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: Outlet
    @IBOutlet weak var smsButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Actions
    @IBAction func didTapSMSButton() {
        
    }
    
    @IBAction func didTapCallButton() {
        
    }
    
    @IBAction func didTapChat() {
        
    }
    
    var adType: AdMainType = .none
    
    var cellIDs = [
        AdDetailsGalleryCell.id,
        AdTitleCell.id,
        AdLocationCell.id,
        AdDetailsCell.id,
        AdSpecificationCell.id,
        AdDescriptionCell.id,
        AdLocationMapCell.id,
        AdMetaCell.id,
        MobileNumberCell.id,
        VehicleNumberCell.id
    ]
    
    // MARK: Functions
    func registerCells() {

//        switch adType {
//        case .motor:
//            <#code#>
//        case .job:
//            <#code#>
//        case .numbers:
//            <#code#>
//        case .electronics:
//            <#code#>
//        case .classified:
//            <#code#>
//        case .services:
//            <#code#>
//        case .business:
//            <#code#>
//        case .none:
//            <#code#>
//        }
        
        self.tableView.prepareTableView(vc: self, withCellsIDs: cellIDs)
        
    }
    
    // MARK:
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        
    }
    
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellIDs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = self.cellIDs[indexPath.row]
        
        switch cellID {
        case AdDetailsGalleryCell.id:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID) as! AdDetailsGalleryCell
            return cell
        case AdTitleCell.id:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID) as! AdTitleCell
            return cell
        case AdLocationCell.id:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID) as! AdLocationCell
            return cell
        case AdDetailsCell.id:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID) as! AdDetailsCell
            return cell
        case AdSpecificationCell.id:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID) as! AdSpecificationCell
            return cell
        case AdDescriptionCell.id:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID) as! AdDescriptionCell
            return cell
        case AdLocationMapCell.id:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID) as! AdLocationMapCell
            return cell
        case AdMetaCell.id:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID) as! AdMetaCell
            return cell
        case MobileNumberCell.id:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID) as! MobileNumberCell
            return cell
        case VehicleNumberCell.id:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID) as! VehicleNumberCell
            return cell
        default:
            return .init()
        }
        
    }
    
}

//** Details Screen
//    3 Buttons at the bottom
//        SMS
//        Call
//        Chat
//    Cells
//        AdDetailsGalleryCell
//            Next Button
//            Back Button
//        AdTitleCell
//            Title
//            Price
//        AdLocationCell
//            Title
//            Subtitle
//            Share button
//            Heart button
//        AdDetailsCell
//            Detail 1
//            Detail 2
//            Detail 3
//        AdSpecificationCell
//            Stackview
//        AdDescriptionCell
//            Label
//        AdLocationMapCell
//            Map View
//        AdMetaCell
//            Contact Seller
//            Make an offer
//            Report Ad
//
//        MobileNumberCell
//        VehicleNumberCell
