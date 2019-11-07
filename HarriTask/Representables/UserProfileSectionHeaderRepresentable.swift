//
//  UserProfileSectionHeaderRepresentable.swift
//  HarriTask
//
//  Created by Harri on 11/7/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation

class UserProfileSectionHeaderRepresentable: BaseCellWithTitleRepresentable {
    var title: String
    var cellReuseIdentifier: String
    
    init(title: String) {
        self.title = title
        cellReuseIdentifier = UserProfileTableViewSectionHeader.getReuseIdentifier()
    }
}
