//
//  WorkoutTableViewController.swift
//  WorkinOut
//
//  Created by Jeremy Warren on 1/21/22.
//

import UIKit

class WorkoutTableViewController: UITableViewController {
    
    var workout: Workout?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func addWorkoutButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Workout Name", message: "What will you call this workout?", preferredStyle: .alert)
        
        alert.addTextField{textField in
            textField.placeholder = "Type name here"
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        let saveButton = UIAlertAction(title: "Save", style: .default) { _ in
            
            guard let workoutField = alert.textFields?.first,
                  alert.textFields?.first?.text?.isEmpty == false
            else { return }
            
            let name = workoutField.text ?? "New Workout"
            
            let workout = WorkoutController.shared.createWorkout(name: name)
            let storyboard = UIStoryboard(name: "WorkoutCreator", bundle: nil)
            guard let destination = storyboard.instantiateInitialViewController() as? WorkoutCreationViewController else {return}
            destination.workout = workout
            self.present(destination, animated: true, completion: nil)
            
            
        }
        alert.addAction(cancelButton)
        alert.addAction(saveButton)
        
        present(alert, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        WorkoutController.shared.workouts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workoutCell", for: indexPath)
        let workout = WorkoutController.shared.workouts[indexPath.row]
        cell.textLabel?.text = workout.name
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           
                    let workout = WorkoutController.shared.workouts[indexPath.row]
                    WorkoutController.shared.delete(workout: workout)
                    tableView.deleteRows(at: [indexPath], with: .fade)
               
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // "toWorkout"
        guard segue.identifier == "toWorkout",
              let destination = segue.destination as? WorkoutCreationViewController
        else { return }
        
        destination.workout = self.workout
    }
    
}
