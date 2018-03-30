//
//  SimpleApi.swift
//  BugTracker
//
//  Created by D on 3/26/18.
//  Copyright © 2018 D. All rights reserved.
//

import Foundation
import Moya

enum SimpleApi {
    case get
}

extension SimpleApi: TargetType {
    var baseURL: URL {
        return URL(string:"https://google.com")!
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }   
    
}
