//
//  BodyWeightEntriesTableViewController.swift
//  WorkinOut
//
//  Created by Jeremy Warren on 2/7/22.
//

import UIKit

class BodyWeightEntriesTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        BodyWeightController.shared.bodyWeights.count
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let bodyWeight = BodyWeightController.shared.bodyWeights[indexPath.row]
            BodyWeightController.shared.delete(bodyWeight: bodyWeight)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "bodyWeightCell", for: indexPath)
        let bodyWeight = BodyWeightController.shared.bodyWeights[indexPath.row]
        
        cell.textLabel?.text = "\(bodyWeight.pounds) lbs."
        if let date = bodyWeight.date {
            cell.detailTextLabel?.text = MyFormatter.formatter.string(from: date)
        }
        return cell
    }
}
