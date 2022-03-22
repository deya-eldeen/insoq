//
//  AdPackageViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 13/04/2021.
//

import UIKit

class AdPackageViewController: UIViewController{

    @IBOutlet weak var silverButton: UIButton!

    @IBOutlet weak var segmentView: UIView!
    @IBOutlet weak var bottomBar: BottomBar!
    @IBOutlet weak var packageView: UIView!
 //   @IBOutlet weak var segmentCollectionView: UICollectionView!
    var isSelected = true

    @IBOutlet var segmentsButtons: [UIButton]!
    var adPackge:[String]=["Silver","Gold","Platinum"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomBar.setVC(viewController: self)
        registerPackageView(index:0)
        selectSegment(index:0)

    }

    override func viewWillAppear(_ animated: Bool) {
        setDesign()
    }
    @IBAction func back_Pressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func silverPackage_Pressed(_ sender: Any) {
      //  registerPackageView(index:0)
        selectSegment(index: 0)
    }
    @IBAction func goldPackage_Pressed(_ sender: Any) {
        selectSegment(index: 1)
    }
    
    @IBAction func platinuemPackage_Pressed(_ sender: Any) {
        selectSegment(index: 2)
    }
    @IBAction func continue_Pressed(_ sender: Any) {
        performSegue(withIdentifier: "toCardInfoSegue", sender: nil)
    }
    
    private func registerPackageView(index:Int){
        let v1 = packageView
        
        if  v1?.subviews.count ?? 0 > 0
        {
            for vTemp in v1!.subviews
            {
                debugPrint("view is removed",vTemp)
                vTemp.removeFromSuperview()
                
            }
        }
        
        let package: SilverPackageView = {
            let view = SilverPackageView()
            // view.backgroundColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        packageView.addSubview(package)
        switch index {
        case 0:
            package.setViewData(vTitle: "Silver", vPrice: "20.00")
            break
        case 1:
            package.setViewData(vTitle: "Gold", vPrice: "23.00")
            break
        case 2:
            package.setViewData(vTitle: "Platinum", vPrice: "25.00")
            break
        default:
            debugPrint("none")
        }
        package.widthAnchor.constraint(equalTo: packageView.widthAnchor, multiplier: 1).isActive=true
        package.heightAnchor.constraint(equalTo: packageView.heightAnchor, multiplier: 1).isActive=true
        package.centerXAnchor.constraint(equalTo: packageView.centerXAnchor).isActive=true
        package.centerYAnchor.constraint(equalTo: packageView.centerYAnchor).isActive=true
    }
    private func selectSegment(index: Int){
        registerPackageView(index: index)
        switch  index {
        case 0:
            debugPrint(index)
            self.segmentsButtons[0].backgroundColor =  #colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1)
            self.segmentsButtons[0].setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            self.segmentsButtons[1].backgroundColor = .clear
            self.segmentsButtons[1].setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
            self.segmentsButtons[2].backgroundColor = .clear
            self.segmentsButtons[2].setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)


            break
        case 1:
            debugPrint(index)
            self.segmentsButtons[1].backgroundColor =  #colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1)
            self.segmentsButtons[1].setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            self.segmentsButtons[0].backgroundColor = .clear
            self.segmentsButtons[0].setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
            self.segmentsButtons[2].backgroundColor = .clear
            self.segmentsButtons[2].setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)


            break
        case 2:
            debugPrint(index)
            self.segmentsButtons[2].backgroundColor =  #colorLiteral(red: 0.3411764706, green: 0.2745098039, blue: 0.9882352941, alpha: 1)
            self.segmentsButtons[2].setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            self.segmentsButtons[0].backgroundColor = .clear
            self.segmentsButtons[0].setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
            self.segmentsButtons[1].backgroundColor = .clear
            self.segmentsButtons[1].setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
            break
        default:
            debugPrint("None")
        }
    }
    private func setDesign(){
        objectCornerRadius(object: silverButton, cornerRadius: silverButton.height/2)
        objectCornerRadius(object: segmentView, cornerRadius: segmentView.height/2)
        segmentView.addShadowToView()
        objectCornerRadius(object: packageView, cornerRadius: 5)
        packageView.addShadowToView()
        silverButton.addShadowToView()
        for b in segmentsButtons{
            objectCornerRadius(object: b, cornerRadius: b.height/2)
        }
    }
    
}

//    private func setDelegates(){
//        segmentCollectionView.delegate=self
//        segmentCollectionView.dataSource=self
//    }
//    private func registerXib(){
//        let  locationNib = UINib(nibName: "SegmentsCollectionViewCell", bundle: nil)
//        segmentCollectionView.register(locationNib, forCellWithReuseIdentifier: "SegmentsCollectionViewCell")
//    }


//extension AdPackageViewController:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return adPackge.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SegmentsCollectionViewCell", for: indexPath) as! SegmentsCollectionViewCell
//        cell.setTitle(title: adPackge[indexPath.row])
//        return cell
//
//
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let layout = self.segmentCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.sectionInset = UIEdgeInsets(top:0, left: 0, bottom: 0, right: 0)
//        layout.minimumInteritemSpacing = 0
//        layout.itemSize = CGSize(width: Int((segmentCollectionView.frame.width)/3), height: 45 )
//        debugPrint("item.width",layout.itemSize.width)
//        return layout.itemSize
//    }
//
//}
