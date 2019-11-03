//
//  BaseUserProfileRepresentable.swift
//  HarriTask
//
//  Created by Harri on 10/31/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation

protocol BaseUserProfileRepresentable: BaseCellRepresentable {
    var fullName: String { get }
    var imageURL: String { get }
}

