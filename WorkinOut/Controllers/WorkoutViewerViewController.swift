//
//  WorkoutViewerViewController.swift
//  WorkinOut
//
//  Created by Jeremy Warren on 1/25/22.
//

import UIKit

class WorkoutViewerViewController: UIViewController {
    
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var setsLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    var exercise: Exercise?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        exerciseLabel.text = exercise?.name
        if let sets = exercise?.sets {
            setsLabel.text = "Sets: \(sets)"
        }
        if let reps = exercise?.reps {
            repsLabel.text = "Reps: \(reps)"
        }
        if let weight = exercise?.weight {
            weightLabel.text = "Weight: \(weight) lbs."
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
