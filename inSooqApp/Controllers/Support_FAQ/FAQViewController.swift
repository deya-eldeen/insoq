//
//  FAQViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 22/02/2021.
//

import UIKit
import AVFoundation


class FAQViewController: UIViewController{
    @IBOutlet weak var bottomView: BottomBar!
    @IBOutlet weak var searchTextField: UITextField!

    @IBOutlet weak var answerView: UIView!
    @IBOutlet weak var plusImage: UIImageView!
    
    @IBOutlet weak var avPlayerViewHConstraint: NSLayoutConstraint!
    @IBOutlet weak var pauseImage: UIImageView!
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var avPlayerView: UIView!
    @IBOutlet weak var showVedioView: UIView!

    var _isHidden:Bool=true
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        bottomView.setVC(viewController: self)
        setAvVedio()
    }
    override func viewWillAppear(_ animated: Bool) {
        let playVedioGiusture = UITapGestureRecognizer(target: self, action: #selector(playVedio))
        showVedioView.addGestureRecognizer(playVedioGiusture)

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        avPlayer.play()
//        paused = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //        avPlayer.play()
        //        paused = false
        avPlayer.pause()
        paused = true
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch=touches.first{
            if touch.view == backGroundView{
                hideCustomViews(hide: true)
                avPlayer.pause()
                UIView.animate(withDuration: 0.3) {
                    debugPrint("Expaned")
                    self.avPlayerView.alpha=0
                    self.pauseImage.isHidden=true

                }

            }else if touch.view==avPlayerView
            {
                if paused {
                    avPlayer.play()
                    pauseImage.isHidden=true
                }else{
                    avPlayer.pause()
                    pauseImage.isHidden=false
                }
                paused = !paused
            }
        }
    }
    @IBAction func showFirstButton(_ sender: Any) {
            answerView.isHidden = !_isHidden
        _isHidden = !_isHidden
        if plusImage.image==UIImage(systemName: "plus"){
            plusImage.image=UIImage(systemName: "minus")
        }else{
            plusImage.image=UIImage(systemName: "plus")
        }
    }
    private func setAvVedio(){
        let theURL = Bundle.main.url(forResource:"testVideo", withExtension: "mov")
        
        avPlayer = AVPlayer(url: theURL!)
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer.videoGravity = .resize
        avPlayer.volume = 100
        avPlayer.actionAtItemEnd = .none
        avPlayer.isMuted=false
        //adjust frame...
        avPlayerView.backgroundColor = .none
        avPlayerView.layer.insertSublayer(avPlayerLayer, at: 0)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: avPlayer.currentItem)

                

    }
    @objc func playVedio(){
        hideCustomViews(hide: false)
        avPlayer.play()
        paused = false
        

    }

    private func hideCustomViews(hide:Bool){
        backGroundView.isHidden=hide
        avPlayerView.isHidden=hide
        if hide{ avPlayerView.animateViewHeight(controller: self, height: 0, heightConstraint: avPlayerViewHConstraint)
            UIView.animate(withDuration: 0.3) {
                debugPrint("Expaned")
                self.avPlayerView.alpha=0
                self.pauseImage.isHidden=false
            }
        }
        else{
            avPlayerView.animateViewHeight(controller: self, height: (self.view.height/6), heightConstraint: avPlayerViewHConstraint)
            UIView.animate(withDuration: 1) {
                debugPrint("Expaned")
                self.avPlayerView.alpha=1
                self.pauseImage.isHidden=true

            }

        }
        avPlayerLayer.frame = CGRect(x: 0, y: 0, width: avPlayerView.frame.width , height: avPlayerView.frame.height)
        avPlayerLayer.layoutIfNeeded()

    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: .zero)
        avPlayer.pause()
        paused = true
//        hideCustomViews(hide: true)
    }

}
//class FAQViewController: UIViewController,UITableViewDataSource, UITableViewDelegate
//{
//
//    @IBOutlet weak var bottomView: BottomBar!
//    @IBOutlet weak var searchTextField: UITextField!
//
//    var hiddenSections = Set<Int>()
//    let tableViewData = [
//        ["Lorem ipsum dolor sit amet"],
//        ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc accumsan libero erat, vitae elementum justo iaculis vel. Cras lobortis, nulla vitae suscipit dapibus, diam leo fringilla quam, sit amet vehicula ex nibh et nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur Small text Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc accumsan libero erat, vitae elementum justo iaculis vel. Cras lobortis, nulla vitae suscipit dapibus"],
//        ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc accumsan libero erat, vitae elementum justo iaculis vel. Cras lobortis, nulla vitae suscipit dapibus, diam leo fringilla quam, sit amet vehicula ex nibh et nibh."],
//        ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc accumsan libero erat, vitae elementum justo iaculis vel. Cras lobortis, nulla vitae suscipit dapibus, diam leo fringilla quam, sit amet vehicula ex nibh et nibh."],
//        ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc accumsan libero erat, vitae elementum justo iaculis vel. Cras lobortis, nulla vitae suscipit dapibus, diam leo fringilla quam, sit amet vehicula ex nibh et nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur Small text Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc accumsan libero erat, vitae elementum justo iaculis vel. Cras lobortis, nulla vitae suscipit dapibus"],
//    ]
//
// //   let rowData:[String] =
//
//    @IBOutlet weak var tableView: UITableView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        bottomView.setVC(viewController: self)
//
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
//        setDesign()
//
//    }
//    override func viewDidDisappear(_ animated: Bool) {
//        //clearViewData(controller: self)
//    }
//    @IBAction func back_Pressed(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//    }
//    //MARK:-Private functions-
//
//    private func setDesign(){
//       addShadowView(object: searchTextField, cornerRadius: 5, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
//    }
//    //MARK:-TableView Controllers-
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return self.tableViewData.count
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if self.hiddenSections.contains(section) {
//            return 0
//        }
//
//        return self.tableViewData[section].count
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        40
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        cell.contentView.backgroundColor=UIColor(named: "AppBackground")
//        cell.textLabel?.text = self.tableViewData[indexPath.section][indexPath.row]
//        cell.textLabel?.numberOfLines=0
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let sectionButton = UIButton()
//        sectionButton.setTitle("Questions \(section)?",
//                               for: .normal)
//        sectionButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        bottomBorder(object: sectionButton)
//        //addShadowView(object: sectionButton, cornerRadius: 5, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
//        sectionButton.tag = section
//        sectionButton.addTarget(self,
//                                action: #selector(self.hideSection(sender:)),
//                                for: .touchUpInside)
//        sectionButton.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
//        return sectionButton
//    }
//
//    @objc
//    private func hideSection(sender: UIButton) {
//        let section = sender.tag
//
//        func indexPathsForSection() -> [IndexPath] {
//            var indexPaths = [IndexPath]()
//
//            for row in 0..<self.tableViewData[section].count {
//                indexPaths.append(IndexPath(row: row,
//                                            section: section))
//            }
//
//            return indexPaths
//        }
//
//        if self.hiddenSections.contains(section) {
//            self.hiddenSections.remove(section)
//            self.tableView.insertRows(at: indexPathsForSection(),
//                                      with: .fade)
//        } else {
//            self.hiddenSections.insert(section)
//            self.tableView.deleteRows(at: indexPathsForSection(),
//                                      with: .fade)
//        }
//    }
//
//}
extension UIViewController {
  func presentInFullScreen(_ viewController: UIViewController,
                           animated: Bool,
                           completion: (() -> Void)? = nil) {
    viewController.modalPresentationStyle = .fullScreen
    present(viewController, animated: animated, completion: completion)
  }
}
