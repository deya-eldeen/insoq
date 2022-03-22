//
//  SideMenuViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 17/02/2021.
//

import UIKit

class SideMenuViewController: UIViewController {
    var presentTransition: UIViewControllerAnimatedTransitioning?
    var dismissTransition: UIViewControllerAnimatedTransitioning?
    static var index:Int=0
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var viewToDismiss: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("heightss",view.frame.height)
        let dissmiss = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        viewToDismiss.addGestureRecognizer(dissmiss)

    }
    override func viewWillAppear(_ animated: Bool) {
        registerViews(index: SideMenuViewController.index)
    }
    @objc func dismissView(){
        debugPrint("dismissView")
        let transition: CATransition = CATransition()
        transition.duration = 0.25
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)

//        UIView.animate(withDuration: 0.25) {
//            self.dismiss(animated: true, completion: nil)
//
//        }
    }

    
    private func registerViews(index:Int){
        ///    set switch  to set view base on item selected
        switch index {
        case 1:
            debugPrint("Setting propertyDetailsView")
            let propertyDetailsView: PropertyDetailsView = {
                let view = PropertyDetailsView()
                view.backgroundColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()

            menuView.addSubview(propertyDetailsView)
            propertyDetailsView.setVC(viewController: self)
            propertyDetailsView.widthAnchor.constraint(equalTo: menuView.widthAnchor, multiplier: 1).isActive=true
            propertyDetailsView.heightAnchor.constraint(equalTo: menuView.heightAnchor, multiplier: 1).isActive=true
            propertyDetailsView.centerXAnchor.constraint(equalTo: menuView.centerXAnchor).isActive=true
            propertyDetailsView.centerYAnchor.constraint(equalTo: menuView.centerYAnchor).isActive=true
            break
        case 2:
            debugPrint("Setting jobsDetailsView")
            let jobsDetailsView: JobDetailsView = {
                let view = JobDetailsView()
                view.backgroundColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()

            menuView.addSubview(jobsDetailsView)
            jobsDetailsView.setVC(viewController: self)
            jobsDetailsView.widthAnchor.constraint(equalTo: menuView.widthAnchor, multiplier: 1).isActive=true
            jobsDetailsView.heightAnchor.constraint(equalTo: menuView.heightAnchor, multiplier: 1).isActive=true
            break
        case 3:
            debugPrint("ServicesDetailsView")
            let servicesDetailsView: ServicesDetailsView = {
                let view = ServicesDetailsView()
                view.backgroundColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            debugPrint("before",menuView.subviews.count)
            for v in menuView.subviews{
                v.isHidden=true//removeFromSuperview()
            }
            menuView.addSubview(servicesDetailsView)
            debugPrint("after",menuView.subviews.count)

            servicesDetailsView.setVC(viewController: self)
            servicesDetailsView.widthAnchor.constraint(equalTo: menuView.widthAnchor, multiplier: 1).isActive=true
            servicesDetailsView.heightAnchor.constraint(equalTo: menuView.heightAnchor, multiplier: 1).isActive=true
            break
        case 4,5,7:
            debugPrint("BusinessDetailsView")
            let businessDetailsView: BusinessDetailsView = {
                let view = BusinessDetailsView()
                view.backgroundColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                view.similerTitle.text = "Similar Listings"

                return view
            }()
            if index==7{
                businessDetailsView.specificationsButton.setTitle("Business Specifications", for: .normal)

            }
            else{
                businessDetailsView.specificationsButton.setTitle("Item Specifications", for: .normal)

            }
            menuView.addSubview(businessDetailsView)
            businessDetailsView.setVC(viewController: self)
            businessDetailsView.widthAnchor.constraint(equalTo: menuView.widthAnchor, multiplier: 1).isActive=true
            businessDetailsView.heightAnchor.constraint(equalTo: menuView.heightAnchor, multiplier: 1).isActive=true
            break
        case 6:
            let plateDetailsView: PlateDetailsView = {
                let view = PlateDetailsView()
                view.backgroundColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()

            menuView.addSubview(plateDetailsView)
            plateDetailsView.setVC(viewController: self)
            plateDetailsView.widthAnchor.constraint(equalTo: menuView.widthAnchor, multiplier: 1).isActive=true
            plateDetailsView.heightAnchor.constraint(equalTo: menuView.heightAnchor, multiplier: 1).isActive=true
            break
        default:
            debugPrint("Setting motorsDetailsView")
            let motorsDetailsView: MotorsDetailsView = {
                let view = MotorsDetailsView()
                view.backgroundColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()

            menuView.addSubview(motorsDetailsView)
            motorsDetailsView.setVC(viewController: self)
            motorsDetailsView.widthAnchor.constraint(equalTo: menuView.widthAnchor, multiplier: 1).isActive=true
            motorsDetailsView.heightAnchor.constraint(equalTo: menuView.heightAnchor, multiplier: 1).isActive=true
            break
        }
    }
}
//MARK:-Side Menu setup
extension SideMenuViewController:UIViewControllerTransitioningDelegate {

    func showSettings(animated: Bool) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(identifier: "SideMenuViewController")
        switch Statics.languageCode {
        case "ar":
            presentTransition = LeftToRightTransition_En()
            dismissTransition = RightToLeftTransition_En()
            break
        default:
            presentTransition = RightToLeftTransition_Ar()
            dismissTransition = LeftToRightTransition_Ar()
        }

        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        present(vc, animated: true, completion: { [weak self] in
            self?.presentTransition = nil
        })
    }
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentTransition
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissTransition
    }
}
