//
//  WorkoutExtension.swift
//  WorkinOut
//
//  Created by Jeremy Warren on 1/21/22.
//

import Foundation
import UIKit

extension Workout {
    convenience init(name: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.init(context: appDelegate.persistentContainer.viewContext)
        self.name = name
    }
}
