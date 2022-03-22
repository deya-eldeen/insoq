//
//  CardDetailsViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 14/04/2021.
//

import UIKit

class CardDetailsViewController: UIViewController {

    @IBOutlet weak var bottomBar: BottomBar!
    @IBOutlet weak var packageView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomBar.setVC(viewController: self)
        // Do any additional setup after loading the view.
    }
    //MARK:-override touches-
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if self.isKind(of: CardDetailsViewController.self){
            let touch = touches.first
            if touch?.view?.tag != 100{
                deleteAction()
            }

        }
    }
    @IBAction func back_Pressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private func setDesign(){
        packageView.addShadowToView()
    }
    @IBAction func pay_Pressed(_ sender: Any) {
        registerAdConfirmationView()
       //
        
    }
    func registerAdConfirmationView(){
        registerBackView(c: self)
        let deleteAdView: AdConfirmationView = {
            let v = AdConfirmationView()
            // view.backgroundColor = .white
            v.addShadowToView()
            v.translatesAutoresizingMaskIntoConstraints = false
            return v
        }()
        
        view.addSubview(deleteAdView)
        deleteAdView.tag=100
        deleteAdView.setVC(viewController: self)
        deleteAdView.continueButton.addTarget(self, action: #selector(continueAction), for: .touchUpInside)
        deleteAdView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive=true
        deleteAdView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.9).isActive=true
        //(equalTo: c.view.heightAnchor, multiplier: 0.35).isActive=true
        deleteAdView.centerXAnchor.constraint(equalTo:  view.centerXAnchor).isActive=true
        deleteAdView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive=true
        
    }
    @objc func deleteAction(){
        for v in self.view.subviews{
            debugPrint("name..",v)
            if v.tag == 101 || v.tag == 100 {
                v.removeFromSuperview()
                debugPrint("Found Back View")
            }
            
        }
    }
    @objc func continueAction(){
        deleteAction()
        newRoot(NavId: "MainNav")

    }


}
