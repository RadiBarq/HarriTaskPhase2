//
//  HomeTableViewModel.swift
//  HarriTask
//
//  Created by Harri on 10/16/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation
import UIKit
struct HomeTableViewModel {
    var representables = [HomeTableViewRepresentable]()
    var items: [UserSearchResult]
    
    var customRefreshControl: UIRefreshControl = {
        var refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor(red: 74/255 , green: 144/255, blue: 226/255, alpha: 255/255)
        return refreshControl
    }()
    
    init(items: [UserSearchResult]) {
        self.items = items
    }
    
    mutating func add(items: [UserSearchResult]) {
        self.items += items
    }
    
    func representableForRow(at indexPath: IndexPath) -> HomeTableViewRepresentable? {
        indexPath.row >= 0 ? self.representables[indexPath.row] : nil
    }
    
    mutating func buildRepresentables(from start: Int) {
        for item in items[start..<items.count] {
            let representable = HomeTableViewRepresentable(firstName: item.firstName, lastName: item.lastName, position: item.position, isFirstJob: item.isFirstJob, userId: item.id, imageUUID: item.profileImageUUID)
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
        if !customRefreshControl.isRefreshing {
            let footerView = HomeTableFooterView()
            return footerView
        }
        return nil
    }
    
    func shouldSpringLoadRowAt(at indexPath: IndexPath) -> Bool {
        return true
    }
}
