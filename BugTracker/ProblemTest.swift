//
//  ProblemTest.swift
//  BugTracker
//
//  Created by D on 3/25/18.
//  Copyright © 2018 D. All rights reserved.
//

import Foundation
import Gloss

struct ProblemTest {
    var id: String?
    let name: String
    let description: String
    let rating: Int
    let participant: String
}

extension ProblemTest: Glossy {
    init?(json: JSON) {
        guard let name: String = "name" <~~ json,
            let description: String = "description" <~~ json,
            let rating: Int = "rating" <~~ json,
            let participant: String = "participant" <~~ json else {
                return nil
        }
        
        self.id = "id" <~~ json
        self.name = name
        self.description = description
        self.rating = rating
        self.participant = participant
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "name" ~~> name,
            "description" ~~> description,
            "rating" ~~> rating,
            "participant" ~~> participant
            ])
    }
}

struct ProblemUpdateRequest{
    let description: String?
    let rating: Int?    
}

extension ProblemUpdateRequest: JSONEncodable {
    func toJSON() -> JSON? {
        return jsonify([
            "description" ~~> description,
            "rating" ~~> rating
            ])
    }
}
