//
//  MasterViewController.swift
//  BugTracker
//
//  Created by D on 3/12/18.
//  Copyright © 2018 D. All rights reserved.
//

import UIKit

protocol ProblemSelectionDelegate: class {
    func problemSelected(_ newProblem: Problem)
}

class MasterViewController: UITableViewController {
    
    var delegate: ProblemSelectionDelegate?

    static let participant = Participant(name: "Румянцев М. Е.", photo: UIImage(), role: "студент")
    static let date = Date(timeIntervalSinceNow: 0)
    
    var problems = [
        Problem(text: "уже весна вроде",
                date: date,
                participant: participant,
                name:  "Снег с потолка",
                rating: 31,
                photos: [#imageLiteral(resourceName: "swift"), #imageLiteral(resourceName: "Placeholder")],
                location: "2-506",
                tags: ["потолок", "снег", "2-й корпус"],
                solutions: [
                    Solution(text: "дело было так...",
                             date: date,
                             participant: participant,
                             photos: [#imageLiteral(resourceName: "Placeholder"), #imageLiteral(resourceName: "Placeholder"), #imageLiteral(resourceName: "swift")],
                             rating: 5,
                             comments: [
                                Message(text: "тестовый комментарий",
                                        date: date,
                                        participant: participant)
                            ])],
                comments: []),
        Problem(text: "во время ветра дверь постоянно открываеться, лапка не засчелкиваеться до конца",
                date: date,
                participant: participant,
                name:  "Дверь не закрываеться",
                rating: 5,
                photos: [#imageLiteral(resourceName: "swift"), #imageLiteral(resourceName: "swift"), #imageLiteral(resourceName: "swift")],
                location: "2-403",
                tags: ["дверь", "2-й корпус", "не закрываеться"],
                solutions: [],
                comments: []),
        Problem(text: "надоел, не закрываеться, поэтому постоянно открыт и мешает ходить",
                date: date,
                participant: participant, name:  "Пожарный шкафчик",
                rating: 95,
                photos: [],
                location: "коридор 2-400",
                tags: ["2-й корпус", "не закрываеться"],
                solutions: [],
                comments: []),
        Problem(text: "почините монитор или купите новый, полосы закрывают весь екран",
                date: date,
                participant: participant,
                name:  "Монитор с полосами",
                rating: 0,
                photos: [],
                location: "11-206",
                tags: ["11-й корпус", "монитор"],
                solutions: [],
                comments: []),
        Problem(text: "а у меня курс автокад, компютеров лишних нет",
                date: date,
                participant: participant,
                name:  "Колесико мыши не крутиться",
                rating: 21,
                photos: [],
                location: "первый копютер у входа 2-306",
                tags: ["компютер", "2-й корпус", "срочно"],
                solutions: [],
                comments: [])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedProblem = problems[indexPath.row]
        delegate?.problemSelected(selectedProblem)
        
        if let detailViewController = delegate as? DetailViewController {
            splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
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
