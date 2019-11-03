//
//  UserProfileCollectionViewModel.swift
//  HarriTask
//
//  Created by Harri on 11/3/19.
//  Copyright © 2019 Harri. All rights reserved.
//
import Foundation

class UserProfileCollectionViewModel {
    var representables: [UserProfileCollectionViewCellRepresentable]
    var items: [String]
    required init(items: [String]) {
        self.items = items
        representables = []
    }
    func representableForRow(at indexPath: IndexPath) -> BaseCellRepresentable?{
        return nil
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
