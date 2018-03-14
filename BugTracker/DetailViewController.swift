//
//  DetailViewController.swift
//  BugTracker
//
//  Created by D on 3/12/18.
//  Copyright © 2018 D. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    var problem: Problem? {
        didSet {
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
        return problem?.rowCount ?? 0
    }
    
    @objc func openProfile(_ button: UIButton) {
        let alert = UIAlertController(title: "D", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch problem![indexPath.row] {
        //problem cell
        case (nil, nil):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProblemCell", for: indexPath) as! ProblemTableViewCell
            cell.nameLabel.text = problem!.name
            cell.ratingLabel.text = "\(problem!.rating)"
            cell.descriptionLabel.text = problem!.description
            cell.locationLabel.text = problem!.location
            cell.tagsLabel.text = problem!.tags.joined(separator: ",")
            cell.participantButton.titleLabel?.text = problem!.participant.name
            cell.dateLabel.text = problem!.date.formatted
            cell.participantButton.addTarget(self, action: #selector(openProfile(_:)), for: .touchUpInside)
            return cell
        case (let solution?, nil):
            let cell = tableView.dequeueReusableCell(withIdentifier: "SolutionCell", for: indexPath) as! SolutionTableViewCell
            cell.descriptionLabel.text = solution.description
            cell.ratingLabel.text = "\(solution.rating)"
            cell.participantButton.titleLabel?.text = solution.participant.name
            cell.dateLabel.text = solution.date.formatted
            return cell
        case (nil, let comment?):
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentTableViewCell
            cell.commentLabel.text = comment.text
            cell.dateLabel.text = comment.date.formatted
            cell.participantButton.titleLabel?.text = comment.participant.name
            return cell
        default:
            fatalError()
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
        return 31
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCollectionViewCell
        cell.photo.image = #imageLiteral(resourceName: "Placeholder")
        return cell
    }
}

extension DetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let selectedCell = collectionView.cellForItem(at: indexPath) as! PhotoCollectionViewCell
        openProfile(UIButton())
    }
}

