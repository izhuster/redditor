//
//  APIEncoding.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 18/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import Foundation

struct APIEncoding {
    static func encode(_ o: Any) -> String? {
        guard let string = o as? NSString else {
            return nil
        }
        
        return string.removingPercentEncoding
    }
}
