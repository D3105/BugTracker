//
//  DetailViewController.swift
//  BugTracker
//
//  Created by D on 3/12/18.
//  Copyright © 2018 D. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
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

        tableView.estimatedRowHeight = 315
        tableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    @objc func openProfile(_ button: UIButton) {
        let alert = UIAlertController(title: "Profile", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func stepperChangeValue(_ stepper: UIStepper) {
        stepper.isEnabled = false
        stepperLabels[stepper]!.text = String(Int(stepper.value))
    }
    
    func configure(participantButton: UIButton, for message: Message) {
        participantButton.setTitle(message.participant.name, for: .normal)
        participantButton.addTarget(self, action: #selector(openProfile(_:)), for: .touchUpInside)
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
            configure(participantButton: cell.participantButton, for: problem!)
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
            configure(participantButton: cell.participantButton, for: solution)
            configure(photoCollectionView: cell.photoCollectionView, for: solution)
            
            return cell
        case let .comment(comment):
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentTableViewCell
            
            //configure labels
            cell.commentLabel.text = comment.text
            cell.dateLabel.text = comment.date.formatted
            
            configure(participantButton: cell.participantButton, for: comment)
            
            return cell
        }
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

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewPhotos[collectionView]!.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCollectionViewCell
        cell.photo.image = collectionViewPhotos[collectionView]![indexPath.row]
        return cell
    }
}

extension DetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let selectedCell = collectionView.cellForItem(at: indexPath) as! PhotoCollectionViewCell
        openProfile(UIButton())
    }
}

extension DetailViewController: ProblemSelectionDelegate {
    func problemSelected(_ newProblem: Problem) {
        problem = newProblem
    }
}

