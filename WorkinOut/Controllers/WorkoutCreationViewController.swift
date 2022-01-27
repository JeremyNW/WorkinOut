//
//  WorkoutCreatorViewController.swift
//  WorkinOut
//
//  Created by Jeremy Warren on 1/18/22.
//
import CoreData
import UIKit
import Lottie
import Foundation

class WorkoutCreationViewController: UIViewController {
    
    @IBOutlet weak var workoutCreatorTableView: UITableView!
    
    var workout: Workout?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = workout?.name
        workoutCreatorTableView.delegate = self
        workoutCreatorTableView.dataSource = self
        workoutCreatorTableView.reloadData()
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        workoutCreatorTableView.reloadData()
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addExerciseSegue",
           let destination = segue.destination as? AddExerciseViewController {
            destination.workout = self.workout
        } else if segue.identifier == "workoutViewSegue",
                  let destination = segue.destination as? WorkoutViewerViewController,
                  let indexPath = workoutCreatorTableView.indexPathForSelectedRow {
            let exercise = workout?.exercises?.object(at: indexPath.row) as? Exercise
            destination.exercise = exercise
        }
    }
    
    @objc func doneButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
}


extension WorkoutCreationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        workout?.exercises?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            workout?.removeFromExercises(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "routineCell", for: indexPath)
        let exercise = workout?.exercises?.object(at: indexPath.row) as? Exercise
        if let weight = exercise?.weight {
        cell.detailTextLabel?.text = "Weight: \(String(describing: weight)) lbs."
        }
        
        cell.textLabel?.text = exercise?.name
        return cell
    }
}

