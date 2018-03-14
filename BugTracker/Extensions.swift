//
//  Extensions.swift
//  BugTracker
//
//  Created by D on 3/14/18.
//  Copyright © 2018 D. All rights reserved.
//

import Foundation

extension Date {
    var formatted: String {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: self)
        let month = calendar.component(.month, from: self)
        let year = calendar.component(.year, from: self)
        let hour = calendar.component(.hour, from: self)
        let minute = calendar.component(.minute, from: self)
        return "\(day).\(month).\(year), \(hour):\(minute)"
    }
}
