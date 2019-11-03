//
//  UserProfileAvailabilityRepresentable.swift
//  HarriTask
//
//  Created by Harri on 11/3/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation

class UserProfileAvailabilityRepresentable: BaseCellRepresentable {
    let cellReuseIdentifier: String
    let titleString: String
    init(item: String) {
        availabilityString = item
        cellReuseIdentifier = UserProfileWithCollectionViewTableViewCell.getReuseIdentifier()
    }
}
