//
//  Problem.swift
//  BugTracker
//
//  Created by D on 3/12/18.
//  Copyright © 2018 D. All rights reserved.
//

import UIKit

class Problem: Message, Voteable, Viewable {
    var name: String
    var rating: Int
    var photos: [UIImage]
    var location: String
    var tags: [String]
    var solutions: [Solution]
    var comments: [Message]
    
    init(text: String, date: Date, participant: Participant,
         name: String, rating: Int, photos: [UIImage],
         location: String, tags: [String],
         solutions: [Solution], comments: [Message]) {
        self.name = name
        self.rating = rating
        self.photos = photos
        self.location = location
        self.tags = tags
        self.solutions = solutions
        self.comments = comments
        
        super.init(text: text, date: date, participant: participant)
    }
    
    var rowRepresentation: [Row] {
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
