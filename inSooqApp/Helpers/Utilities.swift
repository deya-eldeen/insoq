//
//  Utilities.swift
//  ACIsamsung
//
//  Created by mohammad ahmad on 1/12/21.
//

import Foundation
import UIKit

public func EmailCheck(emailStr:String) -> Bool
{
   let emailsyntax = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
   
   let emailview = NSPredicate(format:"SELF MATCHES %@", emailsyntax)
   return emailview.evaluate(with: emailStr)
}

public func PhoneCheck(phone: String) -> Bool
{
   let phonesyntax = "^[0-9+]+[0-9]$"
   let phoneTest = NSPredicate(format: "SELF MATCHES %@", phonesyntax)
   return phoneTest.evaluate(with: phone)
}

public func PasswordCheck(password : String) -> Bool
{
    let passCheck = ".{6,}"
    let passTrue = NSPredicate(format: "SELF MATCHES %@", passCheck)
    return passTrue.evaluate(with: password)
}

func setNewRoot(storyBoardName : String , viewController: UIViewController )
{
    DispatchQueue.main.async{
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
       let vc = mainStoryboard.instantiateViewController(identifier: storyBoardName)
        UIApplication.shared.keyWindow?.rootViewController = vc
      //  viewController.navigationController?.present(vc, animated: true)


    }
}
public func clearViewData(controller:UIViewController)
{
    let v1 = controller.view
    
    if  v1?.subviews.count ?? 0 > 0
    {
        for vTemp in v1!.subviews
        {
            debugPrint("view is removed",vTemp)
            vTemp.removeFromSuperview()
            
        }
    }
    else
    {
        debugPrint("Mainview is removed",v1)
        v1?.removeFromSuperview()
        
    }
}

func printViewControllers(vc:UIViewController){
    ///
    var mapViewControllers = [String :UIViewController] ()
    if let vcNAvigationControllor =   vc.navigationController?.viewControllers{
        
        for controller in vcNAvigationControllor
        {
            let  keyString = String(controller.nibName!)
            
            debugPrint("keyString:",keyString)
            if let _vController =  mapViewControllers[keyString]
            {   debugPrint("keyString:",keyString)
                mapViewControllers[keyString] = _vController
                debugPrint("In-keyString:",keyString,"  \n _oDetailed",_vController)
            }
            else
            {
                mapViewControllers[keyString] = controller
                debugPrint("Out-keyString:",keyString,"  \n _oDetailed",controller)
                
            }
            print("view==", controller)
            print("keyString==", mapViewControllers[keyString])
        }
    }
    
}
//func removeAllVCsFromNav(vc:UIViewController,currentVCName:AnyClass){
//    var navArray : [UIViewController:String] = [:]
//    if var vcNAvigationControllor =   vc.navigationController?.viewControllers{
//        debugPrint("Befor vcNAvigationControllor",vcNAvigationControllor)
//
//        for (index,vc) in vcNAvigationControllor.enumerated() {
//            if currentVCName != HomeMapViewController.self{
//            if vc.isKind(of: HomeMapViewController.self) {
//                removeViewDataFromMemory(controller: vc, vcToClear: HomeMapViewController.self)
//
//            }
//                
//            }
//            else if !vc.isKind(of: currentVCName.self)
//            {
//                
//                debugPrint("setOneVC Vc name: ", vc)
//                if index >= 0 && index<vcNAvigationControllor.count{
//                    
//                    debugPrint("setOneVC clearing vc", vc)
//                    let v1 = vc.view
//                    
//                    if  v1?.subviews.count ?? 0 > 0
//                    {
//                        for vTemp in v1!.subviews
//                        {
//                            debugPrint("view is removed",vTemp)
//                            vTemp.removeFromSuperview()
//                            
//                        }
//                    }
//                    else
//                    {
//                        v1?.removeFromSuperview()
//                        
//                    }
//                    vcNAvigationControllor.remove(at: index)
//                    
//                }
//            }
//        }
//        debugPrint("Aftr vcNAvigationControllor",vcNAvigationControllor)
//    }
//}
public func removeViewDataFromMemory(controller : UIViewController, vcToClear:AnyClass)
{
    var vcContainer = [UIViewController]()
    debugPrint("vcContainer",vcContainer)
    if let vcNAvigationControllor =   controller.navigationController?.viewControllers{
    for vc in vcNAvigationControllor {
        if !vc.isKind(of: vcToClear.self)
        {
            vcContainer.append(vc)
        }
        else
        {
            let v1 = vc.view
            
            if  v1?.subviews.count ?? 0 > 0
            {
                for vTemp in v1!.subviews
                {
                    debugPrint("view is removed",vTemp)
                    vTemp.removeFromSuperview()
                    
                }
            }
            else
            {
                v1?.removeFromSuperview()
                
            }
        }
    }
    }
    
    controller.navigationController?.viewControllers = vcContainer
    let navigationController = UINavigationController(rootViewController: controller)
    navigationController.popToRootViewController(animated: true)
    debugPrint("vcContainer",vcContainer)

}
public func newRoot(NavId:String)
{

    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let tabController = mainStoryboard.instantiateViewController(identifier: NavId)
    UIApplication.shared.keyWindow?.rootViewController = tabController
}

public func pushtoViewController(viewController: UIViewController,storyBoardId: String,animate:Bool){
    let mainStoryboard = UIStoryboard(name: sbFromVC(vcID: storyBoardId), bundle: nil)
    let detailsVC = mainStoryboard.instantiateViewController(identifier: storyBoardId)
    viewController.navigationController?.pushViewController(detailsVC, animated: animate)
}

public func presentViewController(viewController: UIViewController,storyBoardId: String,animate:Bool){
    let mainStoryboard = UIStoryboard(name: sbFromVC(vcID: storyBoardId), bundle: nil)
    let detailsVC = mainStoryboard.instantiateViewController(identifier: storyBoardId)
    viewController.present(detailsVC, animated: true)
}

public func iPresentViewController(viewController: UIViewController,storyBoardId: String){
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
    let vc = mainStoryboard.instantiateViewController(identifier: storyBoardId)
    vc.modalPresentationStyle = .fullScreen
    viewController.navigationController?.present(vc, animated: false)
}



public func presentSubCategoryVC(viewController: UIViewController,endPoint: String , who: Int){
    let mainStoryboard = UIStoryboard(name: "Items", bundle: nil)
        
    let vc = mainStoryboard.instantiateViewController(identifier: "ItemsSubCategoryVC") as! ItemsSubCategoryVC
    vc.modalPresentationStyle = .fullScreen
    vc.who = who
    vc.endPointSub = endPoint
    viewController.present(vc, animated: false)
}
public func presentCategoryVC(viewController: UIViewController,endPoint: String){
    let mainStoryboard = UIStoryboard(name: "Items", bundle: nil)
        
    let vc = mainStoryboard.instantiateViewController(identifier: "ItemsCategoryVC") as! ItemsCategoryVC
    vc.modalPresentationStyle = .fullScreen
    vc.endPoint = endPoint
    viewController.present(vc, animated: false)
}

func sbFromVC(vcID: String) -> String {
    var sbID = "Main"
    
    let MetaVCIds = ["FAQViewController", "ContactViewController", "Terms_PrivacyViewController", "GuidlinesViewController", "HowItWorksViewController"]
    
    let UserVCIds = ["ForgetPasswordViewController", "OTPViewController", "SignUpViewController", "SignUp_PhoneViewController"]
    
    let AccountVCIds = ["AccountViewController", "AdvertisingViewController", "MyFavoritesViewController", "MyAdsViewController", "SavedSearchesViewController", "JobDashBoardViewController", "CompanyProfileViewController", "GetMoreViewsViewController", "StatisticsViewController", "MyProfileViewController"]

    let AddingVCIds = ["AddViewControllerNav", "AddViewController", "Add_CategoryViewController", "Add_TitleViewController", "Add_BrandViewController", "Add_FullSpecesViewController", "AdPackageViewController", "CardDetailsViewController"]
    
    let ItemsVCIds = ["ItemsCategoryVC", "ItemsSubCategoryVC", "ItemDetailsCollectionViewController"]
    
    let MiscVCIds = ["ChatViewController", "NotificationsViewController", "AgencyViewController", "EditAdViewController"]
    
    if MetaVCIds.contains(vcID) {
        sbID = "Meta"
    }
    
    if UserVCIds.contains(vcID) {
        sbID = "User"
    }
    
    if AccountVCIds.contains(vcID) {
        sbID = "Account"
    }
    
    if AddingVCIds.contains(vcID) {
        sbID = "Adding"
    }
    
    if ItemsVCIds.contains(vcID) {
        sbID = "Items"
    }
    
    if MiscVCIds.contains(vcID) {
        sbID = "Misc"
    }
    
    return sbID
}

public func forcePresentViewController(viewController: UIViewController,storyBoardId: String){
    
    let mainStoryboard = UIStoryboard(name: sbFromVC(vcID: storyBoardId), bundle: nil)
        
    let vc = mainStoryboard.instantiateViewController(identifier: storyBoardId)
    vc.modalPresentationStyle = .fullScreen
    viewController.present(vc, animated: false)
}

public func presentDetailsVC(viewController: UIViewController, catIndex: Int , subCatIndex: Int , data: Any){
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
    let vc = mainStoryboard.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
    
    //vc.modalPresentationStyle = .automatic
    //vc.data = data
    //vc.selectedCategory = catIndex
    //vc.jobSubCategoryIndex = subCatIndex
    
    viewController.present(vc, animated: true)
}
//HomeViewController
//AddViewControllerNav
public func NavPresentViewController(viewController: UIViewController,storyBoardId: String){
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
    let vc = mainStoryboard.instantiateViewController(identifier: storyBoardId)
    vc.modalPresentationStyle = .fullScreen
    viewController.present(vc, animated: false)
}

public func forcePresentViewController(viewController: UIViewController,storyBoardId: String,list:[String]){
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
    let vc:OTPViewController = mainStoryboard.instantiateViewController(identifier: storyBoardId)
    vc.modalPresentationStyle = .fullScreen
    vc.setListData(listDate: list)
    viewController.present(vc, animated: false)
}
//public func popToViewController(viewController: UIViewController,storyBoardId: String){
//    //MARK:-Adjust -MainTabsViewController- is deleted
//    for controller in viewController.navigationController!.viewControllers as Array {
//        if ((viewController.isKind(of: MainTabsViewController.self))){
//            if let vcMainControllor:MainTabsViewController = viewController as? MainTabsViewController{
//                vcMainControllor.navigationController!.popToViewController(controller, animated: true)
//                break
//            }
//
//        }
//    }
//}

func addVCToNavigationStack(viewController:UIViewController,viewControllerName:AnyClass)
{
    var vcContainer = [UIViewController]()
    if let vcNAvigationControllor =  viewController.navigationController?.viewControllers{
    for vc in vcNAvigationControllor {
        debugPrint("vcNAvigationControllor",vc)
        if !vc.isKind(of: viewControllerName.self)
        {
            vcContainer.append(vc)
        }
        viewController.navigationController?.viewControllers = vcContainer
        }
    }
}
func removeVCFromNavigationStack(viewController:UIViewController,viewControllerName:AnyClass)
{
    var vcContainer = [UIViewController]()
    if let vcNAvigationControllor =  viewController.navigationController?.viewControllers{
        debugPrint("vcContainer: ",vcContainer)
        for (index,vc) in vcNAvigationControllor.enumerated() {
            debugPrint("vcName: ",vc)
            debugPrint("vcContainer: ",viewController.navigationController?.viewControllers.count)
        if !vc.isKind(of: viewControllerName.self)
        {
            viewController.navigationController?.viewControllers.remove(at: index)
          //  vcContainer.remove(at: index)
        }else{
           // vcContainer.append(vc)
        }
       // viewController.navigationController?.viewControllers = vcContainer
            UIApplication.shared.keyWindow?.rootViewController = viewController
            debugPrint("vcContainer2: ",viewController.navigationController?.viewControllers.count)

        }
    }
}


func removeAllVCsFromNav(vc:UIViewController,currentVCName:AnyClass){
    var navArray : [UIViewController:String] = [:]
    if var vcNAvigationControllor =   vc.navigationController?.viewControllers{
        debugPrint("Befor vcNAvigationControllor",vcNAvigationControllor)

        for (index,vc) in vcNAvigationControllor.enumerated() {
             if !vc.isKind(of: currentVCName.self)
            {
                
                debugPrint("setOneVC Vc name: ", vc)
                if index >= 0 && index<vcNAvigationControllor.count{
                    
                    debugPrint("setOneVC clearing vc", vc)
                    let v1 = vc.view
                    
                    if  v1?.subviews.count ?? 0 > 0
                    {
                        for vTemp in v1!.subviews
                        {
                            debugPrint("view is removed",vTemp)
                            vTemp.removeFromSuperview()
                            
                        }
                    }
                    else
                    {
                        v1?.removeFromSuperview()
                        
                    }
                    vcNAvigationControllor.remove(at: index)
                    
                }
            }
        }
        debugPrint("Aftr vcNAvigationControllor",vcNAvigationControllor)
    }
}
