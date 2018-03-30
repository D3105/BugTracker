//
//  ProfileSummaryViewController.swift
//  BugTracker
//
//  Created by D on 3/18/18.
//  Copyright © 2018 D. All rights reserved.
//

import UIKit

class ProfileSummaryViewController: UIViewController {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var aboutDesignationLabel: UILabel!
    @IBOutlet weak var problemRatingLabel: UILabel!
    @IBOutlet weak var solutionRatingLabel: UILabel!
    
    var participant: Participant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photo.image = participant.photo
        nameLabel.text = participant.name
        roleLabel.text = participant.role
        
        if let about = participant.about {
            aboutLabel.text = about
        } else {
            aboutDesignationLabel.removeFromSuperview()
            aboutLabel.removeFromSuperview()
        }
        
        problemRatingLabel.text = "\(participant.problemRating)"
        solutionRatingLabel.text = "\(participant.solutionRating)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
