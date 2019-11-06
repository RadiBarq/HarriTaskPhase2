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

    required init(item: UserProfileResponse) {
        self.fullName = item.userInfo.username
        self.backgroundImageURL = item.backgroundImage
        self.imageURL = item.profileImage
        self.positionTitle = item.currentJob
        self.cellReuseIdentifier = UserProfileTableViewHeaderCell.getReuseIdentifier()
        cellType = UITableViewHeaderFooterView.self
    }
    
}
