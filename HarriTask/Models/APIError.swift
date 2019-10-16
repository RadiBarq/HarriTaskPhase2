//
//  APIError.swift
//  HarriTask
//
//  Created by Harri on 10/13/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation

enum APIError: Error {
    
    // Error with response status code not 200 or data is empty
    case responseProblem
    
    // Error with the incoming data format not as expected
    case decodingProblem
    
    // Error with encoding the body data
    case encodingProblem
}
