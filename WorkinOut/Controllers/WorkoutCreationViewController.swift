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
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        workoutCreatorTableView.reloadData()
    }

    
    @IBAction func addWorkoutButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "addExerciseSegue",
                let destination = segue.destination as? AddExerciseViewController else { return }
        
        destination.workout = self.workout
        
    }
    

}



extension WorkoutCreationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        workout?.exercises?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "routineCell", for: indexPath)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Exercise")
                //request.predicate = NSPredicate(format: "age = %@", "12")
                request.returnsObjectsAsFaults = false
                do {
                    let result = try context.fetch(request)
                    for data in result as! [NSManagedObject] {
                       print(data.value(forKey: "name") as! String)
                        cell.textLabel!.text = data.value(forKey: "name") as! String
                    }
                    } catch {
                        print("Error")
                    }
        return cell
    }
}

