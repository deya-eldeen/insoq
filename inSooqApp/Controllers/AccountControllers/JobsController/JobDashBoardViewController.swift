//
//  JobDashBoardViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 15/04/2021.
//

import UIKit

class JobDashBoardViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var topBar: TopNavigationbar!
    @IBOutlet weak var bottomBar: BottomBar!
    
    @IBOutlet weak var myAdsTableView: UITableView!
    @IBOutlet weak var packageView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomBar.setVC(viewController: self)
        topBar.setVC(viewController: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        packageView.addShadowToView()
        setupDelegates()
        registerXib()

    }
    override func viewDidAppear(_ animated: Bool) {
        //MARK:- animate Swipe Hint -
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            debugPrint("Animations Start")
            if self.myAdsTableView.visibleCells.count > 0 {
                let cell = self.myAdsTableView.visibleCells[0] as? JobsDashBoardTableViewCell
                cell?.animateSwipeHint()
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if self.isKind(of: JobDashBoardViewController.self){
            let touch = touches.first
            if touch?.view?.tag != 100{
                deleteAction()
            }

        }
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

    @IBAction func companyProfile_Pressed(_ sender: Any) {
        forcePresentViewController(viewController: self, storyBoardId: "CompanyProfileViewController")
    }
    //MARK:-Private Functions-
    private func setupDelegates(){
        myAdsTableView.delegate=self
        myAdsTableView.dataSource=self

    }
    @IBAction func back_Pressed(_ sender: Any) {
        dismiss(animated: true) {
            clearViewData(controller: self)
        }
    }
    
    
    private func registerXib(){

        let JobsNib = UINib(nibName: "JobsDashBoardTableViewCell", bundle: nil)
        myAdsTableView.register(JobsNib, forCellReuseIdentifier: "JobsDashBoardTableViewCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let itemsData:JobsDashBoardTableViewCell = tableView.dequeueReusableCell(withIdentifier: "JobsDashBoardTableViewCell", for: indexPath) as! JobsDashBoardTableViewCell
        itemsData.getMoreViewsButton.tag=indexPath.row
        itemsData.getMoreViewsButton.addTarget(self, action: #selector(getMoreViewsAction(sender:)), for: .touchUpInside)
        return itemsData
    }
    @objc func getMoreViewsAction(sender:UIButton){
        forcePresentViewController(viewController: self, storyBoardId: "GetMoreViewsViewController")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 160
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [
            makeDeleteContextualAction(forRowAt: indexPath)
        ])

    }


      func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let statistics = UIContextualAction(style: .normal, title: "Statistics") { action, view, completion in
            debugPrint("statistics Action")
            // Your swipe action code!
            
            forcePresentViewController(viewController: self,storyBoardId: "StatisticsViewController")
            
        }
        statistics.backgroundColor=#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        let statisticsLabel = UILabel()
        statisticsLabel.text = Statics.icons.statistics_icon
        statisticsLabel.font = UIFont(name: "FontAwesome5Pro-Regular", size: 15)
        statisticsLabel.textColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        statisticsLabel.sizeToFit()
        statistics.image = UIImage(view: statisticsLabel)
      
        let edit = UIContextualAction(style: .normal, title: "Edit") { action, view, completion in
            debugPrint("Edit Action")
            forcePresentViewController(viewController: self, storyBoardId: "EditAdViewController")
        }
        edit.backgroundColor=#colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1)
        let editLabel = UILabel()
        editLabel.text = Statics.icons.edit_icon //// Your swipe action text!
        editLabel.textColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        editLabel.font = UIFont(name: "FontAwesome5Pro-Regular", size: 15)
        editLabel.sizeToFit()
        edit.image = UIImage(view: editLabel)

        return UISwipeActionsConfiguration(actions: [edit,statistics])
      }

      //MARK: - Contextual Actions
    private func makeDeleteContextualAction(forRowAt indexPath: IndexPath) -> UIContextualAction {
        return UIContextualAction(style: .destructive, title: "Delete") { (action, swipeButtonView, completion) in
            print("DELETE HERE")
            self.registerDeleteView()

            completion(true)
        }
    }
    
    func registerDeleteView(){
        registerBackView(c: self)
        let deleteAdView: DeleteAdView = {
            let v = DeleteAdView()
            // view.backgroundColor = .white
            v.addShadowToView()
            v.translatesAutoresizingMaskIntoConstraints = false
            return v
        }()
        
        view.addSubview(deleteAdView)
        deleteAdView.tag=100
        deleteAdView.setVC(viewController: self)
        deleteAdView.continueButton.addTarget(self, action: #selector(deleteAction), for: .touchUpInside)
        deleteAdView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive=true
        deleteAdView.heightAnchor.constraint(equalToConstant: 325).isActive=true
        //(equalTo: c.view.heightAnchor, multiplier: 0.35).isActive=true
        deleteAdView.centerXAnchor.constraint(equalTo:  view.centerXAnchor).isActive=true
        deleteAdView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive=true
        
    }

}
