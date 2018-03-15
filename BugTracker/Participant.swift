//
//  Participant.swift
//  BugTracker
//
//  Created by D on 3/13/18.
//  Copyright © 2018 D. All rights reserved.
//

import UIKit

class Participant {
    var name: String
    var photo: UIImage
    var role: String
    var problems: [Problem]?
    var solutions: [Solution]?
    
    
    var problemRating: Int {
        return (problems ?? []).reduce(0) { sum, problem in sum + problem.rating }
    }
    
    var solutionRating: Int {
        return (solutions ?? []).reduce(0) { sum, solution in sum + solution.rating }
    }
    
    init(name: String, photo: UIImage, role: String) {
        self.name = name
        self.photo = photo
        self.role = role
    }
}
