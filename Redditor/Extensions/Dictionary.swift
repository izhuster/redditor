//
//  Dictionary.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 18/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import Foundation

extension Dictionary where Key: ExpressibleByStringLiteral, Value: ExpressibleByStringLiteral {
    func toURLEncodedString() -> String {
        var pairs = [String]()
        for element in self {
            if let key = APIEncoding.encode(element.0 as AnyObject),
                let value = APIEncoding.encode(element.1 as AnyObject), (!value.isEmpty && !key.isEmpty) {
                pairs.append([key, value].joined(separator: "="))
            } else {
                continue
            }
        }
        
        guard !pairs.isEmpty else {
            return ""
        }
        
        return pairs.joined(separator: "&")
    }
}
