//
//  MemberExtension.swift
//  ApiModelSerialize
//
//  Created by mc Lee on 2022/4/22.
//

import UIKit
import SwiftyJSON
import Common

extension Member: ISwiftyJson {
    
    public func dFromJSON(json: JSON) {
        Id = json["Id"].intValue
        NickName = json["NickName"].stringValue
        Gender = Common.Gender(rawValue: json["Gender"].intValue)!
        VipLevel = VipLevels(rawValue: json["VipLevel"].intValue)!
        Avatar = json["Avatar"].string
        AvatarIcon = json["AvatarIcon"].string
        Recording = json["Recording"].string
        Country = json["Country"].string
        Province = json["Province"].string
        City = json["City"].string
        Distance = json["Distance"].string
        LastActiveS = json["LastActiveS"].string
        OnlineStatus = MemberOnlineStatus(rawValue: json["OnlineStatus"].intValue)!
        Age = json["Age"].intValue
        PhotosCount = json["PhotosCount"].int
        VerifyVideo = json["VerifyVideo"].fToObject()
        Profile = json["Profile"].fToObject()
        ContactInfos = json["ContactInfos"].fToArray()
        ContactWays = json["ContactWays"].fToDictionary()
        PublicBodyShows = json["PublicBodyShows"].fToArray()
        PrivateBodyShows = json["PrivateBodyShows"].fToArray()
        IsPartial = json["IsPartial"].bool
        HotTags = json["HotTags"].fToArray()
        ViewCount = json["ViewCount"].int
    }
    
    public func dToJSON() -> JSON {
        var json = JSON()
        json["Id"].intValue = Id
        json["NickName"].string = NickName
        json["Gender"].int = Gender.rawValue
        json["VipLevel"].int = VipLevel.rawValue
        if let d = Avatar {
            json["Avatar"].string = d
        }
        if let d = AvatarIcon {
            json["AvatarIcon"].string = d
        }
        if let d = Recording {
            json["Recording"].string = d
        }
        if let d = Country {
            json["Country"].string = d
        }
        if let d = Province {
            json["Province"].string = d
        }
        if let d = City {
            json["City"].string = d
        }
        if let d = Distance {
            json["Distance"].string = d
        }
        if let d = LastActiveS {
            json["LastActiveS"].string = d
        }
        json["OnlineStatus"].int = OnlineStatus.rawValue
        json["Age"].int = Age
        if let d = PhotosCount {
            json["PhotosCount"].int = d
        }
        if let d = VerifyVideo {
            json["VerifyVideo"] = d.dToJSON()
        }
        if let d = Profile {
            json["Profile"] = d.dToJSON()
        }
        if let d = ContactInfos {
            json["ContactInfos"] = d.dToJSON()
        }
        if let d = ContactWays {
            json["ContactWays"] = d.dToJSON()
        }
        if let d = PublicBodyShows {
            json["PublicBodyShows"] = d.dToJSON()
        }
        if let d = PrivateBodyShows {
            json["PrivateBodyShows"] = d.dToJSON()
        }
        if let d = HotTags {
            json["HotTags"] = d.dToJSON()
        }
        if let d = ViewCount {
            json["ViewCount"].int = d
        }
        if let d = IsPartial {
            json["IsPartial"].bool = d
        }
        return json
    }
    
}

extension UserProfileJson: ISwiftyJson {
    
    public func dFromJSON(json: JSON) {
        Introduction = json["Introduction"].string
        PostCode = json["PostCode"].string
        LookForGenders = json["LookForGenders"].fToArray()
        Version = json["Version"].string
        if let h = json["Height"].int {
            Height = h
        } else if let h = json["Height"].string {
            Height = Int(h)
        }
        Weight = json["Weight"].int
        WeightLb = json["WeightLb"].int
        HeightFt = json["HeightFt"].string
        WinkMsg = json["WinkMsg"].string
        City = json["City"].string
        Province = json["Province"].string
        Birthday = json["Birthday"].fToDate()
        School = json["School"].string
        Sign = json["Sign"].string
        Industry = json["Industry"].string
        Job = json["Job"].string
        Education = json["Education"].string
        Income = json["Income"].string
        Tags = json["Tags"].fToArray()
        Drinking = json["Drinking"].string
        Smoking = json["Smoking"].string
        Living = json["Living"].string
        Kids = json["Kids"].string
        Company = json["Company"].string
        Mariage = json["Mariage"].string
        Exercise = json["Exercise"].string
        PersonalityTags = json["PersonalityTags"].fToArray()
        FavoriteSportTags = json["FavoriteSportTags"].fToArray()
        FavoriteMusicTags = json["FavoriteMusicTags"].fToArray()
        FavoriteFoodTags = json["FavoriteFoodTags"].fToArray()
        if let p: [String] = json["Purpose"].fToArray() {
            Purpose = p
        } else if let p = json["Purpose"].string {
            Purpose = [p]
        }
        ReplationShip = json["ReplationShip"].string
        BodyType = json["BodyType"].string
        EyeColor = json["EyeColor"].string
        HairColor = json["HairColor"].string
        Ethnicity = json["Ethnicity"].string
        Religion = json["Religion"].string
        Personality = json["Personality"].string
        Languages = json["Languages"].string
        Pets = json["Pets"].string
        ExpectRelation = json["ExpectRelation"].string
        OneNightExp = json["OneNightExp"].string
        AboutSex = json["AboutSex"].string
        ExpectSexExp = json["ExpectSexExp"].string
        ExpectSexPlace = json["ExpectSexPlace"].string
        Hobbies = json["Hobbies"].fToArray()
        RelationHistory = json["RelationHistory"].string
        FirstIntimacy = json["FirstIntimacy"].string
        Faith = json["Faith"].string
        AdditionalData = json["AdditionalData"].fToDictionary()
    }
    
    public func dToJSON() -> JSON {
        var json = JSON()
        if let d = Introduction {
            json["Introduction"].string = d
        }
        if let d = PostCode {
            json["PostCode"].string = d
        }
        if let d = LookForGenders {
            // Warning: 手动修改，自动生成的时候注意
            var gs = [Int]()
            for g in d {
                gs.append(g.rawValue)
            }
            json["LookForGenders"].arrayObject = gs
        }
        if let d = Version {
            json["Version"].string = d
        }
        if let d = Height {
            json["Height"].int = d
        }
        if let d = Weight {
            json["Weight"].int = d
        }
        if let d = WeightLb {
            json["WeightLb"].int = d
        }
        if let d = HeightFt {
            json["HeightFt"].string = d
        }
        if let d = WinkMsg {
            json["WinkMsg"].string = d
        }
        if let d = City {
            json["City"].string = d
        }
        if let d = Province {
            json["Province"].string = d
        }
        if let d = Birthday {
            json["Birthday"].string = FormatUtil.pISODateFormatter.string(from: d)
        }
        if let d = School {
            json["School"].string = d
        }
        if let d = Sign {
            json["Sign"].string = d
        }
        if let d = Industry {
            json["Industry"].string = d
        }
        if let d = Job {
            json["Job"].string = d
        }
        if let d = Education {
            json["Education"].string = d
        }
        if let d = Income {
            json["Income"].string = d
        }
        if let d = Tags {
            json["Tags"].arrayObject = d
        }
        if let d = Drinking {
            json["Drinking"].string = d
        }
        if let d = Smoking {
            json["Smoking"].string = d
        }
        if let d = Living {
            json["Living"].string = d
        }
        if let d = Kids {
            json["Kids"].string = d
        }
        if let d = Company {
            json["Company"].string = d
        }
        if let d = Mariage {
            json["Mariage"].string = d
        }
        if let d = Exercise {
            json["Exercise"].string = d
        }
        if let d = PersonalityTags {
            json["PersonalityTags"].arrayObject = d
        }
        if let d = FavoriteSportTags {
            json["FavoriteSportTags"].arrayObject = d
        }
        if let d = FavoriteMusicTags {
            json["FavoriteMusicTags"].arrayObject = d
        }
        if let d = FavoriteFoodTags {
            json["FavoriteFoodTags"].arrayObject = d
        }
        if let d = Purpose {
            json["Purpose"].arrayObject = d
        }
        if let d = ReplationShip {
            json["ReplationShip"].string = d
        }
        if let d = BodyType {
            json["BodyType"].string = d
        }
        if let d = EyeColor {
            json["EyeColor"].string = d
        }
        if let d = HairColor {
            json["HairColor"].string = d
        }
        if let d = Ethnicity {
            json["Ethnicity"].string = d
        }
        if let d = Religion {
            json["Religion"].string = d
        }
        if let d = Personality {
            json["Personality"].string = d
        }
        if let d = Languages {
            json["Languages"].string = d
        }
        if let d = Pets {
            json["Pets"].string = d
        }
        if let d = ExpectRelation {
            json["ExpectRelation"].string = d
        }
        if let d = OneNightExp {
            json["OneNightExp"].string = d
        }
        if let d = AboutSex {
            json["AboutSex"].string = d
        }
        if let d = ExpectSexExp {
            json["ExpectSexExp"].string = d
        }
        if let d = ExpectSexPlace {
            json["ExpectSexPlace"].string = d
        }
        if let d = Hobbies {
            json["Hobbies"].arrayObject = d
        }
        if let d = RelationHistory {
            json["RelationHistory"].string = d
        }
        if let d = FirstIntimacy {
            json["FirstIntimacy"].string = d
        }
        if let d = Faith {
            json["Faith"].string = d
        }
        if let d = AdditionalData {
            json["AdditionalData"].dictionaryObject = d
        }
        return json
    }
    
}

extension UserContactInfo: ISwiftyJson {
    
    func dFromJSON(json: JSON) {
        ContactPlatform = json["ContactPlatform"].stringValue
        ContactContent = json["ContactContent"].string
        ConatctPlatfromIcon = json["ConatctPlatfromIcon"].string
    }
    
    func dToJSON() -> JSON {
        var json = JSON()
        json["ContactPlatform"].string = ContactPlatform
        
        if let d = ContactContent {
            json["ContactContent"].string = d
        }
        if let d = ConatctPlatfromIcon {
            json["ConatctPlatfromIcon"].string = d
        }
        return json
    }
    
}
