//
//  Response+Child.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 17/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import Foundation

extension Response {
    struct Child<Model: Codable>: Codable {
        let kind: String
        let data: Model
    }
}
