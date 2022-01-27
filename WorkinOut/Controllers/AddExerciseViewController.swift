//
//  AddWorkoutViewController.swift
//  WorkinOut
//
//  Created by Jeremy Warren on 1/19/22.
//

import UIKit
import Lottie

class AddExerciseViewController: UIViewController {
    @IBOutlet weak var workoutLottieView: AnimationView!
    @IBOutlet weak var exerciseNameTextField: UITextField!
    @IBOutlet weak var setsTextField: UITextField!
    @IBOutlet weak var repsTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    var workout: Workout?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exerciseNameTextField.delegate = self
        setsTextField.delegate = self
        repsTextField.delegate = self
        
        let jsonName = "WorkoutLottie"
        workoutLottieView.animation = Animation.named(jsonName)
        workoutLottieView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        workoutLottieView.play()
        workoutLottieView.loopMode = .loop
       
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addExerciseButtonPressed))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        setsTextField.resignFirstResponder()
        repsTextField.resignFirstResponder()
    }
    @objc func addExerciseButtonPressed(_ sender: UIButton) {
        guard let name = exerciseNameTextField.text,
              !name.isEmpty,
              let setString = setsTextField.text,
              let sets = Int(setString),
              let repString = repsTextField.text,
              let reps = Int(repString),
              let weightString = weightTextField.text,
              let weight = Double(weightString),
              let workout = workout
        else { return }
        
        let exercise = Exercise(name: name, sets: sets, reps: reps, weight: weight)
        WorkoutController.shared.add(exercise: exercise, to: workout)
        navigationController?.popViewController(animated: true)
    }
    
}

extension AddExerciseViewController: UITextFieldDelegate {
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
