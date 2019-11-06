//
//  CollectionViewBaseRepresentable.swift
//  HarriTask
//
//  Created by Harri on 11/3/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation
import UIKit

class UserProfileCollectionViewCellRepresentable: BaseCollectionViewRepresentable {
    var cellType: UIView.Type
    let cellReuseIdentifier: String
    let title: String 
    required init(item: String) {
        title = item
        cellReuseIdentifier = UserProfileWithCollectionViewTableViewCell.getReuseIdentifier()
        cellType = UserProfileWithCollectionViewTableViewCell.self
    }
}
