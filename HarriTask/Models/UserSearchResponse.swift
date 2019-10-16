//
//  File.swift
//  HarriTask
//
//  Created by Harri on 10/13/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation

class UserSearchResponse: Decodable {
    let data: UserSearchData
    init(data: UserSearchData) {
        self.data = data
    }
}

class UserSearchData: Decodable {
    let results: [UserSearchResult]
    init(results: [UserSearchResult]) {
        self.results = results
    }
}

class UserSearchResult: Decodable {
    let firstName: String
    let lastName: String
    let id: Int
    let isFirstJob: Bool
    let profileImageUUID: String?
    let position: Position?
}

class Position: Decodable {
    let brandName: String
    let name: String
}


