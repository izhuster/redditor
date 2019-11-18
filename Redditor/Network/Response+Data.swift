//
//  Response+Data.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 17/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import Foundation

extension Response {
    struct Data<Model: Codable>: Codable {
        let dist: Int
        let children: [Child<Model>]
    }
}
