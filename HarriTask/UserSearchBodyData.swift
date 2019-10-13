//
//  BodyModel.swift
//  HarriTask
//
//  Created by Harri on 10/13/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation

class UserSearchBodyData: Encodable {
    
    let size: Int
    let start: Int
    let locations: Array<String>

    init (size: Int, start: Int, locations: Array<String>) {
        self.size = size
        self.start = start
        self.locations = locations
    }
    
}
