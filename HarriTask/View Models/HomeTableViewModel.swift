//
//  HomeTableViewModel.swift
//  HarriTask
//
//  Created by Harri on 10/16/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation
import UIKit

class HomeTableViewModel: BaseViewModel {
    
    var representables: [HomeTableViewRepresentable]
    
    func representableForRow(at indexPath: IndexPath) -> HomeTableViewRepresentable? {
            indexPath.row >= 0 ? self.representables[indexPath.row] : nil
    }
    
    var items: [UserSearchResult]

    required init(items: [UserSearchResult]) {
        self.items = items
        representables = []
    }
    
     func add(items: [UserSearchResult]) {
        self.items += items
    }

    func buildRepresentables(from start: Int) {
        for item in items[start..<items.count] {
            let representable = HomeTableViewRepresentable(item: item)
            self.representables.append(representable)
        }
    }
}

extension HomeTableViewModel: TableViewModel {
    func numberOfRows(inSection section: Int) -> Int {
        self.representables.count
    }
    
    func heightForFooterInSection(inSection section: Int) -> CGFloat {
        return 105.5
    }
    
    func viewForFooterInSection(inSection section: Int) -> UIView? {
            let footerView = HomeTableFooterView()
            return footerView
    }
    
    func shouldSpringLoadRowAt(at indexPath: IndexPath) -> Bool {
        return false
    }
}
