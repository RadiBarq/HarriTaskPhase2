//
//  BaseTableViewCell.swift
//  HarriTask
//
//  Created by Harri on 11/3/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import UIKit

protocol BaseCell {
    associatedtype RepresentableType: BaseCellRepresentable
    func setup(representable: RepresentableType)
    static func getReuseIdentifier() -> String
}
