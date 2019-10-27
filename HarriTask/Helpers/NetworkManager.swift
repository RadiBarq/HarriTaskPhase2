//
//  File.swift
//  HarriTask
//
//  Created by Harri on 10/13/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation
struct NetworkManager {
    let userSeachURL = URL(string: "https://api.harridev.com/api/v1/harri_search/search_users")
    static let imageURLString = "https://d7f8bv52wga7t.cloudfront.net/users/"
    
    func getUserSearch(bodyData: UserSearchBodyData, completion: @escaping(Result<UserSearchResponse, APIError>) -> Void) {
        do {
            guard let url = userSeachURL else { return }
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField:  "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(bodyData)
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response,_ in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                    completion(.failure(.responseProblem))
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(UserSearchResponse.self, from: jsonData)
                    completion(.success(response))
                } catch {
                    print(error)
                    completion(.failure(.decodingProblem))
                }
            }
            dataTask.resume()
        } catch {
            completion(.failure(.encodingProblem))
        }
    }
}


