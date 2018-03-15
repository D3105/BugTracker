//
//  Solution.swift
//  BugTracker
//
//  Created by D on 3/13/18.
//  Copyright © 2018 D. All rights reserved.
//

import UIKit

class Solution: Message, Voteable, Viewable {
    var photos: [UIImage]
    var rating: Int
    var comments: [Message]
    
    init(text: String, date: Date, participant: Participant, photos: [UIImage], rating: Int, comments: [Message]) {
        self.photos = photos
        self.rating = rating
        self.comments = comments
        
        super.init(text: text, date: date, participant: participant)
    }
}
