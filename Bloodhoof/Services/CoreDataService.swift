//
//  TodayServices.swift
//  Bloodhoof
//
//  Created by Xiao Yan on 8/3/17.
//  Copyright © 2017 Xiao Yan. All rights reserved.
//

import Foundation
import CoreData
import UIKit

typealias Result = ([NSManagedObject]) -> Void

class CoreDataService {
    
    static let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static func getTodayWorkoutData() -> [Workout] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Workout")
//        fetchRequest.predicate = NSPredicate(format: "%k >= %d", "created_date", Calendar(identifier: Calendar.Identifier.gregorian).startOfDay(for: Date()))
        do {
            let workoutList = try managedContext.fetch(fetchRequest)
            return workoutList as! [Workout]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return []
    }
}
