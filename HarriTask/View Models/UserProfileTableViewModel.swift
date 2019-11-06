//
//  UserProfileTableViewModel.swift
//  HarriTask
//
//  Created by Harri on 10/31/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation
import UIKit

class UserProfileTableViewModel: BaseViewModel {
    var representables: [TableSectionRepresentable]
    
    func representableForRow(at indexPath: IndexPath) -> BaseCellRepresentable? {
        indexPath.row >= 0 ? self.representables[indexPath.section].cells[indexPath.row] : nil
    }
    
    var items: [UserProfileResponse]
    
    required init(items: [UserProfileResponse]) {
        self.items = items
        self.representables = []
        //  self.buildRepresentables(from: 0)
    }
    
    func add(items: [UserProfileResponse]) {
        self.items += items
        self.buildRepresentables(from: 0)
    }
    
    func buildRepresentables(from start: Int) {
        if items.isEmpty { return }
        var currentRepresentables = [[BaseCellRepresentable]]()
        currentRepresentables.append([UserProfileHeaderRepresentable(item: items[0])])
        currentRepresentables.append([UserProfileAboutRepresentable(item: items[0])])
        var userExperienceRepresentable = [UserProfileExperienceRepresentable]()
        var userSkilRepresentable = [UserProfileCollectionViewRepresentable(titles: items[0].userSkill.map{ $0.name })]
        var userAvailabilityRepresentable = [UserProfileCollectionViewRepresentable(titles: Array( items[0].availability.keys))]
        for experience in items[0].experience {
            userExperienceRepresentable.append(UserProfileExperienceRepresentable(item: experience.work))
        }
        currentRepresentables.append(userExperienceRepresentable)
        currentRepresentables.append(userSkilRepresentable)
        currentRepresentables.append(userAvailabilityRepresentable)
        for i in currentRepresentables {
            representables.append(TableSectionRepresentable(cells: i))
        }
    }
}

extension UserProfileTableViewModel: TableViewModel {
    func numberOfRows(inSection section: Int) -> Int {
        switch section {
        case 0:
            return 0
        default:
            return self.representables[section].cells.count
        }
    }
    
    func numberOfSections() -> Int {
        self.representables.count
    }
    
    func heightForRow(in section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0.0
        default:
            return 10.0
        }
    }
}
