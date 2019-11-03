//
//  UserProfileAboutRepresentable.swift
//  HarriTask
//
//  Created by Harri on 11/3/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation

class UserProfileAboutRepresentable: BaseCellRepresentable {
    let bioString: String
    let cellReuseIdentifier: String
    required init(item: UserProfileResponse) {
        bioString = item.userInfo.about
        cellReuseIdentifier = UserProfileAboutTableViewCell.getReuseIdentifier()
    }
}
