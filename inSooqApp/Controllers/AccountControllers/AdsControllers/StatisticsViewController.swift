//
//  StatisticsViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 06/04/2021.
//

import UIKit

class StatisticsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var bottomBar: BottomBar!
    @IBOutlet weak var statisticsTableView: UITableView!
    @IBOutlet weak var fillterIcon: UIButton!
    var statisticsArray:[StatisticsModel]=[
        StatisticsModel(icon: Statics.icons.savedSearches_icon, title: "SEARCH", body: "Number of appearance \n in search", value: "08")
        ,StatisticsModel(icon: Statics.icons.eye_icon, title: "VISITORS", body: "Number Visitors", value: "18")
        ,StatisticsModel(icon: Statics.icons.chat_icon, title: "CHAT", body: "Number of people started \n in chat with you", value: "08")
        ,StatisticsModel(icon: Statics.icons.staticsContact_icon, title: "CONTACT NUMBER", body: "Number of people viewed \n contact number", value: "08")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomBar.setVC(viewController: self)
        fillterIcon.titleLabel?.font=UIFont(name: "FontAwesome5Pro-Regular", size: 25)
        fillterIcon.setTitle(Statics.icons.fillter_icon, for: .normal)
        fillterIcon.tintColor=#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)

    }
    override func viewWillAppear(_ animated: Bool) {
        setDelegates()
    }
    @IBAction func back_Pressed(_ sender: Any) {
        dismiss(animated: true) {
            clearViewData(controller: self)
        }
    }
    
    private func setDelegates(){
        statisticsTableView.delegate=self
        statisticsTableView.dataSource=self
    }
   //MARK:-Table View Delegates,DataSource-
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        statisticsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatisticsTableViewCell", for: indexPath) as! StatisticsTableViewCell
        cell.setStatisticsData(data:statisticsArray[indexPath.row])
return cell
    }
}
