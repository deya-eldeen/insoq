//
//  MyAdsMotorsTableViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 18/04/2021.
//

import UIKit

class MyAdsMotorsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var isLiveLabel: UILabel!
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var serviceTitle: UILabel!
    @IBOutlet weak var servicePrice: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var getMoreViewsButton: UIButton!
    @IBOutlet weak var imagesPageController: UIPageControl!
  
    var swipeHintDistance:CGFloat = 30

    @IBOutlet weak var mainView: UIView!
    var images=[UIImage]()
    var counter:Int=0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        objectCornerRadius(object: mainView, cornerRadius: 5)
        ///mainView.addShadowToView()

        // Register the xib for collection view cell
        let cellNib = UINib(nibName: "SilderImagesCollectionViewCell", bundle: nil)
        self.imagesCollectionView.register(cellNib, forCellWithReuseIdentifier: "SilderImagesCollectionViewCell")
        // Comment if you set Datasource and delegate in .xib
        self.imagesCollectionView.dataSource = self
        self.imagesCollectionView.delegate = self

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func animateSwipeHint() {
        slideInFromRight()
    }

    private func slideInFromRight() {
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [.curveEaseOut], animations: {
            //if we add - :=> -self.swipeHintDistance well slideInFromRight
            ///but for now leave it slideInFromLeft x2 cuz we have no buttons left
            self.mainView.transform = CGAffineTransform(translationX: -self.swipeHintDistance/2, y: 0)
            self.mainView.layer.cornerRadius = 10
        }) { (success) in
            UIView.animate(withDuration: 0.2, delay: 0, options: [.curveLinear], animations: {
                self.mainView.transform = .identity
            }, completion: { (success) in
                // Slide from left if you have leading swipe actions
                self.slideInFromLeft()
            })
        }
    }

    private func slideInFromLeft() {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
            self.mainView.transform = CGAffineTransform(translationX: self.swipeHintDistance/3, y: 0)
        }) { (success) in
            UIView.animate(withDuration: 0.2, delay: 0, options: [.curveLinear], animations: {
                self.mainView.transform = .identity
            })
        }
    }


}
extension MyAdsMotorsTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return images.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   let cell = imagesCollectionView.dequeueReusableCell(withReuseIdentifier: "SilderImagesCollectionViewCell", for: indexPath) as! SilderImagesCollectionViewCell
    cell.setSlider(image: images[indexPath.row])
    cell.sliderImage.roundCorner(corners: [.bottomLeft,.topLeft], radius: 5)

    counter=indexPath.row
    return  cell
}

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let layout = self.imagesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: Int((imagesCollectionView.width)), height: Int((imagesCollectionView.height)) )
        return layout.itemSize

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint("collectionView-indexPath",indexPath.row)
    }
    
    //Auto scroll collectionview
    @objc func changeImage() {

        if counter < Statics.adsArray.count {
            let index = IndexPath.init(item: counter, section: 0)
            if let rect = self.imagesCollectionView.layoutAttributesForItem(at: index)?.frame{
                self.imagesCollectionView.scrollRectToVisible(rect, animated: true)}
            imagesPageController.currentPage = counter
            counter += 1
        }
        else
        {
            counter = 0
            let index = IndexPath(item: counter, section: 0)
            if let rect = self.imagesCollectionView.layoutAttributesForItem(at: index)?.frame{
                self.imagesCollectionView.scrollRectToVisible(rect, animated: true)}
            imagesPageController.currentPage = counter
            counter = 1
        }

    }
    
    }
