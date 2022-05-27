//
//  SignInViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 01/04/2021.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var switchLanguage_Button: UIButton!
    @IBOutlet weak var signin_Button: UIButton!
//    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var register_Button: UIButton!
//    @IBOutlet weak var sliderCollectionView: UICollectionView!
    var counter:Int = 0
    var timer = Timer()
    var indexPath:Int = 0
    var titles:[String]=["Lorem Ipsum is simply dummy text of the printing and typesetting","industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,","Lorem Ipsum has been the industry's standard dummy"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground(view: view, colorTop: #colorLiteral(red: 0.5490196078, green: 0.3882352941, blue: 0.9058823529, alpha: 1), colorBottom: #colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1))
        setDesign()
        setTapGesture()
        setTimers()
//        sliderCollectionView.delegate=self
//        sliderCollectionView.dataSource=self
        

    }
    //MARK:-Private Methods-
    
    private func setDesign(){
        textLine(object: switchLanguage_Button)
        objectCornerRadius(object: signin_Button, cornerRadius: signin_Button.height/2)
        objectCornerRadius(object: register_Button, cornerRadius: register_Button.height/2)
       // self.pageController.numberOfPages = titles.count
    }
    private func setTimers(){
        DispatchQueue.main.async {
            //  if !Statics.adsArray.isEmpty{
            self.timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
            // }
        }
    }
private func setTapGesture(){
    register_Button.addTarget(self, action: #selector(self.registerAction), for: .touchUpInside)
    signin_Button.addTarget(self, action: #selector(self.signinAction), for: .touchUpInside)
    switchLanguage_Button.addTarget(self, action: #selector(self.switchLanguageAction), for: .touchUpInside)

}
    
    @objc func registerAction(){
        presentViewController(viewController: self, storyBoardId: "SignUpViewController", animate: true)
    }
    
    @objc func signinAction(){
//       newRoot(NavId: "MainNav")
        //pushtoViewController(viewController: self, storyBoardId: "SigninMethodsViewController", animate: true)

        
    }
    
    @objc func switchLanguageAction(){
        
    }
    //Auto scroll collectionview
    @objc func changeImage() {
        
        if counter < titles.count {
            let index = IndexPath.init(item: counter, section: 0)
//            if let rect = self.sliderCollectionView.layoutAttributesForItem(at: index)?.frame{
                //self.sliderCollectionView.scrollRectToVisible(rect, animated: true)}
           // pageController.currentPage = counter
            counter += 1
        }
        else
        {
            counter = 0
            let index = IndexPath(item: counter, section: 0)
//            if let rect = self.sliderCollectionView.layoutAttributesForItem(at: index)?.frame{
                //self.sliderCollectionView.scrollRectToVisible(rect, animated: true)}
            //pageController.currentPage = counter
            counter = 1
        }
        
    }
}

//MARK:-CollectionView Controllers-
//extension SignInViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            return titles.count
//        }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let adsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as! SliderCollectionViewCell
//        adsCell.setData(title: titles[indexPath.row])
//        return adsCell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let layout = self.sliderCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.sectionInset = UIEdgeInsets(top: 5, left: 2, bottom: 5, right: 2)
//        layout.minimumInteritemSpacing = 2
//        layout.itemSize = CGSize(width: Int(sliderCollectionView.frame.width-20), height: Int(sliderCollectionView.frame.height-20) )
//        return layout.itemSize
//    }
////
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
////        return 0
////    }
//
//}
