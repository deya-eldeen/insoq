//
//  EditAdViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 17/04/2021.
//

import UIKit

class EditAdViewController: UIViewController {
    @IBOutlet weak var editAdViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var bottomBar: BottomBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        bottomBar.setVC(viewController: self)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerEditAdViews()
    }
    @IBAction func back_Pressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func registerEditAdViews(){
        let card: EditMotorsAdView = {
            let view = EditMotorsAdView()
            //view.backgroundColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        editView.addSubview(card)
        card.setVC(viewController: self)
        editAdViewHeightConstraint.constant=3700
      //  card.topAnchor.constraint(equalTo: editView.topAnchor, constant: 80).isActive=true
        card.widthAnchor.constraint(equalTo: editView.widthAnchor, multiplier: 1).isActive=true
        card.heightAnchor.constraint(equalTo: editView.heightAnchor, multiplier: 1).isActive=true
    }


}

