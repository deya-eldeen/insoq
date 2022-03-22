//
//  ViewPlateViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 15/06/2021.
//

import UIKit
import DropDown

class ViewPlateViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    @IBOutlet weak var plateImagesCollectionView: UICollectionView!
    
    @IBOutlet weak var modelButton: NiceButton!
    @IBOutlet weak var brandButton: NiceButton!
    
    let brandDropDown = DropDown()
    let modelDropDown = DropDown()
    var timer = Timer()
    var counter:Int=0
    var images:[UIImage]=[UIImage(named: "Plate")!,UIImage(named: "dubai_plate")!]
    
    lazy var dropDowns: [DropDown] = {
        return [
            self.brandDropDown,
            self.modelDropDown,
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBrandDropDown()
        modelButton.addTarget(self, action: #selector(modelAction), for: .touchUpInside)
        brandButton.addTarget(self, action: #selector(brandAction), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        registerCell()
        setDelegates()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    @IBAction func back_Pressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func brandAction (){
        brandDropDown.show()
    }
    @objc func modelAction (){
        modelDropDown.show()
    }
    private func setDelegates(){
        plateImagesCollectionView.delegate=self
        plateImagesCollectionView.dataSource=self
    }
    private func registerCell(){
        let imagesNib = UINib(nibName: "ViewOnCarCollectionViewCell", bundle: nil)
        
        plateImagesCollectionView.register(imagesNib, forCellWithReuseIdentifier: "ViewOnCarCollectionViewCell")
        
    }
    private func setupBrandDropDown() {
        brandDropDown.anchorView = brandButton
        modelDropDown.anchorView = modelButton
        
        brandDropDown.bottomOffset = CGPoint(x: 0, y: brandButton.bounds.height)
        modelDropDown.bottomOffset = CGPoint(x: 0, y: brandButton.bounds.height)
        
        brandDropDown.dataSource = [
            "BMW",
            "KIA",
            "Honda",
            "Brand-A",
            "Brand-B",
            "BMW",
            "KIA",
            "Honda",
            "Brand-A",
            "Brand-B",
            "KIA",
            "Honda",
            "Brand-A",
            "Brand-B",
            "BMW",
            "KIA",
            "Honda",
            "Brand-A",
            "Brand-B",
            "Brand-C"
        ]
        
        modelDropDown.dataSource = [
            "i 3",
            "i 8",
            "x 5",
            "x 6",
            "230 i",
        ]
        
        // Action triggered on selection
        brandDropDown.selectionAction = { [weak self] (index, item) in
            self?.brandButton.setTitle(" \(item)", for: .normal)
        }
        // Action triggered on selection
        modelDropDown.selectionAction = { [weak self] (index, item) in
            self?.modelButton.setTitle(" \(item)", for: .normal)
        }
    }
    
    //MARK:collection view manager
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ViewOnCarCollectionViewCell", for: indexPath) as! ViewOnCarCollectionViewCell
        cell.setImagesData(data: images[indexPath.row])
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let imagecell = self.plateImagesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        imagecell.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        imagecell.minimumInteritemSpacing = 0
        imagecell.itemSize = CGSize(width:( Int(self.plateImagesCollectionView.frame.size.width)), height: Int(plateImagesCollectionView.frame.height/2.5))
        plateImagesCollectionView.reloadData()
        return imagecell.itemSize
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
