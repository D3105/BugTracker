//
//  Row.swift
//  BugTracker
//
//  Created by D on 3/14/18.
//  Copyright © 2018 D. All rights reserved.
//

import Foundation

enum Row {
    case problem
    case solution(Solution)
    case comment(Message)
}
