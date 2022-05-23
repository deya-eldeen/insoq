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
    
    // MARK: Functions
    func registerCells() {
        
        let cellIDs = [AdDetailsGalleryCell.id, AdTitleCell.id, AdLocationCell.id, AdDetailsCell.id, AdSpecificationCell.id, AdDescriptionCell.id, AdLocationMapCell.id, AdMetaCell.id, MobileNumberCell.id, VehicleNumberCell.id]
        
        
    }
    
    // MARK:
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        
    }
    
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return .init()
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
