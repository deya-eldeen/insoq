//
//  PropertiesGridCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 18/05/2021.
//

import UIKit

class PropertiesGridCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imagesCollectionView: UICollectionView!
    @IBOutlet weak var imagesPageController: UIPageControl!
    var images=[UIImage]()
    var counter:Int=0
    var index:Int=0

    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var itemDateLabel: UILabel!
    @IBOutlet weak var itemSqFtLabel: UILabel!
    @IBOutlet weak var ItemRoomsLabel: UILabel!
    @IBOutlet weak var itemBathLabel: UILabel!
    
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemLocationLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!

    var swipeHintDistance:CGFloat=20
    var _isFavo:Bool=true

    override func awakeFromNib() {
        super.awakeFromNib()
        let cellNib = UINib(nibName: "SilderImagesCollectionViewCell", bundle: nil)
        self.imagesCollectionView.register(cellNib, forCellWithReuseIdentifier: "SilderImagesCollectionViewCell")
        // Comment if you set Datasource and delegate in .xib
        self.imagesCollectionView.dataSource = self
        self.imagesCollectionView.delegate = self
        //Design
        mainView.layer.cornerRadius=5
        imagesCollectionView.clipsToBounds=true
        mainView.addShadowToView()
    }
    
    override func layoutSubviews() {
        imagesCollectionView.clipsToBounds=true
    }
    
    @IBAction func favo_Pressed(_ sender: Any) {
        if _isFavo{
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            favoriteButton.tintColor=#colorLiteral(red: 1, green: 0.262745098, blue: 0.2235294118, alpha: 1)

        }else{
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            favoriteButton.tintColor=#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
        _isFavo = !_isFavo
        
    }

    func setViewData(propertyObject:PropertyModel){
        itemDateLabel.text=propertyObject.itemDate
        itemSqFtLabel.text=propertyObject.itemSqFtLabel
        ItemRoomsLabel.text=propertyObject.ItemRoomsLabel
        itemPriceLabel.text=propertyObject.itemPriceLabel
        itemBathLabel.text=propertyObject.itemWcLabel
        itemLocationLabel.text=propertyObject.itemLocationLabel
        itemNameLabel.text=propertyObject.itemNameLabel
        self.images=propertyObject.itemImages
        imagesPageController.numberOfPages=images.count

    }

    func reloadCollectionView() -> Void {
        self.imagesCollectionView.reloadData()
    }

    
}

extension PropertiesGridCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return images.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   let cell = imagesCollectionView.dequeueReusableCell(withReuseIdentifier: "SilderImagesCollectionViewCell", for: indexPath) as! SilderImagesCollectionViewCell
    cell.setSlider(image: images[indexPath.row])
    cell.sliderImage.roundCorner(corners: [.topLeft,.topRight], radius: 5)
    counter=indexPath.row
    return  cell
}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let layout = self.imagesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: Int((imagesCollectionView.frame.width)), height: Int((imagesCollectionView.frame.height)) )
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
//    func animateSwipeHint() {
//        slideInFromRight()
//    }
//
//    private func slideInFromRight() {
//        UIView.animate(withDuration: 0.5, delay: 0.3, options: [.curveEaseOut], animations: {
//            self.mainView.transform = CGAffineTransform(translationX: -self.swipeHintDistance, y: 0)
//            self.mainView.layer.cornerRadius = 10
//        }) { (success) in
//            UIView.animate(withDuration: 0.2, delay: 0, options: [.curveLinear], animations: {
//                self.mainView.transform = .identity
//            }, completion: { (success) in
//                // Slide from left if you have leading swipe actions
//                self.slideInFromLeft()
//            })
//        }
//    }
//
//    private func slideInFromLeft() {
//        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
//            self.mainView.transform = CGAffineTransform(translationX: self.swipeHintDistance, y: 0)
//        }) { (success) in
//            UIView.animate(withDuration: 0.2, delay: 0, options: [.curveLinear], animations: {
//                self.mainView.transform = .identity
//            })
//        }
//    }
//
}



