//
//  AddWeightViewController.swift
//  WorkinOut
//
//  Created by Jeremy Warren on 1/18/22.
//

import UIKit
import Lottie

class AddWeightViewController: UIViewController {

    @IBOutlet weak var weightDatePicker: UIDatePicker!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var weightLottieView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonName = "TrackingLottie"
        weightLottieView.animation = Animation.named(jsonName)
        weightLottieView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        weightLottieView.play()
        weightLottieView.loopMode = .loop
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func addButtonPressed(_ sender: UIButton) {
        
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
