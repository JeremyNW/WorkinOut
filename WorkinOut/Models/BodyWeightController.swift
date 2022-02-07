//
//  BodyWeightController.swift
//  WorkinOut
//
//  Created by Jeremy Warren on 1/28/22.
//

import Foundation
import CoreData
import UIKit

class BodyWeightController {
    let context: NSManagedObjectContext = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }()
    static let shared = BodyWeightController()
    var bodyWeights: [BodyWeight] {
        let request: NSFetchRequest<BodyWeight> = BodyWeight.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        return (try? context.fetch(request)) ?? []
    }
    
    private init() { }
    
    @discardableResult
    func addBodyWeight(pounds: Double, date: Date) -> BodyWeight {
        // check if they already added a weight for that date
        if let old = bodyWeights.first(where: { $0.date == date.startOfDay }) {
            // if so, remove original entry
            context.delete(old)
        }
        // save new bodyweight entry on the entered date
        let bodyWeight = BodyWeight(pounds: pounds, date: date.startOfDay)
        try? context.save()
        return bodyWeight
    }
    
    func delete(bodyWeight: BodyWeight) {
        context.delete(bodyWeight)
        try? context.save()
    }
}

extension Date {
    var startOfDay: Date {
        Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: self)!
    }
}
