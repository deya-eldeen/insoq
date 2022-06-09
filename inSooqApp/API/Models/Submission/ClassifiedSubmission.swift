//
//  ClassifiedSubmission.swift
//  inSooqApp
//
//  Created by Deya on 24/04/2022.
//

import Foundation

// initial (NORMAL)
struct ClassifiedInitialSubmission: Codable {

    var title = "" //": "amet sit",
    var categoryId = "" //": 50672786,
    var subCategoryId = "" //": -85238237,
    var otherSubCategory = "" //": "sunt ut",
    var subTypeId = "" //": -69440632,
    var otherSubType = "" //": "ea sint "
    
}
//curl --location --request POST 'http://apinew.insouq.com/api/ClassifiedAds/AddInitialClassified' \
//--header 'Content-Type: application/json' \
//--data-raw '{

//}'

// full (FORM)
struct ClassifiedFullSubmission: Codable {

    var Description = ""  //="sunt nulla"' \
    var Lat = ""  //="ut voluptate in Excepteur"' \
    var Lng = ""  //="commodo ad"' \
    var Location = ""  //="pariatur eiusmod Ut irure"' \
    var PhoneNumber = ""  //="adipisicing culpa eiusmod "' \
    var Price = ""  //="-41144122.13094258"' \
    var AdId = ""  //="-33511020"' \
    var CategoryId = ""  //="-85223905"' \
//    var Pictures = ""  //="[\"voluptate\",\"mollit proi\"]"' \
    var MainPhoto = ""  //="eu in"' \
    var Age = ""  //="elit esse"' \
    var Usage = ""  //="magna dolor esse nisi"' \
    var Condition = ""  //="sint magna sed dolore"' \
    var Brand = ""  //="dolore sunt nulla ex"'
    
}

//curl --location --request POST 'http://apinew.insouq.com/api/ClassifiedAds/AddFullClassified' \
//--header 'Content-Type: multipart/form-data' \


