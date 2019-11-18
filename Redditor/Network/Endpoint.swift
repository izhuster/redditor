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
        return [:]
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .top:
            return .get
        }
    }
    
    func createRequest() -> URLRequest? {
        guard var url = URL(string: baseURLString) else {
            return nil
        }
        
        url.appendPathComponent(path)
        // append parameters
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.value
        return urlRequest
    }
}
