//
//  BodyWeightExtension.swift
//  WorkinOut
//
//  Created by Jeremy Warren on 1/28/22.
//

import Foundation
import UIKit

extension BodyWeight {
    convenience init(pounds: Double, date: Date) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.init(context: appDelegate.persistentContainer.viewContext)
        self.pounds = pounds
        self.date = date
    }
}
