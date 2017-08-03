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

class TodayService {
    
    func getTodayWorkoutData(_ result: @escaping Result) {
        
        DispatchQueue.main.async {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            let managedContext = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Workout")
//            fetchRequest.predicate = NSPredicate(format: "%k >= %d", "created_date", Calendar(identifier: Calendar.Identifier.gregorian).startOfDay(for: Date()))
            do {
                let workoutList = try managedContext.fetch(fetchRequest)
                result(workoutList)
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
    }
}
