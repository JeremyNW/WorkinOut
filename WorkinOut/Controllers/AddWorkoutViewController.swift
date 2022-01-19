//
//  AddWorkoutViewController.swift
//  WorkinOut
//
//  Created by Jeremy Warren on 1/19/22.
//

import UIKit
import Lottie

class AddWorkoutViewController: UIViewController {
    @IBOutlet weak var workoutLottieView: AnimationView!
    @IBOutlet weak var exerciseNameTextField: UITextField!
    @IBOutlet weak var setsTextField: UITextField!
    @IBOutlet weak var repsTextField: UITextField!
    
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
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        setsTextField.resignFirstResponder()
        repsTextField.resignFirstResponder()
    }

}

extension AddWorkoutViewController: UITextFieldDelegate {
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
