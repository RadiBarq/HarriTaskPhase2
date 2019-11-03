//
//  UserProfileExperienceRepresentable.swift
//  HarriTask
//
//  Created by Harri on 11/3/19.
//  Copyright © 2019 Harri. All rights reserved.
//
import Foundation

class UserProfileExperienceRepresentable: BaseCellRepresentable {
    let cellReuseIdentifier: String
    let positionTitle: String
    let positionDescription: String
    let brandName: String
    
    required init (item: Work) {
        positionTitle = item.customPosition
        positionDescription = item.description
        brandName = item.brand.name
        cellReuseIdentifier = UserExperienceTableViewCell.getReuseIdentifier()
    }
}
