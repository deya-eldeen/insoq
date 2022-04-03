//
//  AddViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 24/02/2021.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var bottomBar: BottomBar!
    @IBOutlet weak var tag_icon: UILabel!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        bottomBar.setVC(viewController: self)
        setDesign()
        setDelegate()
    }
    
    private func setupNavigation() {
        title = "Sell an Item"
        let cancel = UIBarButtonItem(title: "cancel",  style: .plain, target: self, action: #selector(cancelButtonAction))
        navigationItem.rightBarButtonItem = cancel
        navigationItem.rightBarButtonItem?.tintColor = .red
    }
    
    @objc func cancelButtonAction() {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK:-Private functions
    private func setDesign(){
        labelFont(object: tag_icon, style: Statics.fontStyle.light, size: 30)
        tag_icon.text=Statics.icons.tag_icon
        tag_icon.textColor=#colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1)
    }

    private func setDelegate(){
        categoriesCollectionView.delegate=self
        categoriesCollectionView.dataSource=self
    }
    
}

//MARK:-CollectionView Controllers-
extension AddViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Statics.sellItemModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddItemCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
        cell.setCategoriesData(data: Statics.sellItemModel[indexPath.row])
        cell.coloredView.addShadowToView()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = Assembly.add_CategoryViewController(model: Statics.sellItemModel[indexPath.row])
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = self.categoriesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: Int((categoriesCollectionView.frame.width-10)/3), height: 110 )
        return layout.itemSize
    }
    
}
