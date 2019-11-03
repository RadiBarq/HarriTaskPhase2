//
//  UserProfileTableViewModel.swift
//  HarriTask
//
//  Created by Harri on 10/31/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation

class UserProfileTableViewModel: BaseViewModel {
    
    var representables: [TableSectionRepresentable]
    func representableForRow(at indexPath: IndexPath) -> TableSectionRepresentable? {
        //  indexPath.row >= 0 ? self.representables[indexPath.row] : nil
        return nil
    }
    
    var items: [UserProfileResponse]
    
    required init(items: [UserProfileResponse]) {
        self.items = items
        representables = []
    }
    
    func add(items: [UserProfileResponse]) {
        self.items += items
    }
    
    func buildRepresentables(from start: Int) {
        
        var currentRepresentables = [[BaseCellRepresentable]]()
        currentRepresentables.append([UserProfileHeaderRepresentable(item: items[0])])
        currentRepresentables.append([UserProfileAboutRepresentable(item: items[0])])
        var userExperienceRepresentable = [UserProfileExperienceRepresentable]()
        var userSkillRepresentable = [UserProfileSkillRepresentable]()
        var userAvailabilityRepresentable = [UserProfileAvailabilityRepresentable]()
        for experience in items[0].experience {
            userExperienceRepresentable.append(UserProfileExperienceRepresentable(item: experience.work))
        }
        for skill in items[0].userSkill {
            userSkillRepresentable.append(UserProfileSkillRepresentable(item: skill))
        }
        for availability in Array(items[0].availability.keys) {
            userAvailabilityRepresentable.append(UserProfileAvailabilityRepresentable(item: availability))
        }
        currentRepresentables.append(userExperienceRepresentable)
        currentRepresentables.append(userSkillRepresentable)
        currentRepresentables.append(userAvailabilityRepresentable)
        
        for i in currentRepresentables {
            
            representables.append(TableSectionRepresentable(cells: i))
        }
    }
}
