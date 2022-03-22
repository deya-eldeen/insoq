//
//  ServiceRowCollectionViewCell.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 23/05/2021.
//

import UIKit

class ServiceRowCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var serviceTitle: UILabel!
    @IBOutlet weak var serviceLocation: UILabel!
    @IBOutlet weak var serviceDate: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var imagesPageController: UIPageControl!
    
    @IBOutlet weak var mainView: UIView!
    var images=[UIImage]()
    var imagesStr: [PictureModel] = []
    var counter:Int=0
    var _isFavo:Bool=false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Register the xib for collection view cell
        let cellNib = UINib(nibName: "SilderImagesCollectionViewCell", bundle: nil)
        self.imagesCollectionView.register(cellNib, forCellWithReuseIdentifier: "SilderImagesCollectionViewCell")
        // Comment if you set Datasource and delegate in .xib
        self.imagesCollectionView.dataSource = self
        self.imagesCollectionView.delegate = self
        mainView.layer.cornerRadius=5
        mainView.addShadowToView()


    }


    @IBAction func favo_Pressed(_ sender: Any)
    {
        if _isFavo{
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            favoriteButton.tintColor=#colorLiteral(red: 1, green: 0.262745098, blue: 0.2235294118, alpha: 1)

        }else{
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            favoriteButton.tintColor=#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
        _isFavo = !_isFavo
        
    }


}

extension ServiceRowCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if imagesStr.isEmpty {
        return images.count
    }else{
        return imagesStr.count
    }
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   let cell = imagesCollectionView.dequeueReusableCell(withReuseIdentifier: "SilderImagesCollectionViewCell", for: indexPath) as! SilderImagesCollectionViewCell
    if images.isEmpty{
        cell.setSlider(image: images[indexPath.row])
    }else{
        cell.setSlider(pics: imagesStr, index: 0)
    }
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
