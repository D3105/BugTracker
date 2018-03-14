//
//  Problem.swift
//  BugTracker
//
//  Created by D on 3/12/18.
//  Copyright © 2018 D. All rights reserved.
//

import UIKit

struct Problem {
    let name: String
    let description: String
    let rating: Int
    let photos: [UIImage]
    let location: String
    let tags: [String]
    let date: Date
    let solutions: [Solution]
    let comments: [Comment]
    let participant: Participant
    
    var rowCount: Int {
        var count = comments.count + 1   // +1 for problem existence
        for solution in solutions {
            count += solution.comments.count + 1    // +1 for solution existence
        }
        return count
    }
    
    subscript (row: Int) -> (Solution?, Comment?) {
        //problem
        if row == 0 {
            return (nil, nil)
        }
        
        var count = 0
        
        //problem comments
        for problemComment in comments {
            count += 1
            if count == row {
                return (nil, problemComment)
            }
        }
        
        //solutions
        for solution in solutions {
            count += 1
            if count == row {
                return (solution, nil)
            }
            for solutionComment in solution.comments {
                count += 1
                if count == row {
                    return (nil, solutionComment)
                }
            }
        }
        
        fatalError("Index out of range")
    }
}
