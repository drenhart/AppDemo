//
//  UserProfileJson.swift
//  Common
//
//  Created by mc Lee on 2022/4/21.
//

import Foundation

public class UserProfileJson: ServerModel {

    open var Introduction: String?
    open var PostCode: String?
    open var LookForGenders: [Gender]?
    open var Height: Int?
    open var Weight: Int?
    open var WeightLb: Int?
    open var HeightFt: String?
    open var WinkMsg: String?
    open var City: String?
    open var Province: String?
    open var Birthday: Date?
    open var SurveyAnswers: [QuestionAndAnswer]?
    open var Sign: String?
    open var Industry: String?
    open var Job: String?
    open var Education: String?
    open var Income: String?
    open var Tags: [String]?
    open var Drinking: String?
    open var Smoking: String?
    open var Living: String?
    open var Kids: String?
    open var Company: String?
    open var Purpose: [String]?

    open var ReplationShip: String?
    open var BodyType: String?
    open var EyeColor: String?
    open var HairColor: String?
    open var Ethnicity: String?
    open var Religion: String?
    open var Personality: String?
    open var Languages: String?
    open var Pets: String?
    open var ExpectRelation: String?
    open var OneNightExp: String?
    open var AboutSex: String?
    open var ExpectSexExp: String?
    open var ExpectSexPlace: String?
    open var Hobbies: [String]?
    open var Version: String?
    open var School: String?
    open var Mariage: String?
    open var Exercise: String?
    open var PersonalityTags: [String]?
    open var FavoriteSportTags: [String]?
    open var FavoriteMusicTags: [String]?
    open var FavoriteFoodTags: [String]?
    open var RelationHistory: String?
    open var FirstIntimacy: String?
    open var AdditionalData: [String: String]?
    open var Faith: String?
}
