//
//  ExerciseExtension.swift
//  WorkinOut
//
//  Created by Jeremy Warren on 1/19/22.
//

import Foundation
import UIKit

extension Exercise {
    convenience init(name: String, sets: Int, reps: Int, weight: Double) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.init(context: appDelegate.persistentContainer.viewContext)
        self.name = name
        self.sets = Int64(sets)
        self.reps = Int64(reps)
        self.weight = weight
    }
}
