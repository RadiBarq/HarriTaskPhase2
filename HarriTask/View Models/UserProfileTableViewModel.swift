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
    
    func representableHeaderForRow(at section: Int) -> BaseCellRepresentable {
        switch section {
        case 0:
            return UserProfileHeaderRepresentable(item: items[0])
        default:
            return UserProfileSectionHeaderRepresentable(title: representables[section].headerTitle)
        }
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
        let headerTitles = ["Header", "About", "Experience", "Skills", "Availability"]
        var currentRepresentables = [[BaseCellRepresentable]]()
        currentRepresentables.append([UserProfileHeaderRepresentable(item: items[0])])
        currentRepresentables.append([UserProfileAboutRepresentable(item: items[0])])
        var userExperienceRepresentable = [UserProfileExperienceRepresentable]()
        let userSkilRepresentable = [UserProfileCollectionViewRepresentable(titles: items[0].userSkill.map{ $0.name })]
        let userAvailabilityRepresentable = [UserProfileCollectionViewRepresentable(titles: Array( items[0].availability.keys))]
        for experience in items[0].experience {
            userExperienceRepresentable.append(UserProfileExperienceRepresentable(item: experience.work))
        }
        currentRepresentables.append(userExperienceRepresentable)
        currentRepresentables.append(userSkilRepresentable)
        currentRepresentables.append(userAvailabilityRepresentable)
        var itemIndex = 0
        for i in currentRepresentables {
            representables.append(TableSectionRepresentable(cells: i, headerTitle: headerTitles[itemIndex]))
            itemIndex = itemIndex + 1
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
    
    func heightForHeaderInSection(in section: Int) -> CGFloat {
        switch section {
        case 0:
            return 272
        default:
            return 33
        }
    }
}
