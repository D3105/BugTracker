//
//  ProblemDetailsViewController.swift
//  BugTracker
//
//  Created by D on 3/12/18.
//  Copyright © 2018 D. All rights reserved.
//

import UIKit

class ProblemDetailsViewController: UITableViewController {
   
    //data for tableView
    var collectionViewPhotos = [UICollectionView: [UIImage]]()
    var stepperLabels = [UIStepper: UILabel]()
    var rows = [Row]()
    
    var problem: Problem? {
        didSet {
            rows = problem!.rowRepresentation
            collectionViewPhotos.removeAll()
            stepperLabels.removeAll()
            refreshUI()            
        }
    }
    
    func refreshUI() {
        loadViewIfNeeded()
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    @objc func openProfile(_ button: ParticipantButton) {
        performSegue(withIdentifier: "openProfile", sender: button)
    }
    
    @objc func stepperChangeValue(_ stepper: UIStepper) {
        stepper.isEnabled = false
        stepperLabels[stepper]!.text = String(Int(stepper.value))
    }
    
    func configure(stepper: UIStepper, for voteable: Voteable) {
        stepper.value = Double(voteable.rating)
        stepper.addTarget(self, action: #selector(stepperChangeValue(_:)), for: .touchUpInside)
    }
    
    func configure(photoCollectionView: UICollectionView, for viewable: Viewable) {
        collectionViewPhotos[photoCollectionView] = viewable.photos
        photoCollectionView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch rows[indexPath.row] {
        case .problem:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProblemCell", for: indexPath) as! ProblemTableViewCell
            
            //configure labels
            cell.nameLabel.text = problem!.name
            cell.ratingLabel.text = "\(problem!.rating)"
            cell.descriptionLabel.text = problem!.text
            cell.locationLabel.text = problem!.location
            cell.tagsLabel.text = problem!.tags.joined(separator: ",")
            cell.dateLabel.text = problem!.date.formatted
            
            stepperLabels[cell.stepper] = cell.ratingLabel
            
            configure(stepper: cell.stepper, for: problem!)
            cell.participantButton.participant = problem!.participant
            configure(photoCollectionView: cell.photoCollectionView, for: problem!)
            
            return cell
        case let .solution(solution):
            let cell = tableView.dequeueReusableCell(withIdentifier: "SolutionCell", for: indexPath) as! SolutionTableViewCell
            
            //configure labels
            cell.descriptionLabel.text = solution.text
            cell.ratingLabel.text = "\(solution.rating)"
            cell.dateLabel.text = solution.date.formatted
            
            stepperLabels[cell.stepper] = cell.ratingLabel
            
            configure(stepper: cell.stepper, for: solution)
            cell.participantButton.participant = solution.participant
            configure(photoCollectionView: cell.photoCollectionView, for: solution)
            
            return cell
        case let .comment(comment):
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentTableViewCell
            
            //configure labels
            cell.commentLabel.text = comment.text
            cell.dateLabel.text = comment.date.formatted
            
            cell.participantButton.participant = comment.participant
            
            return cell
        }
    }

    
    
     // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openProfile",
            let navigationController = segue.destination as? UINavigationController,
            let tabBarController = navigationController.topViewController as? UITabBarController,
            let tabs = tabBarController.viewControllers,
            let profileSummaryVC = tabs[0] as? ProfileSummaryViewController,
            let profileProblemsVC = tabs[1] as? ProfileProblemsViewController,
            let profileSolutionsVC = tabs[2] as? ProfileSolutionsViewController,
            let participantButton = sender as? ParticipantButton,
            let participant = participantButton.participant {
            profileSummaryVC.participant = participant
            profileProblemsVC.problems = participant.problems
            profileSolutionsVC.solutions = participant.solutions
        }
    }
    
    @IBAction func cancelToProblemDetailsViewController(_ segue: UIStoryboardSegue) {
        
    }
}

extension ProblemDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewPhotos[collectionView]!.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCollectionViewCell
        cell.photo.image = collectionViewPhotos[collectionView]![indexPath.row]
        return cell
    }
}

extension ProblemDetailsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let selectedCell = collectionView.cellForItem(at: indexPath) as! PhotoCollectionViewCell
//        openProfile(UIButton())
    }
}

extension ProblemDetailsViewController: ProblemSelectionDelegate {
    func problemSelected(_ newProblem: Problem) {
        problem = newProblem
    }
}

