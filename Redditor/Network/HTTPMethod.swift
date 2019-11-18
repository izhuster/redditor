//
//  HTTPMethod.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 17/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    
    var value: String {
        return rawValue
    }
}
