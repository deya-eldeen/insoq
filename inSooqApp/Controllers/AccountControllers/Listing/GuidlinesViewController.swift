//
//  GuidlinesViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 06/04/2021.
//

import UIKit
import AVFoundation

class GuidlinesViewController: UIViewController {
    @IBOutlet weak var topBar: TopNavigationbar!
    @IBOutlet weak var bottomBar: BottomBar!
    @IBOutlet weak var avPlayerViewHConstraint: NSLayoutConstraint!
    @IBOutlet weak var pauseImage: UIImageView!
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var avPlayerView: UIView!
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    
    @IBOutlet weak var showVedioView: UIView!
    override func viewDidLoad() {
        bottomBar.setVC(viewController: self)
        topBar.setVC(viewController: self)
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
    
    override func viewWillAppear(_ animated: Bool) {
        let playVedioGiusture = UITapGestureRecognizer(target: self, action: #selector(playVedio))
        showVedioView.addGestureRecognizer(playVedioGiusture)

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
    
}
