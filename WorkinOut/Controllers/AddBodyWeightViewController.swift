//
//  AddWeightViewController.swift
//  WorkinOut
//
//  Created by Jeremy Warren on 1/18/22.
//

import UIKit
import Lottie

class AddBodyWeightViewController: UIViewController {

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

    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let pounds = weightTextField.text,
              let poundString = Double(pounds),
              !pounds.isEmpty
        else { return }
        let date = weightDatePicker.date
        
        BodyWeightController.shared.addBodyWeight(pounds: poundString, date: date)
        navigationController?.popViewController(animated: true)
    }

}
