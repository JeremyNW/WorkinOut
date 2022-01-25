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
    var workouts: [Workout] = []
    
    private init() {
        load()
    }
    
    func createWorkout(name: String) -> Workout {
        let workout = Workout(name: name)
        workouts.append(workout)
        try? context.save()
        return workout
    }
    
    func load() {
        let request = Workout.fetchRequest()
        workouts = (try? context.fetch(request)) ?? []
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
        if let index = workouts.firstIndex(of: workout) {
            workouts.remove(at: index)
        }
        context.delete(workout)
        try? context.save()
    }
}
