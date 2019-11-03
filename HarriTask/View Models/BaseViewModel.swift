//
//  BaseViewModel.swift
//  HarriTask
//
//  Created by Harri on 10/31/19.
//  Copyright © 2019 Harri. All rights reserved.
//
import Foundation

protocol BaseViewModel {
    associatedtype ItemType: Decodable
    associatedtype RepresentableType
    var representables: [RepresentableType] { get set }
    var items: [ItemType] { get set }
    init(items: [ItemType])
    func representableForRow(at indexPath: IndexPath) -> RepresentableType?
    func buildRepresentables(from start: Int)
}

