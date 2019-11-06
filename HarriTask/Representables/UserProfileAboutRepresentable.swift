//
//  UserProfileAboutRepresentable.swift
//  HarriTask
//
//  Created by Harri on 11/3/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation
import UIKit

class UserProfileAboutRepresentable: BaseCellRepresentable {
    var cellType: UIView.Type
    let bioString: String
    let cellReuseIdentifier: String
    required init(item: UserProfileResponse) {
        bioString = item.userInfo.about
        cellReuseIdentifier = UserProfileAboutTableViewCell.getReuseIdentifier()
        cellType = UserProfileAboutTableViewCell.self
    }
}
