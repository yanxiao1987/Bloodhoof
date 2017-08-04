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
    
    static func getTodayWorkoutData() -> Workout? {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Workout")
        fetchRequest.predicate = NSPredicate(format: "(created_date >= %@) and (created_date < %@)", Date().startOfDay() as CVarArg, Date().endOfDay() as CVarArg)
        do {
            let workoutList = try managedContext.fetch(fetchRequest)
            return workoutList.count > 0 ? (workoutList[0] as! Workout) : nil
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return nil
    }
    
    static func getMyWorkoutPlan() -> [Workout] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Workout")
        let sortDescriptor = NSSortDescriptor(key: "created_date", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
//        fetchRequest.predicate = NSPredicate(format: "body_parts CONTAINS ", Date().startOfDay() as CVarArg, Date().endOfDay() as CVarArg)
        fetchRequest.predicate = NSPredicate(format: "(created_date >= %@) and (created_date < %@)", Date().startOfDay() as CVarArg, Date().endOfDay() as CVarArg)
        do {
            let workoutList = try managedContext.fetch(fetchRequest)
            return workoutList as! [Workout]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return []
    }
    
    static func createWorkoutTemplate() {
        let workoutEntity = NSEntityDescription.entity(forEntityName: "Workout", in: managedContext)
        let newWorkout = Workout(entity: workoutEntity!, insertInto: managedContext)
//        newWorkout = Workout()
        newWorkout.name = "Test Workout 1"
        newWorkout.created_date = NSDate()
        do {
            try newWorkout.managedObjectContext?.save()
        } catch {
            let saveError = error as NSError
            print(saveError)
        }
    }
}
