//
//  Post.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 17/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import Foundation

struct Post: Codable {
    let id: String
    let title: String
    let author: String
    let created: Int
}
