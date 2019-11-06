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
    var cellType: UIView.Type = UIView.self
    var cellReuseIdentifier: String = ""
    var cells: [BaseCellRepresentable] = []
    
    init(cells: [BaseCellRepresentable]) {
        self.cells = cells
    }
}

