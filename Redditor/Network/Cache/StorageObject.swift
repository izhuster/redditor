//
//  StorageObject.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 18/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import Foundation

final class StorageObject {
    let data: Data
    let key: String
    init(data: Data, key: String) {
        self.data = data
        self.key = key
    }
}
