//
//  CollectionViewBaseRepresentable.swift
//  HarriTask
//
//  Created by Harri on 11/3/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation

class UserProfileCollectionViewCellRepresentable: BaseCollectionViewRepresentable {
    let cellReuseIdentifier: String
    let title: String 
    required init(item: String) {
        title = item
        cellReuseIdentifier = UserProfileWithCollectionViewTableViewCell.getReuseIdentifier()
    }
}
