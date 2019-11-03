//
//  UserProfileModel.swift
//  HarriTask
//
//  Created by Harri on 10/31/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation

class UserProfileModel {
    
    let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func getUserProfile(completion: @escaping(Result<UserProfileResponse, APIError>) -> Void) {
        AlamoFireManager.getUserPrfoile(with: self.userId) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
