//
//  BasicAd.swift
//  inSooqApp
//
//  Created by Deya on 11/05/2022.
//

import Foundation


struct MotorAdModel: Codable {

  enum CodingKeys: String, CodingKey {
    case arNoOfCylinders = "ar_NoOfCylinders"
    case subTypeArName = "subTypeAr_Name"
    case year
    case enSellerType = "en_SellerType"
    case subCategoryEnName = "subCategoryEn_Name"
    case arColor = "ar_Color"
    case categoryArName
    case postDate
    case subCategoryId
    case updatecount
    case arUsage = "ar_Usage"
    case arSellerType = "ar_SellerType"
    case kilometers
    case userId
    case enFuelType = "en_FuelType"
    case enColor = "en_Color"
    case descriptionValue = "description"
    case phoneNumber
    case packageExpDate
    case chates
    case subTypeId
    case title
    case enFinalDriveSystem = "en_FinalDriveSystem"
    case arFinalDriveSystem = "ar_FinalDriveSystem"
    case arFuelType = "ar_FuelType"
    case subTypeEnName = "subTypeEn_Name"
    case id
    case status
    case warranty
    case arEngineSize = "ar_EngineSize"
    case lng
    case enLocation = "en_Location"
    case views
    case enUsage = "en_Usage"
    case packageStatus
    case categoryId
    case arLocation = "ar_Location"
    case isFavorite
    case arWheels = "ar_Wheels"
    case subCategoryArName = "subCategoryAr_Name"
    case enWheels = "en_Wheels"
    case lat
    case userImage
    case enEngineSize = "en_EngineSize"
    case typeId
    case categoryEnName
    case enNoOfCylinders = "en_NoOfCylinders"
    case pictures
    case price
    case packageId
  }

  var arNoOfCylinders: String?
  var subTypeArName: String?
  var year: Int?
  var enSellerType: String?
  var subCategoryEnName: String?
  var arColor: String?
  var categoryArName: String?
  var postDate: String?
  var subCategoryId: Int?
  var updatecount: Int?
  var arUsage: String?
  var arSellerType: String?
  var kilometers: Double?
  var userId: Int?
  var enFuelType: String?
  var enColor: String?
  var descriptionValue: String?
  var phoneNumber: String?
  var packageExpDate: String?
  var chates: Int?
  var subTypeId: Int?
  var title: String?
  var enFinalDriveSystem: String?
  var arFinalDriveSystem: String?
  var arFuelType: String?
  var subTypeEnName: String?
  var id: Int?
  var status: Int?
  var warranty: Int?
  var arEngineSize: String?
  var lng: String?
  var enLocation: String?
  var views: Int?
  var enUsage: String?
  var packageStatus: Int?
  var categoryId: Int?
  var arLocation: String?
  var isFavorite: Bool?
  var arWheels: String?
  var subCategoryArName: String?
  var enWheels: String?
  var lat: String?
  var userImage: String?
  var enEngineSize: String?
  var typeId: Int?
  var categoryEnName: String?
  var enNoOfCylinders: String?
  var pictures: [Picture]?
  var price: Double?
  var packageId: Int?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    arNoOfCylinders = try container.decodeIfPresent(String.self, forKey: .arNoOfCylinders)
    subTypeArName = try container.decodeIfPresent(String.self, forKey: .subTypeArName)
    year = try container.decodeIfPresent(Int.self, forKey: .year)
    enSellerType = try container.decodeIfPresent(String.self, forKey: .enSellerType)
    subCategoryEnName = try container.decodeIfPresent(String.self, forKey: .subCategoryEnName)
    arColor = try container.decodeIfPresent(String.self, forKey: .arColor)
    categoryArName = try container.decodeIfPresent(String.self, forKey: .categoryArName)
    postDate = try container.decodeIfPresent(String.self, forKey: .postDate)
    subCategoryId = try container.decodeIfPresent(Int.self, forKey: .subCategoryId)
    updatecount = try container.decodeIfPresent(Int.self, forKey: .updatecount)
    arUsage = try container.decodeIfPresent(String.self, forKey: .arUsage)
    arSellerType = try container.decodeIfPresent(String.self, forKey: .arSellerType)
    kilometers = try container.decodeIfPresent(Double.self, forKey: .kilometers)
    userId = try container.decodeIfPresent(Int.self, forKey: .userId)
    enFuelType = try container.decodeIfPresent(String.self, forKey: .enFuelType)
    enColor = try container.decodeIfPresent(String.self, forKey: .enColor)
    descriptionValue = try container.decodeIfPresent(String.self, forKey: .descriptionValue)
    phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
    packageExpDate = try container.decodeIfPresent(String.self, forKey: .packageExpDate)
    chates = try container.decodeIfPresent(Int.self, forKey: .chates)
    subTypeId = try container.decodeIfPresent(Int.self, forKey: .subTypeId)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    enFinalDriveSystem = try container.decodeIfPresent(String.self, forKey: .enFinalDriveSystem)
    arFinalDriveSystem = try container.decodeIfPresent(String.self, forKey: .arFinalDriveSystem)
    arFuelType = try container.decodeIfPresent(String.self, forKey: .arFuelType)
    subTypeEnName = try container.decodeIfPresent(String.self, forKey: .subTypeEnName)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    status = try container.decodeIfPresent(Int.self, forKey: .status)
    warranty = try container.decodeIfPresent(Int.self, forKey: .warranty)
    arEngineSize = try container.decodeIfPresent(String.self, forKey: .arEngineSize)
    lng = try container.decodeIfPresent(String.self, forKey: .lng)
    enLocation = try container.decodeIfPresent(String.self, forKey: .enLocation)
    views = try container.decodeIfPresent(Int.self, forKey: .views)
    enUsage = try container.decodeIfPresent(String.self, forKey: .enUsage)
    packageStatus = try container.decodeIfPresent(Int.self, forKey: .packageStatus)
    categoryId = try container.decodeIfPresent(Int.self, forKey: .categoryId)
    arLocation = try container.decodeIfPresent(String.self, forKey: .arLocation)
    isFavorite = try container.decodeIfPresent(Bool.self, forKey: .isFavorite)
    arWheels = try container.decodeIfPresent(String.self, forKey: .arWheels)
    subCategoryArName = try container.decodeIfPresent(String.self, forKey: .subCategoryArName)
    enWheels = try container.decodeIfPresent(String.self, forKey: .enWheels)
    lat = try container.decodeIfPresent(String.self, forKey: .lat)
    userImage = try container.decodeIfPresent(String.self, forKey: .userImage)
    enEngineSize = try container.decodeIfPresent(String.self, forKey: .enEngineSize)
    typeId = try container.decodeIfPresent(Int.self, forKey: .typeId)
    categoryEnName = try container.decodeIfPresent(String.self, forKey: .categoryEnName)
    enNoOfCylinders = try container.decodeIfPresent(String.self, forKey: .enNoOfCylinders)
    pictures = try container.decodeIfPresent([Picture].self, forKey: .pictures)
    price = try container.decodeIfPresent(Double.self, forKey: .price)
    packageId = try container.decodeIfPresent(Int.self, forKey: .packageId)
  }

}

struct JobAdModel: Codable {

  enum CodingKeys: String, CodingKey {
    case enNoticePeriod = "en_NoticePeriod"
    case enJobType = "en_JobType"
    case chates
    case arJobType = "ar_JobType"
    case lng
    case userImage
    case userId
    case arLocation = "ar_Location"
    case arCommitment = "ar_Commitment"
    case arGender = "ar_Gender"
    case enLocation = "en_Location"
    case typeId
    case cv
    case enEducationLevel = "en_EducationLevel"
    case pictures
    case lat
    case packageId
    case arEducationLevel = "ar_EducationLevel"
    case phoneNumber
    case enCommitment = "en_Commitment"
    case expectedMonthlySalary
    case id
    case arCurrentLocation = "ar_CurrentLocation"
    case arNationality = "ar_Nationality"
    case updatecount
    case enNationality = "en_Nationality"
    case packageStatus
    case packageExpDate
    case categoryEnName
    case status
    case descriptionValue = "description"
    case enCurrentLocation = "en_CurrentLocation"
    case categoryArName
    case arWorkExperience = "ar_WorkExperience"
    case enWorkExperience = "en_WorkExperience"
    case views
    case arVisaStatus = "ar_VisaStatus"
    case postDate
    case enGender = "en_Gender"
    case categoryId
    case currentPosition
    case title
    case isFavorite
    case arNoticePeriod = "ar_NoticePeriod"
    case enVisaStatus = "en_VisaStatus"
  }

  var enNoticePeriod: String?
  var enJobType: String?
  var chates: Int?
  var arJobType: String?
  var lng: String?
  var userImage: String?
  var userId: Int?
  var arLocation: String?
  var arCommitment: String?
  var arGender: String?
  var enLocation: String?
  var typeId: Int?
  var cv: String?
  var enEducationLevel: String?
  var pictures: [Picture]?
  var lat: String?
  var packageId: Int?
  var arEducationLevel: String?
  var phoneNumber: String?
  var enCommitment: String?
  var expectedMonthlySalary: String?
  var id: Int?
  var arCurrentLocation: String?
  var arNationality: String?
  var updatecount: Int?
  var enNationality: String?
  var packageStatus: Int?
  var packageExpDate: String?
  var categoryEnName: String?
  var status: Int?
  var descriptionValue: String?
  var enCurrentLocation: String?
  var categoryArName: String?
  var arWorkExperience: String?
  var enWorkExperience: String?
  var views: Int?
  var arVisaStatus: String?
  var postDate: String?
  var enGender: String?
  var categoryId: Int?
  var currentPosition: String?
  var title: String?
  var isFavorite: Bool?
  var arNoticePeriod: String?
  var enVisaStatus: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    enNoticePeriod = try container.decodeIfPresent(String.self, forKey: .enNoticePeriod)
    enJobType = try container.decodeIfPresent(String.self, forKey: .enJobType)
    chates = try container.decodeIfPresent(Int.self, forKey: .chates)
    arJobType = try container.decodeIfPresent(String.self, forKey: .arJobType)
    lng = try container.decodeIfPresent(String.self, forKey: .lng)
    userImage = try container.decodeIfPresent(String.self, forKey: .userImage)
    userId = try container.decodeIfPresent(Int.self, forKey: .userId)
    arLocation = try container.decodeIfPresent(String.self, forKey: .arLocation)
    arCommitment = try container.decodeIfPresent(String.self, forKey: .arCommitment)
    arGender = try container.decodeIfPresent(String.self, forKey: .arGender)
    enLocation = try container.decodeIfPresent(String.self, forKey: .enLocation)
    typeId = try container.decodeIfPresent(Int.self, forKey: .typeId)
    cv = try container.decodeIfPresent(String.self, forKey: .cv)
    enEducationLevel = try container.decodeIfPresent(String.self, forKey: .enEducationLevel)
    pictures = try container.decodeIfPresent([Picture].self, forKey: .pictures)
    lat = try container.decodeIfPresent(String.self, forKey: .lat)
    packageId = try container.decodeIfPresent(Int.self, forKey: .packageId)
    arEducationLevel = try container.decodeIfPresent(String.self, forKey: .arEducationLevel)
    phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
    enCommitment = try container.decodeIfPresent(String.self, forKey: .enCommitment)
    expectedMonthlySalary = try container.decodeIfPresent(String.self, forKey: .expectedMonthlySalary)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    arCurrentLocation = try container.decodeIfPresent(String.self, forKey: .arCurrentLocation)
    arNationality = try container.decodeIfPresent(String.self, forKey: .arNationality)
    updatecount = try container.decodeIfPresent(Int.self, forKey: .updatecount)
    enNationality = try container.decodeIfPresent(String.self, forKey: .enNationality)
    packageStatus = try container.decodeIfPresent(Int.self, forKey: .packageStatus)
    packageExpDate = try container.decodeIfPresent(String.self, forKey: .packageExpDate)
    categoryEnName = try container.decodeIfPresent(String.self, forKey: .categoryEnName)
    status = try container.decodeIfPresent(Int.self, forKey: .status)
    descriptionValue = try container.decodeIfPresent(String.self, forKey: .descriptionValue)
    enCurrentLocation = try container.decodeIfPresent(String.self, forKey: .enCurrentLocation)
    categoryArName = try container.decodeIfPresent(String.self, forKey: .categoryArName)
    arWorkExperience = try container.decodeIfPresent(String.self, forKey: .arWorkExperience)
    enWorkExperience = try container.decodeIfPresent(String.self, forKey: .enWorkExperience)
    views = try container.decodeIfPresent(Int.self, forKey: .views)
    arVisaStatus = try container.decodeIfPresent(String.self, forKey: .arVisaStatus)
    postDate = try container.decodeIfPresent(String.self, forKey: .postDate)
    enGender = try container.decodeIfPresent(String.self, forKey: .enGender)
    categoryId = try container.decodeIfPresent(Int.self, forKey: .categoryId)
    currentPosition = try container.decodeIfPresent(String.self, forKey: .currentPosition)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    isFavorite = try container.decodeIfPresent(Bool.self, forKey: .isFavorite)
    arNoticePeriod = try container.decodeIfPresent(String.self, forKey: .arNoticePeriod)
    enVisaStatus = try container.decodeIfPresent(String.self, forKey: .enVisaStatus)
  }

}


struct NumberAdModel: Codable {

  enum CodingKeys: String, CodingKey {
    case isFavorite
    case status
    case userId
    case photo
    case updatecount
    case chates
    case enLocation = "en_Location"
    case title
    case categoryArName
    case price
    case plateCode
    case arPlateType = "ar_PlateType"
    case userImage
    case lng
    case categoryId
    case typeId
    case arLocation = "ar_Location"
    case categoryEnName
    case packageStatus
    case id
    case descriptionValue = "description"
    case postDate
    case number
    case lat
    case phoneNumber
    case enEmirate = "en_Emirate"
    case packageId
    case photo2
    case enPlateType = "en_PlateType"
    case views
    case arEmirate = "ar_Emirate"
    case packageExpDate
  }

  var isFavorite: Bool?
  var status: Int?
  var userId: Int?
  var photo: String?
  var updatecount: Int?
  var chates: Int?
  var enLocation: String?
  var title: String?
  var categoryArName: String?
  var price: Int?
  var plateCode: String?
  var arPlateType: String?
  var userImage: String?
  var lng: String?
  var categoryId: Int?
  var typeId: Int?
  var arLocation: String?
  var categoryEnName: String?
  var packageStatus: Int?
  var id: Int?
  var descriptionValue: String?
  var postDate: String?
  var number: Int?
  var lat: String?
  var phoneNumber: String?
  var enEmirate: String?
  var packageId: Int?
  var photo2: String?
  var enPlateType: String?
  var views: Int?
  var arEmirate: String?
  var packageExpDate: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    isFavorite = try container.decodeIfPresent(Bool.self, forKey: .isFavorite)
    status = try container.decodeIfPresent(Int.self, forKey: .status)
    userId = try container.decodeIfPresent(Int.self, forKey: .userId)
    photo = try container.decodeIfPresent(String.self, forKey: .photo)
    updatecount = try container.decodeIfPresent(Int.self, forKey: .updatecount)
    chates = try container.decodeIfPresent(Int.self, forKey: .chates)
    enLocation = try container.decodeIfPresent(String.self, forKey: .enLocation)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    categoryArName = try container.decodeIfPresent(String.self, forKey: .categoryArName)
    price = try container.decodeIfPresent(Int.self, forKey: .price)
    plateCode = try container.decodeIfPresent(String.self, forKey: .plateCode)
    arPlateType = try container.decodeIfPresent(String.self, forKey: .arPlateType)
    userImage = try container.decodeIfPresent(String.self, forKey: .userImage)
    lng = try container.decodeIfPresent(String.self, forKey: .lng)
    categoryId = try container.decodeIfPresent(Int.self, forKey: .categoryId)
    typeId = try container.decodeIfPresent(Int.self, forKey: .typeId)
    arLocation = try container.decodeIfPresent(String.self, forKey: .arLocation)
    categoryEnName = try container.decodeIfPresent(String.self, forKey: .categoryEnName)
    packageStatus = try container.decodeIfPresent(Int.self, forKey: .packageStatus)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    descriptionValue = try container.decodeIfPresent(String.self, forKey: .descriptionValue)
    postDate = try container.decodeIfPresent(String.self, forKey: .postDate)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    lat = try container.decodeIfPresent(String.self, forKey: .lat)
    phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
    enEmirate = try container.decodeIfPresent(String.self, forKey: .enEmirate)
    packageId = try container.decodeIfPresent(Int.self, forKey: .packageId)
    photo2 = try container.decodeIfPresent(String.self, forKey: .photo2)
    enPlateType = try container.decodeIfPresent(String.self, forKey: .enPlateType)
    views = try container.decodeIfPresent(Int.self, forKey: .views)
    arEmirate = try container.decodeIfPresent(String.self, forKey: .arEmirate)
    packageExpDate = try container.decodeIfPresent(String.self, forKey: .packageExpDate)
  }

}


struct ElectronicsAdModel : Codable {

  enum CodingKeys: String, CodingKey {
    case categoryArName
    case lat
    case enColor = "en_Color"
    case isFavorite
    case enAge = "en_Age"
    case enUsage = "en_Usage"
    case views
    case userId
    case versionAr = "version_Ar"
    case packageId
    case postDate
    case subCategoryEnName = "subCategoryEn_Name"
    case userImage
    case packageExpDate
    case storageEn = "storage_En"
    case updatecount
    case arUsage = "ar_Usage"
    case chates
    case categoryEnName
    case subCategoryArName = "subCategoryAr_Name"
    case warranty
    case status
    case arLocation = "ar_Location"
    case otherSubType
    case arAge = "ar_Age"
    case phoneNumber
    case typeId
    case categoryId
    case versionEn = "version_En"
    case enLocation = "en_Location"
    case title
    case ramEn = "ram_En"
    case id
    case packageStatus
    case descriptionValue = "description"
    case subCategoryId
    case price
    case ramAr = "ram_Ar"
    case pictures
    case storageAr = "storage_Ar"
    case lng
    case arColor = "ar_Color"
  }

  var categoryArName: String?
  var lat: String?
  var enColor: String?
  var isFavorite: Bool?
  var enAge: String?
  var enUsage: String?
  var views: Int?
  var userId: Int?
  var versionAr: String?
  var packageId: Int?
  var postDate: String?
  var subCategoryEnName: String?
  var userImage: String?
  var packageExpDate: String?
  var storageEn: String?
  var updatecount: Int?
  var arUsage: String?
  var chates: Int?
  var categoryEnName: String?
  var subCategoryArName: String?
  var warranty: Int?
  var status: Int?
  var arLocation: String?
  var otherSubType: String?
  var arAge: String?
  var phoneNumber: String?
  var typeId: Int?
  var categoryId: Int?
  var versionEn: String?
  var enLocation: String?
  var title: String?
  var ramEn: String?
  var id: Int?
  var packageStatus: Int?
  var descriptionValue: String?
  var subCategoryId: Int?
  var price: Int?
  var ramAr: String?
  var pictures: [Picture]?
  var storageAr: String?
  var lng: String?
  var arColor: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    categoryArName = try container.decodeIfPresent(String.self, forKey: .categoryArName)
    lat = try container.decodeIfPresent(String.self, forKey: .lat)
    enColor = try container.decodeIfPresent(String.self, forKey: .enColor)
    isFavorite = try container.decodeIfPresent(Bool.self, forKey: .isFavorite)
    enAge = try container.decodeIfPresent(String.self, forKey: .enAge)
    enUsage = try container.decodeIfPresent(String.self, forKey: .enUsage)
    views = try container.decodeIfPresent(Int.self, forKey: .views)
    userId = try container.decodeIfPresent(Int.self, forKey: .userId)
    versionAr = try container.decodeIfPresent(String.self, forKey: .versionAr)
    packageId = try container.decodeIfPresent(Int.self, forKey: .packageId)
    postDate = try container.decodeIfPresent(String.self, forKey: .postDate)
    subCategoryEnName = try container.decodeIfPresent(String.self, forKey: .subCategoryEnName)
    userImage = try container.decodeIfPresent(String.self, forKey: .userImage)
    packageExpDate = try container.decodeIfPresent(String.self, forKey: .packageExpDate)
    storageEn = try container.decodeIfPresent(String.self, forKey: .storageEn)
    updatecount = try container.decodeIfPresent(Int.self, forKey: .updatecount)
    arUsage = try container.decodeIfPresent(String.self, forKey: .arUsage)
    chates = try container.decodeIfPresent(Int.self, forKey: .chates)
    categoryEnName = try container.decodeIfPresent(String.self, forKey: .categoryEnName)
    subCategoryArName = try container.decodeIfPresent(String.self, forKey: .subCategoryArName)
    warranty = try container.decodeIfPresent(Int.self, forKey: .warranty)
    status = try container.decodeIfPresent(Int.self, forKey: .status)
    arLocation = try container.decodeIfPresent(String.self, forKey: .arLocation)
    otherSubType = try container.decodeIfPresent(String.self, forKey: .otherSubType)
    arAge = try container.decodeIfPresent(String.self, forKey: .arAge)
    phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
    typeId = try container.decodeIfPresent(Int.self, forKey: .typeId)
    categoryId = try container.decodeIfPresent(Int.self, forKey: .categoryId)
    versionEn = try container.decodeIfPresent(String.self, forKey: .versionEn)
    enLocation = try container.decodeIfPresent(String.self, forKey: .enLocation)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    ramEn = try container.decodeIfPresent(String.self, forKey: .ramEn)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    packageStatus = try container.decodeIfPresent(Int.self, forKey: .packageStatus)
    descriptionValue = try container.decodeIfPresent(String.self, forKey: .descriptionValue)
    subCategoryId = try container.decodeIfPresent(Int.self, forKey: .subCategoryId)
    price = try container.decodeIfPresent(Int.self, forKey: .price)
    ramAr = try container.decodeIfPresent(String.self, forKey: .ramAr)
    pictures = try container.decodeIfPresent([Picture].self, forKey: .pictures)
    storageAr = try container.decodeIfPresent(String.self, forKey: .storageAr)
    lng = try container.decodeIfPresent(String.self, forKey: .lng)
    arColor = try container.decodeIfPresent(String.self, forKey: .arColor)
  }

}

struct ClassifiedAdModel: Codable {

  enum CodingKeys: String, CodingKey {
    case title
    case categoryId
    case enLocation = "en_Location"
    case subTypeId
    case userId
    case categoryEnName
    case updatecount
    case views
    case phoneNumber
    case subCategoryId
    case typeId
    case categoryArName
    case arCondition = "ar_Condition"
    case arLocation = "ar_Location"
    case subTypeEnName = "subTypeEn_Name"
    case enBrand = "en_Brand"
    case subCategoryEnName = "subCategoryEn_Name"
    case packageStatus
    case userImage
    case subCategoryArName = "subCategoryAr_Name"
    case enAge = "en_Age"
    case arBrand = "ar_Brand"
    case status
    case enCondition = "en_Condition"
    case packageExpDate
    case chates
    case lng
    case id
    case pictures
    case lat
    case postDate
    case arAge = "ar_Age"
    case subTypeArName = "subTypeAr_Name"
    case packageId
    case arUsage = "ar_Usage"
    case isFavorite
    case enUsage = "en_Usage"
    case price
    case descriptionValue = "description"
  }

  var title: String?
  var categoryId: Int?
  var enLocation: String?
  var subTypeId: Int?
  var userId: Int?
  var categoryEnName: String?
  var updatecount: Int?
  var views: Int?
  var phoneNumber: String?
  var subCategoryId: Int?
  var typeId: Int?
  var categoryArName: String?
  var arCondition: String?
  var arLocation: String?
  var subTypeEnName: String?
  var enBrand: String?
  var subCategoryEnName: String?
  var packageStatus: Int?
  var userImage: String?
  var subCategoryArName: String?
  var enAge: String?
  var arBrand: String?
  var status: Int?
  var enCondition: String?
  var packageExpDate: String?
  var chates: Int?
  var lng: String?
  var id: Int?
  var pictures: [Picture]?
  var lat: String?
  var postDate: String?
  var arAge: String?
  var subTypeArName: String?
  var packageId: Int?
  var arUsage: String?
  var isFavorite: Bool?
  var enUsage: String?
  var price: Int?
  var descriptionValue: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    categoryId = try container.decodeIfPresent(Int.self, forKey: .categoryId)
    enLocation = try container.decodeIfPresent(String.self, forKey: .enLocation)
    subTypeId = try container.decodeIfPresent(Int.self, forKey: .subTypeId)
    userId = try container.decodeIfPresent(Int.self, forKey: .userId)
    categoryEnName = try container.decodeIfPresent(String.self, forKey: .categoryEnName)
    updatecount = try container.decodeIfPresent(Int.self, forKey: .updatecount)
    views = try container.decodeIfPresent(Int.self, forKey: .views)
    phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
    subCategoryId = try container.decodeIfPresent(Int.self, forKey: .subCategoryId)
    typeId = try container.decodeIfPresent(Int.self, forKey: .typeId)
    categoryArName = try container.decodeIfPresent(String.self, forKey: .categoryArName)
    arCondition = try container.decodeIfPresent(String.self, forKey: .arCondition)
    arLocation = try container.decodeIfPresent(String.self, forKey: .arLocation)
    subTypeEnName = try container.decodeIfPresent(String.self, forKey: .subTypeEnName)
    enBrand = try container.decodeIfPresent(String.self, forKey: .enBrand)
    subCategoryEnName = try container.decodeIfPresent(String.self, forKey: .subCategoryEnName)
    packageStatus = try container.decodeIfPresent(Int.self, forKey: .packageStatus)
    userImage = try container.decodeIfPresent(String.self, forKey: .userImage)
    subCategoryArName = try container.decodeIfPresent(String.self, forKey: .subCategoryArName)
    enAge = try container.decodeIfPresent(String.self, forKey: .enAge)
    arBrand = try container.decodeIfPresent(String.self, forKey: .arBrand)
    status = try container.decodeIfPresent(Int.self, forKey: .status)
    enCondition = try container.decodeIfPresent(String.self, forKey: .enCondition)
    packageExpDate = try container.decodeIfPresent(String.self, forKey: .packageExpDate)
    chates = try container.decodeIfPresent(Int.self, forKey: .chates)
    lng = try container.decodeIfPresent(String.self, forKey: .lng)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    pictures = try container.decodeIfPresent([Picture].self, forKey: .pictures)
    lat = try container.decodeIfPresent(String.self, forKey: .lat)
    postDate = try container.decodeIfPresent(String.self, forKey: .postDate)
    arAge = try container.decodeIfPresent(String.self, forKey: .arAge)
    subTypeArName = try container.decodeIfPresent(String.self, forKey: .subTypeArName)
    packageId = try container.decodeIfPresent(Int.self, forKey: .packageId)
    arUsage = try container.decodeIfPresent(String.self, forKey: .arUsage)
    isFavorite = try container.decodeIfPresent(Bool.self, forKey: .isFavorite)
    enUsage = try container.decodeIfPresent(String.self, forKey: .enUsage)
    price = try container.decodeIfPresent(Int.self, forKey: .price)
    descriptionValue = try container.decodeIfPresent(String.self, forKey: .descriptionValue)
  }

}

struct ServiceAdModel: Codable {

  enum CodingKeys: String, CodingKey {
    case packageExpDate
    case pictures
    case packageStatus
    case userId
    case descriptionValue = "description"
    case postDate
    case typeId
    case categoryId
    case chates
    case status
    case serviceTypeArName = "serviceTypeAr_Name"
    case serviceTypeEnName = "serviceTypeEn_Name"
    case userImage
    case title
    case serviceTypeId
    case lat
    case updatecount
    case packageId
    case enLocation = "en_Location"
    case views
    case id
    case phoneNumber
    case arLocation = "ar_Location"
    case isFavorite
    case lng
    case categoryEnName
    case categoryArName
  }

  var packageExpDate: String?
  var pictures: [Picture]?
  var packageStatus: Int?
  var userId: Int?
  var descriptionValue: String?
  var postDate: String?
  var typeId: Int?
  var categoryId: Int?
  var chates: Int?
  var status: Int?
  var serviceTypeArName: String?
  var serviceTypeEnName: String?
  var userImage: String?
  var title: String?
  var serviceTypeId: Int?
  var lat: String?
  var updatecount: Int?
  var packageId: Int?
  var enLocation: String?
  var views: Int?
  var id: Int?
  var phoneNumber: String?
  var arLocation: String?
  var isFavorite: Bool?
  var lng: String?
  var categoryEnName: String?
  var categoryArName: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    packageExpDate = try container.decodeIfPresent(String.self, forKey: .packageExpDate)
    pictures = try container.decodeIfPresent([Picture].self, forKey: .pictures)
    packageStatus = try container.decodeIfPresent(Int.self, forKey: .packageStatus)
    userId = try container.decodeIfPresent(Int.self, forKey: .userId)
    descriptionValue = try container.decodeIfPresent(String.self, forKey: .descriptionValue)
    postDate = try container.decodeIfPresent(String.self, forKey: .postDate)
    typeId = try container.decodeIfPresent(Int.self, forKey: .typeId)
    categoryId = try container.decodeIfPresent(Int.self, forKey: .categoryId)
    chates = try container.decodeIfPresent(Int.self, forKey: .chates)
    status = try container.decodeIfPresent(Int.self, forKey: .status)
    serviceTypeArName = try container.decodeIfPresent(String.self, forKey: .serviceTypeArName)
    serviceTypeEnName = try container.decodeIfPresent(String.self, forKey: .serviceTypeEnName)
    userImage = try container.decodeIfPresent(String.self, forKey: .userImage)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    serviceTypeId = try container.decodeIfPresent(Int.self, forKey: .serviceTypeId)
    lat = try container.decodeIfPresent(String.self, forKey: .lat)
    updatecount = try container.decodeIfPresent(Int.self, forKey: .updatecount)
    packageId = try container.decodeIfPresent(Int.self, forKey: .packageId)
    enLocation = try container.decodeIfPresent(String.self, forKey: .enLocation)
    views = try container.decodeIfPresent(Int.self, forKey: .views)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
    arLocation = try container.decodeIfPresent(String.self, forKey: .arLocation)
    isFavorite = try container.decodeIfPresent(Bool.self, forKey: .isFavorite)
    lng = try container.decodeIfPresent(String.self, forKey: .lng)
    categoryEnName = try container.decodeIfPresent(String.self, forKey: .categoryEnName)
    categoryArName = try container.decodeIfPresent(String.self, forKey: .categoryArName)
  }

}

struct BusinessAdModel: Codable {

  enum CodingKeys: String, CodingKey {
    case id
    case descriptionValue = "description"
    case enLocation = "en_Location"
    case title
    case packageExpDate
    case postDate
    case pictures
    case views
    case status
    case packageStatus
    case userId
    case userImage
    case isFavorite
    case categoryId
    case categoryEnName
    case lng
    case phoneNumber
    case updatecount
    case packageId
    case typeId
    case lat
    case categoryArName
    case arLocation = "ar_Location"
    case price
    case chates
  }

  var id: Int?
  var descriptionValue: String?
  var enLocation: String?
  var title: String?
  var packageExpDate: String?
  var postDate: String?
  var pictures: [Picture]?
  var views: Int?
  var status: Int?
  var packageStatus: Int?
  var userId: Int?
  var userImage: String?
  var isFavorite: Bool?
  var categoryId: Int?
  var categoryEnName: String?
  var lng: String?
  var phoneNumber: String?
  var updatecount: Int?
  var packageId: Int?
  var typeId: Int?
  var lat: String?
  var categoryArName: String?
  var arLocation: String?
  var price: Int?
  var chates: Int?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    descriptionValue = try container.decodeIfPresent(String.self, forKey: .descriptionValue)
    enLocation = try container.decodeIfPresent(String.self, forKey: .enLocation)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    packageExpDate = try container.decodeIfPresent(String.self, forKey: .packageExpDate)
    postDate = try container.decodeIfPresent(String.self, forKey: .postDate)
    pictures = try container.decodeIfPresent([Picture].self, forKey: .pictures)
    views = try container.decodeIfPresent(Int.self, forKey: .views)
    status = try container.decodeIfPresent(Int.self, forKey: .status)
    packageStatus = try container.decodeIfPresent(Int.self, forKey: .packageStatus)
    userId = try container.decodeIfPresent(Int.self, forKey: .userId)
    userImage = try container.decodeIfPresent(String.self, forKey: .userImage)
    isFavorite = try container.decodeIfPresent(Bool.self, forKey: .isFavorite)
    categoryId = try container.decodeIfPresent(Int.self, forKey: .categoryId)
    categoryEnName = try container.decodeIfPresent(String.self, forKey: .categoryEnName)
    lng = try container.decodeIfPresent(String.self, forKey: .lng)
    phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
    updatecount = try container.decodeIfPresent(Int.self, forKey: .updatecount)
    packageId = try container.decodeIfPresent(Int.self, forKey: .packageId)
    typeId = try container.decodeIfPresent(Int.self, forKey: .typeId)
    lat = try container.decodeIfPresent(String.self, forKey: .lat)
    categoryArName = try container.decodeIfPresent(String.self, forKey: .categoryArName)
    arLocation = try container.decodeIfPresent(String.self, forKey: .arLocation)
    price = try container.decodeIfPresent(Int.self, forKey: .price)
    chates = try container.decodeIfPresent(Int.self, forKey: .chates)
  }

}
