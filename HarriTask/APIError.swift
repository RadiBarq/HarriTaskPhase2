//
//  APIError.swift
//  HarriTask
//
//  Created by Harri on 10/13/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation

enum APIError: Error {
    case responseProblem
    case decodingProblem
    case encodingProblem
}
