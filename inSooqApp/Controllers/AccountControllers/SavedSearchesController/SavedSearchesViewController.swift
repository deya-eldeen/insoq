//
//  SavedSearchesViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 06/04/2021.
//

import UIKit

class SavedSearchesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var topBar: TopNavigationbar!
    @IBOutlet weak var bottomBar: BottomBar!
    @IBOutlet weak var savedSearchesTableView: UITableView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    var index:Int=0
    var sliderOn:Bool=true

    override func viewDidLoad() {
        super.viewDidLoad()
        bottomBar.setVC(viewController: self)
        topBar.setVC(viewController: self)
        registerXib()
    }
    override func viewWillAppear(_ animated: Bool) {
        setupDelegates()
    }
    @IBAction func back_Pressed(_ sender: Any)
    {
        dismiss(animated: true) {
            clearViewData(controller: self)
        }
    }
    

    //MARK:-Private Functions-
    private func setupDelegates(){
        categoriesCollectionView.delegate=self
        categoriesCollectionView.dataSource=self
        savedSearchesTableView.delegate=self
        savedSearchesTableView.dataSource=self

    }
    
    private func registerXib(){
        let savedSearchesNib = UINib(nibName: "SavedSearchesTableViewCell", bundle: nil)
        savedSearchesTableView.register(savedSearchesNib, forCellReuseIdentifier: "SavedSearchesTableViewCell")
        }
    //MARK:-Table view delegate, data source-
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SavedSearchesTableViewCell", for: indexPath) as! SavedSearchesTableViewCell
        cell.goButton.tag=indexPath.row
        cell.goButton.addTarget(self, action: #selector(goAction(sender:)), for: .touchUpInside)
        cell.sliderButton.tag=indexPath.row
        cell.sliderButton.addTarget(self, action: #selector(setAlert(sender:)), for: .touchUpInside)
        return cell
    }

    @objc func goAction(sender:UIButton){
        SubCategoriesViewController.subCategoryObject.name = Statics.categoyModel[sender.tag].categoryName
        debugPrint("subCategoriesTableView-vcTitle",Statics.categoyModel[sender.tag].categoryName)
    forcePresentViewController(viewController: self, storyBoardId: "SubCategoriesViewController")
        
    }
    @objc func setAlert(sender:UIButton){
        let cell = savedSearchesTableView.dequeueReusableCell(withIdentifier: "SavedSearchesTableViewCell", for: IndexPath(row: sender.tag, section: 0)) as! SavedSearchesTableViewCell
        if sliderOn{
            cell.sliderButton.setImage(#imageLiteral(resourceName: "Image"), for: .normal)
        }
        else
        {
            cell.sliderButton.setImage(#imageLiteral(resourceName: "sliderOff"), for: .normal)
        }
        sliderOn = !sliderOn
        savedSearchesTableView.reloadData()
        
        debugPrint("ss",sender.tag)
        
    }

}

extension SavedSearchesViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Statics.favoModel.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
        cell.setCategoriesData(data: Statics.favoModel[indexPath.row])
      //  cell.contentView.layer.cornerRadius=cell.contentView.frame.height/2
        if indexPath.row==0{
            cell.coloredView.backgroundColor=#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
            cell.coloredView.layer.cornerRadius=cell.coloredView.frame.height/2
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint("Selected indexPath = ", indexPath.item)
        debugPrint("Property selected")
        //fitch This data from Selecteed Object
        //categoriesCollectionView.cellForItemAt(indexPath.row)
         index=indexPath.row
        savedSearchesTableView.reloadData()
            //Reload Table View Data
           /// didselect index == 0  : reload uitableVie wwith All cells Type else reload depending on Category...
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let layout = self.categoriesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: Int((categoriesCollectionView.frame.width-10)/5), height: 110 )
        debugPrint("MyFavoCells:=",layout.itemSize.height,layout.itemSize.width)
        return layout.itemSize
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
 
}
