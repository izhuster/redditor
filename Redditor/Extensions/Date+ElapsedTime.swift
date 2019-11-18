//
//  Date+ElapsedTime.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 17/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import Foundation

extension Date {
    func elapsedTime() -> String {
        if let hours = Calendar.current.dateComponents([.hour], from: self, to: Date()).hour {
            print("hours: \(hours)")
            let elapsedTime = hours == 1 ? "\(hours) hour ago" : "\(hours) hours ago"
            return elapsedTime
        } else {
            return "— hours ago"
        }
    }
}
