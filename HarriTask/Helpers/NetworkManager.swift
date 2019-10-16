//
//  File.swift
//  HarriTask
//
//  Created by Harri on 10/13/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation
struct NetworkManager {
    var userSeachURL = URL(string: "https://api.harridev.com/api/v1/harri_search/search_users")
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
                    if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
                                         print(JSONString)
                        }
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


