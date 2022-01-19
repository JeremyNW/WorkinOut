//
//  WorkoutCreatorViewController.swift
//  WorkinOut
//
//  Created by Jeremy Warren on 1/18/22.
//

import UIKit
import Lottie

class WorkoutCreatorViewController: UIViewController {

    @IBOutlet weak var workoutLottieView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let jsonName = "WorkoutLottie"
        workoutLottieView.animation = Animation.named(jsonName)
        workoutLottieView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        workoutLottieView.play()
        workoutLottieView.loopMode = .loop
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
