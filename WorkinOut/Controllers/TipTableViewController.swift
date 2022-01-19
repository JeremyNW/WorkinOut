//
//  TableViewController.swift
//  WorkinOut
//
//  Created by Jeremy Warren on 1/17/22.
//

import UIKit

class TableViewController: UITableViewController {

    var manager = TipManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Tips"
        } else if section == 1 {
            return "Acknowledgements"
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else if section == 1 {
            return 1
        } else {
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tipCell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = manager.tips[indexPath.row].title
            cell.detailTextLabel?.text = manager.tips[indexPath.row].timeToRead
        }
            else if indexPath.section == 1 {
            cell.textLabel?.text = manager.acknowledgements.title
            cell.detailTextLabel?.text = manager.acknowledgements.timeToRead
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let indexPath = tableView.indexPathForSelectedRow,
              
              let destination = segue.destination as? TipTextViewController else { return }
        
        if indexPath.section == 0 {
            destination.tip = manager.tips[indexPath.row]
        } else if indexPath.section == 1 {
            destination.tip = manager.acknowledgements
        }
        
    }
    

}
