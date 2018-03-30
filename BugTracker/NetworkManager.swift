//
//  NetworkManager.swift
//  BugTracker
//
//  Created by D on 3/25/18.
//  Copyright © 2018 D. All rights reserved.
//

import Foundation
import Moya

class NetworkManager {
    static let provider = MoyaProvider<RESTApi>()
}
