//
//  CollectionViewBaseRepresentable.swift
//  HarriTask
//
//  Created by Harri on 11/3/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation

class UserProfileSkillRepresentable: BaseCollectionViewRepresentable{
    let cellReuseIdentifier: String
    let titleString: String
    init(item: String) {
        titleString = item
        cellReuseIdentifier = UserProfileWithCollectionViewTableViewCell.getReuseIdentifier()
    }
}
