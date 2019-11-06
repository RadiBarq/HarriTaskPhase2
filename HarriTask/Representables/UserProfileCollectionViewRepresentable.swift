//
//  UserProfileCollectionViewRepresentable.swift
//  HarriTask
//
//  Created by Harri on 11/6/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation
class UserProfileCollectionViewRepresentable: BaseCellRepresentable {
    var cellReuseIdentifier: String = UserProfileWithCollectionViewTableViewCell.getReuseIdentifier()
    var titles = [String]()

    init(titles: [String]) {
        self.titles = titles
        cellReuseIdentifier = UserProfileWithCollectionViewTableViewCell.getReuseIdentifier()
    }
}
