//
//  Endpoint.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 17/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import Foundation

enum Endpoint {
    case top
    
    var baseURLString: String {
        return Environment.baseURLString
    }
    
    var path: String {
        switch self {
        case .top:
            return "top.json"
        }
    }
    
    var parameters: [String: String] {
        return ["limit": "50"]
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .top:
            return .get
        }
    }
    
    func createRequest() -> URLRequest? {
        
        var baseUrl = baseURLString
        
        if parameters.isEmpty {
            baseUrl += path
        } else {
            let pathCompoenent = "\(path)?\(parameters.toURLEncodedString())"
            baseUrl += pathCompoenent
        }
        
        guard let url = URL(string: baseUrl) else {
            return nil
        }
        
        // append parameters
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.value
        return urlRequest
    }
}
