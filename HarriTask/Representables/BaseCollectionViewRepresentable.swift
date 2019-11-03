//
//  BaseCollectionViewRepresentable.swift
//  HarriTask
//
//  Created by Harri on 11/3/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation

protocol BaseCollectionViewRepresentable: BaseCellRepresentable{
    var title: String { get }
    init(item: String)
}
