//
//  Message.swift
//  BugTracker
//
//  Created by D on 3/13/18.
//  Copyright © 2018 D. All rights reserved.
//

import Foundation

class Message {
    var text: String
    let date: Date
    unowned let participant: Participant
    
    init(text: String, date: Date, participant: Participant) {
        self.text = text
        self.date = date
        self.participant = participant
    }
}
