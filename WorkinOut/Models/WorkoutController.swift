//
//  ExerciseManager.swift
//  WorkinOut
//
//  Created by Jeremy Warren on 1/19/22.
//

import Foundation
import CoreData
import UIKit

class WorkoutController {
    let context: NSManagedObjectContext = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }()
    static let shared = WorkoutController()
    var workouts: [Workout] {
        let request: NSFetchRequest<Workout> = Workout.fetchRequest()
        return (try? context.fetch(request)) ?? []
    }

    private init() { }
    
    func createWorkout(name: String) -> Workout {
        let workout = Workout(name: name)
        try? context.save()
        return workout
    }
    
    func add(exercise: Exercise, to workout: Workout) {
        workout.addToExercises(exercise)
        try? context.save()
    }
    
    func delete(exercise: Exercise) {
        context.delete(exercise)
        try? context.save()
    }
    
    func delete(workout: Workout) {
        context.delete(workout)
        try? context.save()
    }
}
