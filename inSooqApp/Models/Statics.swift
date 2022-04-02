//
//  Statics.swift
//  ACIsamsung
//
//  Created by mohammad ahmad on 1/13/21.
//

import Foundation
import UIKit
//import JGProgressHUD
class Statics{
    static var _FirstTime=false
    static var languageCode = Locale.current.languageCode
    // static var spinner = JGProgressHUD(style: .extraLight)
    static var appLanguage:String="English"
    static var appCountry:String="UAE"
    static var defaults = UserDefaults.standard
    static var gms_Map_Key:String="AIzaSyCCgomJW6kN_FY5bSLyn6YQwrLC2fE-TrE"
    static var gms_Places_Key:String="AIzaSyDY0ClVrSLLoNwinz5FRqPQsIXxrUY2ayE"
    static var tabBarFlag:Int=0

    static var fontStyle=FontStyle()
    static  var icons=FontAwesomeIcons()
    
    //MARK: TEST DATA
    static var testOptionsArray:[OptionsModel]
        =
        [OptionsModel(title: "Feature your car for 30 days", price: "250", type: 2)
         ,OptionsModel(title: "Feature your car for 15 days", price: "200", type: 2),
         OptionsModel(title: "Feature your car for 30 days", price: "250", type: 2),
         OptionsModel(title: "Feature your car for 30 days", price: "250", type: 2)
         ,OptionsModel(title: "Feature your car for 15 days", price: "200", type: 2),
         OptionsModel(title: "Feature your car for 30 days", price: "250", type: 2),
         OptionsModel(title: "Feature your car for 30 days", price: "250", type: 2)
         ,OptionsModel(title: "Feature your car for 15 days", price: "200", type: 2),
         OptionsModel(title: "Feature your car for 30 days", price: "250", type: 2)]
  
    static var testItemDetailsData:[RowDataModel] = [
        RowDataModel(icon: #imageLiteral(resourceName: "services_icon"), title: "Milage: ", data: "4029999 Km")
        ,RowDataModel(icon: #imageLiteral(resourceName: "tirmes_tab"), title: "Type", data: "BMW")
        ,RowDataModel(icon: #imageLiteral(resourceName: "support_tab"), title: "Tires: ", data: "14 m")
        ,RowDataModel(icon: #imageLiteral(resourceName: "favorite_tab"), title: "Milage", data: "4029999 Km")
        ,RowDataModel(icon: #imageLiteral(resourceName: "plus_button"), title: "Milage", data: "4029999 Km")
    ]
    
    static var categoyModel:[CategoriesModel]=[
        CategoriesModel(categoryName: "Motors", categoyID: "1", categoyColor: #colorLiteral(red: 1, green: 0, blue: 0.4509803922, alpha: 1), categoryImage: #imageLiteral(resourceName: "motors_icon"))
//        , CategoriesModel(categoryName: "Property", categoyID: "2", categoyColor: #colorLiteral(red: 1, green: 0.5411764706, blue: 0.01568627451, alpha: 1), categoryImage: #imageLiteral(resourceName: "property_icon") )
        , CategoriesModel(categoryName: "Jobs", categoyID: "3", categoyColor: #colorLiteral(red: 1, green: 0.4, blue: 0.3568627451, alpha: 1), categoryImage: #imageLiteral(resourceName: "jobs_icon"))
        , CategoriesModel(categoryName: "Services", categoyID: "4", categoyColor: #colorLiteral(red: 0, green: 0.831372549, blue: 0.9764705882, alpha: 1), categoryImage: #imageLiteral(resourceName: "services_icon"))
        , CategoriesModel(categoryName: "Business", categoyID: "5", categoyColor: #colorLiteral(red: 0.4274509804, green: 0.831372549, blue: 0, alpha: 1), categoryImage: #imageLiteral(resourceName: "buissness_icon"))
        , CategoriesModel(categoryName: "Classifieds", categoyID: "6", categoyColor: #colorLiteral(red: 0, green: 0.568627451, blue: 1, alpha: 1), categoryImage: #imageLiteral(resourceName: "classified_icon"))
        ,CategoriesModel(categoryName: "Numbers", categoyID: "7", categoyColor: #colorLiteral(red: 0.4470588235, green: 0.3333333333, blue: 0.9450980392, alpha: 1), categoryImage: #imageLiteral(resourceName: "plate_icon")),CategoriesModel(categoryName: "Electronics", categoyID: "8", categoyColor: #colorLiteral(red: 1, green: 0.8274509804, blue: 0, alpha: 1), categoryImage: #imageLiteral(resourceName: "mobile_icon"))
    ]
    static var favoModel:[CategoriesModel]=[
        CategoriesModel(categoryName: "All", categoyID: "0", categoyColor: #colorLiteral(red: 0.787756741, green: 0.7996513247, blue: 0.8245124221, alpha: 1), categoryImage: UIImage(named: "favo")!)
        , CategoriesModel(categoryName: "Motors", categoyID: "1", categoyColor: #colorLiteral(red: 0.787756741, green: 0.7996513247, blue: 0.8245124221, alpha: 1), categoryImage: #imageLiteral(resourceName: "motors_icon"))
//        , CategoriesModel(categoryName: "Property", categoyID: "2", categoyColor: #colorLiteral(red: 0.787756741, green: 0.7996513247, blue: 0.8245124221, alpha: 1), categoryImage: #imageLiteral(resourceName: "property_icon") )
        , CategoriesModel(categoryName: "Jobs", categoyID: "3", categoyColor: #colorLiteral(red: 0.787756741, green: 0.7996513247, blue: 0.8245124221, alpha: 1), categoryImage: #imageLiteral(resourceName: "jobs_icon"))
        , CategoriesModel(categoryName: "Services", categoyID: "4", categoyColor: #colorLiteral(red: 0.787756741, green: 0.7996513247, blue: 0.8245124221, alpha: 1), categoryImage: #imageLiteral(resourceName: "services_icon"))
        , CategoriesModel(categoryName: "Business", categoyID: "5", categoyColor: #colorLiteral(red: 0.787756741, green: 0.7996513247, blue: 0.8245124221, alpha: 1), categoryImage: #imageLiteral(resourceName: "buissness_icon"))
        , CategoriesModel(categoryName: "Classifieds", categoyID: "6", categoyColor: #colorLiteral(red: 0.787756741, green: 0.7996513247, blue: 0.8245124221, alpha: 1), categoryImage: #imageLiteral(resourceName: "classified_icon"))
        ,CategoriesModel(categoryName: "Numbers", categoyID: "7", categoyColor: #colorLiteral(red: 0.787756741, green: 0.7996513247, blue: 0.8245124221, alpha: 1), categoryImage: #imageLiteral(resourceName: "plate_icon")),CategoriesModel(categoryName: "Electronics", categoyID: "8", categoyColor:#colorLiteral(red: 0.787756741, green: 0.7996513247, blue: 0.8245124221, alpha: 1), categoryImage: #imageLiteral(resourceName: "mobile_icon"))
    ]
    static var sellItemModel:[CategoriesModel]=[
         CategoriesModel(categoryName: "Motors", categoyID: "1", categoyColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), categoryImage: #imageLiteral(resourceName: "types_icon"))
//        , CategoriesModel(categoryName: "Property", categoyID: "2", categoyColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), categoryImage: UIImage(named: "ho")! )
        , CategoriesModel(categoryName: "Jobs", categoyID: "3", categoyColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), categoryImage: UIImage(named: "pers")!)
        , CategoriesModel(categoryName: "Services", categoyID: "4", categoyColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), categoryImage: UIImage(named: "serv")!)
        , CategoriesModel(categoryName: "Business", categoyID: "5", categoyColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), categoryImage: UIImage(named: "busn")!)
        , CategoriesModel(categoryName: "Classifieds", categoyID: "6", categoyColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), categoryImage: UIImage(named: "clas")!)
        ,CategoriesModel(categoryName: "Numbers", categoyID: "7", categoyColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), categoryImage: UIImage(named: "numbers")!),CategoriesModel(categoryName: "Electronics", categoyID: "8", categoyColor:#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), categoryImage: UIImage(named: "mobile")!)
    ]

    static  var tesColors:[UIColor]=[#colorLiteral(red: 1, green: 0, blue: 0.4509803922, alpha: 1),#colorLiteral(red: 1, green: 0.5411764706, blue: 0.01568627451, alpha: 1),#colorLiteral(red: 1, green: 0.4, blue: 0.3568627451, alpha: 1),#colorLiteral(red: 0, green: 0.831372549, blue: 0.9764705882, alpha: 1),#colorLiteral(red: 0.4274509804, green: 0.831372549, blue: 0, alpha: 1),#colorLiteral(red: 0, green: 0.568627451, blue: 1, alpha: 1),#colorLiteral(red: 0.4470588235, green: 0.3333333333, blue: 0.9450980392, alpha: 1),#colorLiteral(red: 1, green: 0.8274509804, blue: 0, alpha: 1)]
    static var testNames:[String] = ["Motors",
//                                     "Property",
                                     "Jobs","Services","Business","Classifieds","Numbers","Electronics"]
    static var testCollectionNames:[String] = ["BMW i8 2018","Lamborghini Aventador 2015","Bose Quiet Comfort III, Brand New","5 BR Villa with Pool in Arabian Ranches","3 BR Luxurious Villa in heart of Dubai","2017 Macbook Air 13 inch","Lamborghini","Royal blue sofa set (3+1+1) includes 2 …"]
    static var testCollectionPrices:[String] = ["AED 18,000","AED 120,000","AED 20,000","AED 2000,000,000","AED 9000,000,000  ","AED 10,700","AED 30,000","AED 200"]
    static var titelsTest=["Item1","Item2","Item3","Item4","Item5","Item6","Item7","Item8","Item9"]
    static var testPrices:[String] = ["AED 18,000","AED 120,000","AED 20,000","AED 2000,000,000","AED 9000,000,000  ","AED 10,700","AED 30,000","AED 200","AED 200,000"]

    static var adsArray: [UIImage] = [#imageLiteral(resourceName: "car4.jpeg"), #imageLiteral(resourceName: "car3.jpeg"), #imageLiteral(resourceName: "car4.jpeg"), #imageLiteral(resourceName: "car1.jpeg"),#imageLiteral(resourceName: "car4.jpeg"), #imageLiteral(resourceName: "car3.jpeg"), #imageLiteral(resourceName: "car4.jpeg"), #imageLiteral(resourceName: "car1.jpeg")]
    static var jobsArray: [UIImage] = [#imageLiteral(resourceName: "car4.jpeg"), #imageLiteral(resourceName: "car3.jpeg")]
    static var normalImages: [UIImage] = [#imageLiteral(resourceName: "default_image")]
    static var jobsSubCategories:[CategoriesItemsModel]
        =
        [CategoriesItemsModel(categoryName: "Opining Jobs", categoryId: "1", subCategoryList: [
                                ItemsModel(itemName: "Cars2", itemId: "1.2")
                                ,ItemsModel(itemName: "Cars3", itemId: "1.3")])
         ,CategoriesItemsModel(categoryName: "Wanted Jobs", categoryId: "1", subCategoryList: [
                                ItemsModel(itemName: "Job1", itemId: "1.2")
                                ,ItemsModel(itemName: "Job2", itemId: "13")
                                ,ItemsModel(itemName: "Job3", itemId: "12")
                                ,ItemsModel(itemName: "Job4", itemId: "13")])
        ]
    static var testJobsNames:[String] = ["Opining Jobs","Wanted Jobs"]

    static var testCategories:[CategoriesItemsModel]
        =
        [CategoriesItemsModel(categoryName: "Motors", categoryId: "1", subCategoryList: [ItemsModel(itemName: "Cars2", itemId: "1.2"),ItemsModel(itemName: "Cars3", itemId: "1.3"),ItemsModel(itemName: "Cars4", itemId: "1.4")])
         ,CategoriesItemsModel(categoryName: "Motors", categoryId: "1", subCategoryList: [ItemsModel(itemName: "Cars2", itemId: "1.2"),ItemsModel(itemName: "Cars3", itemId: "1.3"),ItemsModel(itemName: "Cars4", itemId: "1.4"),ItemsModel(itemName: "Bus", itemId: "1.1")])
         ,CategoriesItemsModel(categoryName: "Motors", categoryId: "1", subCategoryList:[ItemsModel(itemName: "Cars2", itemId: "1.2"),ItemsModel(itemName: "Cars3", itemId: "1.3"),ItemsModel(itemName: "Cars4", itemId: "1.4"),ItemsModel(itemName: "Bus", itemId: "1.1")])]
    
}
