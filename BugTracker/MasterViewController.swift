//
//  MasterViewController.swift
//  BugTracker
//
//  Created by D on 3/12/18.
//  Copyright © 2018 D. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var problems: [Problem]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let participant = Participant(name: "Румянцев М. Е.", photo: UIImage(), role: "студент", problems: [], solutions: [])
        let problems = [
            Problem(name:  "Снег с потолка",
                    description: "уже весна вроде",
                    rating: 31,
                    photos: [],
                    location: "2-506",
                    tags: ["потолок", "снег", "2-й корпус"],
                    date: Date(timeIntervalSinceNow: 0),
                    solutions: [],
                    comments: [],
                    participant: participant),
            Problem(name:  "Дверь не закрываеться",
                    description: "во время ветра дверь постоянно открываеться, лапка не засчелкиваеться до конца",
                    rating: 5,
                    photos: [],
                    location: "2-403",
                    tags: ["дверь", "2-й корпус", "не закрываеться"],
                    date: Date(timeIntervalSinceNow: 0),
                    solutions: [],
                    comments: [],
                    participant: participant),
            Problem(name:  "Пожарный шкафчик",
                    description: "надоел, не закрываеться, поэтому постоянно открыт и мешает ходить",
                    rating: 95,
                    photos: [],
                    location: "коридор 2-400",
                    tags: ["2-й корпус", "не закрываеться"],
                    date: Date(timeIntervalSinceNow: 0),
                    solutions: [],
                    comments: [],
                    participant: participant),
            Problem(name:  "Монитор с полосами",
                    description: "почините монитор или купите новый, полосы закрывают весь екран",
                    rating: 0,
                    photos: [],
                    location: "11-206",
                    tags: ["11-й корпус", "монитор"],
                    date: Date(timeIntervalSinceNow: 0),
                    solutions: [],
                    comments: [],
                    participant: participant),
            Problem(name:  "Колесико мыши не крутиться",
                    description: "а у меня курс автокад, компютеров лишних нет",
                    rating: 21,
                    photos: [],
                    location: "первый копютер у входа 2-306",
                    tags: ["компютер", "2-й корпус", "срочно"],
                    date: Date(timeIntervalSinceNow: 0),
                    solutions: [],
                    comments: [],
                    participant: participant)
        ]
        self.problems = problems
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return problems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let problem = problems[indexPath.row]
        cell.textLabel?.text = problem.name
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
