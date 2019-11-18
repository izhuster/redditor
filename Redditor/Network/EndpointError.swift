//
//  EndpointError.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 17/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import Foundation

enum EndpointError: Error {
    case invalidURL
    case dataIsNil
}

extension EndpointError: LocalizedError {
    
}
