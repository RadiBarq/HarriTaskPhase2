//
//  AlmoFireManager.swift
//  HarriTask
//
//  Created by Harri on 10/30/19.
//  Copyright © 2019 Harri. All rights reserved.
//
import Alamofire
import Foundation

struct AlamoFireManager {
    static var userProfileURLString = "https://api.harridev.com/api/v1/profile/member"
    static func getUserPrfoile(with id: String, completion: @escaping(Swift.Result<UserProfileResponse, APIError>) -> Void) {
        let urlString = userProfileURLString + "/\(id)"
        guard let url = URL(string: urlString) else {
            return
        }
        Alamofire.request(url,
                          method: .get)
            .responseJSON { response in
                guard response.result.isSuccess, let jsonData = response.data else {
                    completion(.failure(.responseProblem))
                    return
                }
                do {
                    print(response)
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .useDefaultKeys
                    let userProfileData = try decoder.decode(UserProfileData.self, from: jsonData)
                    completion(.success(userProfileData.data))
                } catch (let error) {
                    print(error)
                    completion(.failure(.decodingProblem))
                }
        }
    }
}
