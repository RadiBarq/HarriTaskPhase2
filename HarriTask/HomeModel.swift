//
//  HomeModel.swift
//  HarriTask
//
//  Created by Harri on 10/13/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation

class HomeModel {
    
    var networkManager: NetworkManager = NetworkManager()
    var result = [UserSearchResult]()
    var start = 0;
    func getUserSearch(completion: @escaping(Array<UserSearchResult>) -> Void) {
        let bodyData = UserSearchBodyData(size: 20, start: start, locations: ["40.7127753","-74.0059728"])
        networkManager.getUserSearch(bodyData: bodyData) { result in
            switch result {
            case .success(let response):
                self.start = self.start + 20
                self.result = self.result + response.data.results
                completion(response.data.results)
            case .failure(let type):
                switch type {
                case .responseProblem:
                    print("response problem, connection problem happened")
                case .decodingProblem, .encodingProblem:
                    print("encoding, decoding problem happened")
                }
            }
        }
    }
    
    func getImageURLFor(userId: Int, imageUDID: String) -> String {

        let imageURL = "https://d7f8bv52wga7t.cloudfront.net/users/" + String(userId) + "/user_profile/" + imageUDID + "/240_240.jpeg"
        return imageURL
    }
}
