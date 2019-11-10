//
//  UserProfileHeaderRepresentable.swift
//  HarriTask
//
//  Created by Harri on 10/31/19.
//  Copyright © 2019 Harri. All rights reserved.
//
import Foundation
import UIKit

class UserProfileHeaderRepresentable: BaseUserProfileRepresentable{
    var cellType:  UIView.Type
    let cellReuseIdentifier: String
    let fullName: String
    let backgroundImageURL: String
    let positionTitle: String
    let imageURL: String
    let userId: Int
    
    required init(item: UserProfileResponse) {
        self.fullName = item.userInfo.username ?? ""
        self.userId = item.userInfo.id
        if let currentJob = item.currentJob {
            positionTitle = currentJob
        } else {
            positionTitle = "is looking for their first job"
        }
        imageURL = NetworkManager.imageURLString + String(userId) + "/user_profile/" + item.profileImage + "/240_240.jpeg"
        backgroundImageURL = NetworkManager.imageURLString + String(userId) + "/user_profile/" + item.backgroundImage + "/240_240.jpeg"
        self.cellReuseIdentifier = UserProfileTableViewHeaderCell.getReuseIdentifier()
        cellType = UITableViewHeaderFooterView.self
    }
}
