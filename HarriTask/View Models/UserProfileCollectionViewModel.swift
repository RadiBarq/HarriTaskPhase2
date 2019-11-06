//
//  UserProfileCollectionViewModel.swift
//  HarriTask
//
//  Created by Harri on 11/3/19.
//  Copyright © 2019 Harri. All rights reserved.
//
import Foundation

class UserProfileCollectionViewModel: BaseViewModel {
    var representables: [UserProfileCollectionViewCellRepresentable]
    var items: [String]
    
    required init(items: [String]) {
        self.items = items
        representables = []
        self.buildRepresentables(from: 0)
    }
    
    func representableForRow(at indexPath: IndexPath) -> UserProfileCollectionViewCellRepresentable? {
        indexPath.row >= 0 ? self.representables[indexPath.row] : nil
    }
    
    func add(items: [String]) {
           self.items += items
           self.buildRepresentables(from: 0)
    }
    
    func buildRepresentables(from start: Int) {
        for item in items {
            representables.append(UserProfileCollectionViewCellRepresentable(item: item))
        }
    }
}

extension UserProfileCollectionViewModel: TableViewModel {
    func numberOfRows(inSection section: Int) -> Int {
          self.representables.count
      }
}
