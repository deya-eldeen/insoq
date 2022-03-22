//
//  NotificationsViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 10/02/2021.
//

import UIKit

class NotificationsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
//    private var lastContentOffset: CGFloat = 0
    @IBOutlet weak var fillterButton: UIButton!
    
//    @IBOutlet weak var hiddenButton: UIButton!
    @IBOutlet weak var tabbarBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var tabBarView: BottomView!
    @IBOutlet weak var notificationsTableView: UITableView!
    //MARK:-SideMenu Data
    @IBOutlet weak var sideMenu_FillterView: UIView!
    @IBOutlet weak var sideMenu_ViewToDismiss: UIView!
    @IBOutlet weak var sideMenuView: UIView!
    @IBOutlet weak var sideMenuRightConstraint: NSLayoutConstraint!
    var  _sideMenuShown:Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
//        showAddButton(alpha: 0, hidden: true)
        tabBarView.setVC(viewController: self)
//        hiddenButton.addTarget(self, action: #selector(tabBarView.addTapped(sender:)), for: .touchUpInside)

    }

    override func viewWillAppear(_ animated: Bool) {
        setDesign()
        notificationsTableView.delegate=self
        notificationsTableView.dataSource=self
        let notificationsNib = UINib(nibName: "notificationsTableViewCell", bundle: nil)
        notificationsTableView.register(notificationsNib, forCellReuseIdentifier: "notificationsTableViewCell")
    }
    
    private func setDesign(){
        fillterButton.titleLabel?.font=UIFont(name: "FontAwesome5Pro-Regular", size: 25)
        fillterButton.setTitle(Statics.icons.fillter_icon, for: .normal)
        fillterButton.tintColor=#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    private func registerFillter(){
        debugPrint("ServicesDetailsView")
        let fillterView: NotificationFillterView = {
            let view = NotificationFillterView()
            // view.backgroundColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        sideMenu_FillterView.addSubview(fillterView)
        fillterView.setVC(viewController: self)
        fillterView.cancelButton.addTarget(self, action: #selector(hideSideMenu), for: .touchUpInside)
        fillterView.widthAnchor.constraint(equalTo: sideMenu_FillterView.widthAnchor, multiplier: 1).isActive=true
        fillterView.heightAnchor.constraint(equalTo: sideMenu_FillterView.heightAnchor, multiplier: 1).isActive=true
        fillterView.centerXAnchor.constraint(equalTo: sideMenu_FillterView.centerXAnchor).isActive=true
        fillterView.centerYAnchor.constraint(equalTo: sideMenu_FillterView.centerYAnchor).isActive=true
}
    @IBAction func back_Pressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sideMenu_Pressed(_ sender: Any) {
        if _sideMenuShown{
            //show
            showSideMenu()
        }
        
    }
    private func showSideMenu(){
        debugPrint("showing side menue")
        registerFillter()
        sideMenuView.animateViewHeight(controller: self, height: 0, heightConstraint: sideMenuRightConstraint)
        _sideMenuShown  = !_sideMenuShown
        
    }
    @objc func hideSideMenu(){
        debugPrint("hiding side menue")
        sideMenuView.animateViewHeight(controller: self, height: sideMenuView.frame.width, heightConstraint: sideMenuRightConstraint)
        _sideMenuShown  = !_sideMenuShown
        
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationsTableViewCell", for: indexPath) as! notificationsTableViewCell
        
       return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SubCategoriesViewController.subCategoryObject.name = Statics.categoyModel[indexPath.row].categoryName
        debugPrint("subCategoriesTableView-vcTitle",Statics.categoyModel[indexPath.row].categoryName)
    forcePresentViewController(viewController: self, storyBoardId: "DetailsViewController")

    }

}

//MARK: Search Text field Delegate:-
//extension NotificationsViewController: UIScrollViewDelegate
//{
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if (self.lastContentOffset > scrollView.contentOffset.y) {
//            // move up
//            debugPrint("Scorlling up")
//
//            changeTabBarHeight(height: 0, hidden: false)
//            self.showAddButton(alpha: 0, hidden: true)
//
//        }
//        else if (self.lastContentOffset < scrollView.contentOffset.y) {
//            // move down
//            debugPrint("Scorlling down-scrollViewDidScroll")
//            changeTabBarHeight(height: -80, hidden: true)
//            self.showAddButton(alpha: 1, hidden: false)
//
//        }
//
//        // update the new position acquired
//        self.lastContentOffset = scrollView.contentOffset.y
//    }
//    private func changeTabBarHeight(height:CGFloat,hidden:Bool){
//        UIView.animate(withDuration: 0.5) {
//            self.tabbarBottomConstraint.constant=height
//        } completion: { (true) in
//           // self.tabBarView.isHidden=hidden
//        debugPrint("Done")
//        }
//  }
////private func showAddButton(alpha:CGFloat,hidden:Bool){
////    hiddenButton.alpha=alpha
////    hiddenButton.isEnabled = !hidden
////    hiddenButton.isHidden=hidden
////    }
//
//}
//{
//
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        debugPrint("Scrolling")
//        if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0{
//            debugPrint("Scrolling down")
//            changeTabbar(hidden: true, animated: true)
//        }
//        else{
//            debugPrint("Scrolling up")
//
//            changeTabbar(hidden: false, animated: true)
//        }
//    }
//}
