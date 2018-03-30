//
//  ParticipantButton.swift
//  BugTracker
//
//  Created by D on 3/18/18.
//  Copyright © 2018 D. All rights reserved.
//

import UIKit

class ParticipantButton: UIButton {
    var participant: Participant? {
        didSet {
            setTitle(participant!.name, for: .normal)
            addTarget(nil, action: #selector(ProblemDetailsViewController.openProfile(_:)), for: .touchUpInside)
        }
    }
}
