//
//  UserProfileExperienceRepresentable.swift
//  HarriTask
//
//  Created by Harri on 11/3/19.
//  Copyright © 2019 Harri. All rights reserved.
//
import Foundation
import UIKit

class UserProfileExperienceRepresentable: BaseCellRepresentable {
    var cellType: UIView.Type
    let cellReuseIdentifier: String
    let positionTitle: String
    let positionDescription: String
    let brandName: String
    
    required init (item: Work) {
        if let positionTitle = item.customPosition {
            self.positionTitle = positionTitle
        } else {
            self.positionTitle = "Is looking for their first job"
        }
        positionDescription = item.description
        brandName = item.brand.name
        cellReuseIdentifier = UserExperienceTableViewCell.getReuseIdentifier()
        cellType = UserExperienceTableViewCell.self
    }
}
