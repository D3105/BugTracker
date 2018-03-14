//
//  Solution.swift
//  BugTracker
//
//  Created by D on 3/13/18.
//  Copyright © 2018 D. All rights reserved.
//

import UIKit

class Solution {
    let description: String
    let photos: [UIImage]
    let rating: Int
    let date: Date
    let comments: [Comment]
    unowned let participant: Participant
    
    init(description: String, photos: [UIImage], rating: Int, date: Date, comments: [Comment], participant: Participant) {
        self.description = description
        self.photos = photos
        self.rating = rating
        self.date = date
        self.comments = comments
        self.participant = participant
    }
}
