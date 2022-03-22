//
//  Constant.swift
//  inSooqApp
//
//  Created by Mohammad Jawher on 18/03/2022.
//

import Foundation

let Connection = "https://newapis.insouq.com/api/"
let ConnectionDropDowns = Connection + "DropDowns/"

// Job Category
let GetAllCareerLevelUrl = ConnectionDropDowns + "GetAllCareerLevel"
let GetAllEmploymentTypeUrl = ConnectionDropDowns + "GetAllEmploymentType"





// Numbers Category
let GetAllEmirateUrl = ConnectionDropDowns + "GetAllEmirate"
let GetAllPlateTypeByEmirateIdUrl = ConnectionDropDowns + "GetAllPlateTypeByEmirateId?emirateId="

//DropDowns/GetAllPlateTypeByEmirateId?emirateId=64607067

let GetAllOperatorUrl = ConnectionDropDowns + "GetAllOperator"



let GetByCategoryIdUrl = Connection + "SubCategory/GetByCategoryId?categoryId="
let GetBySubCategoryIdUrl = Connection + "SubType/GetBySubCategoryId?subCategoryId="

// Motor Category
// UsedCar & ExportCar SubCategory
let GetAllMotorMakerUrl = ConnectionDropDowns + "GetAllMotorMaker"
let GetAllMotorModelByMakerIdUrl = ConnectionDropDowns + "GetAllMotorModelByMakerId?makerId="



//GetAllMotorModelByMakerId?makerId=4
