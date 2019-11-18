//
//  Response.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 17/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import Foundation

struct Response<Model: Codable>: Codable {
    let kind: String
    let data: Response.Data<Model>
}
