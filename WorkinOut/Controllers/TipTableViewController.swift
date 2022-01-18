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


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return manager.tips.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tipCell", for: indexPath)

        cell.textLabel?.text = manager.tips[indexPath.row].title
        cell.detailTextLabel?.text = manager.tips[indexPath.row].timeToRead
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let indexPath = tableView.indexPathForSelectedRow,
              
              let destination = segue.destination as? TipTextViewController else { return }
    
        let tip = manager.tips[indexPath.row]
        
        destination.tip = tip
        
    }


}
