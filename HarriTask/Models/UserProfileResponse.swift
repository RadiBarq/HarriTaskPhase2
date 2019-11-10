//
//  UserProfileResponse.swift
//  HarriTask
//
//  Created by Harri on 10/30/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation

struct UserProfileData: Decodable {
    let data: UserProfileResponse
}

struct UserProfileResponse: Decodable {
    let backgroundImage: String
    let profileImage: String
    let currentJob: String?
    let availability: [String: Bool]
    let userProfile: UserProfile
    let experience: [Experience]
    let userSkill: [UserSkill]
    let userInfo: UserInfo
    
    enum CodingKeys: String, CodingKey {
             case backgroundImage = "background_image"
             case profileImage = "profile_image"
             case currentJob = "current_job"
             case availability = "availability"
             case userProfile = "user_profile"
             case experience = "experience"
             case userSkill = "user_skill"
             case userInfo = "user_info"
      }
}

struct UserProfile: Decodable {
    let bio: String?
}

struct Experience: Decodable {
    let work: Work
    enum CodingKeys: String, CodingKey {
        case work = "Work"
    }
}

struct Work: Decodable {    
     let brand: Brand
     let customPosition: String?
     let description: String
     let startDate: String
     let endDate: String?

    enum CodingKeys: String, CodingKey {
           case brand = "Brand"
           case customPosition = "custom_position"
           case description = "description"
           case startDate = "start_date"
           case endDate = "end_date"
    }
}

struct Brand: Decodable {
    let name: String
}

struct UserSkill: Decodable {
    let code: String
    let id: Int
    let name: String
}

struct UserInfo: Decodable {
    let username: String?
    let about: String?
    let id: Int
}

