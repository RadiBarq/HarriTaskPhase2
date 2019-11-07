//
//  TableSectionRepresentable.swift
//  HarriTask
//
//  Created by Harri on 10/31/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation
import UIKit

class TableSectionRepresentable: BaseCellRepresentable {
    var cellReuseIdentifier: String
    var cells: [BaseCellRepresentable]
    var headerTitle: String
    
    init(cells: [BaseCellRepresentable], headerTitle: String) {
        self.cells = cells
        self.headerTitle = headerTitle
        cellReuseIdentifier = ""
    }
}

