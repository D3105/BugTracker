//
//  Problem.swift
//  BugTracker
//
//  Created by D on 3/12/18.
//  Copyright © 2018 D. All rights reserved.
//

import UIKit

class Problem {
    let name: String
    let description: String
    let rating: Int
    let photos: [UIImage]
    let location: String
    let tags: [String]
    let date: Date
    let solutions: [Solution]
    let comments: [Comment]
    unowned let participant: Participant
    
    init(name: String, description: String, rating: Int,
         photos: [UIImage], location: String, tags: [String],
         date: Date, solutions: [Solution], comments: [Comment],
         participant: Participant) {
        self.name = name
        self.description = description
        self.rating = rating
        self.photos = photos
        self.location = location
        self.tags = tags
        self.date = date
        self.solutions = solutions
        self.comments = comments
        self.participant = participant
    }
    
    var rows: [Row] {
        var result: [Row] = [.problem] + comments.map { .comment($0) }
        
        for solution in solutions {
            result.append(Row.solution(solution))
            for comment in solution.comments {
                result.append(Row.comment(comment))
            }
        }
        
        return result
    }
}
