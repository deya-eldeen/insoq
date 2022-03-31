//
//  ListViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 11/02/2021.
//

import UIKit

class ChatViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

//    @IBOutlet weak var topBar: MainNavView!
    @IBOutlet weak var chatTableView: UITableView!
    private var lastContentOffset: CGFloat = 0
    @IBOutlet weak var hiddenButton: UIButton!
    @IBOutlet weak var tabbarBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var tabBarView: BottomView!
    let testHeaders:[String]=["Active Chats", "Archive Chats"]
    override func viewDidLoad() {
        super.viewDidLoad()
   //     topBar.setVC(viewController: self)
        tabBarView.setVC(viewController: self)
        registerXib()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        chatTableView.delegate=self
        chatTableView.dataSource=self
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    
    private func registerXib(){
        let chatNib = UINib(nibName: "ConversationCell", bundle: nil)
        chatTableView.register(chatNib, forCellReuseIdentifier: "ConversationCell")
        
        let xib = UINib(nibName: "ChatsTableViewHeader", bundle: nil)
        chatTableView.register(xib, forHeaderFooterViewReuseIdentifier: "ChatsTableViewHeader")
        chatTableView.sectionHeaderHeight=25
        chatTableView.estimatedSectionHeaderHeight=25
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConversationCell", for: indexPath ) as! ConversationCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showAlertDeprecated(controller: self, message: "Comming Soon...", seconds: 0.5)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let header = self.chatTableView.dequeueReusableHeaderFooterView(withIdentifier: "ChatsTableViewHeader") as! ChatsTableViewHeader
        header.setCustomHeaders(sectionTitle: testHeaders[section])
            return header
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return  testHeaders.count
    }


    //MARK: - Contextual Actions
  func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
      return UISwipeActionsConfiguration(actions: [
          makeDeleteContextualAction(forRowAt: indexPath)
      ])

  }
  private func makeDeleteContextualAction(forRowAt indexPath: IndexPath) -> UIContextualAction {
      return UIContextualAction(style: .destructive, title: "Delete") { (action, swipeButtonView, completion) in
          print("DELETE HERE")
        showAlertDeprecated(controller: self, message: "Comming Soon", seconds: 0.5)
          completion(true)
      }
  }
  

}
//MARK: Search Text field Delegate:-
//extension ChatViewController: UIScrollViewDelegate
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
//            changeTabBarHeight(height: -130, hidden: true)
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
//private func showAddButton(alpha:CGFloat,hidden:Bool){
//    hiddenButton.alpha=alpha
//    hiddenButton.isEnabled = !hidden
//    hiddenButton.isHidden=hidden
//    }
//
//}
