//
//  Exercise+CoreDataProperties.swift
//  Bloodhoof
//
//  Created by Xiao Yan on 8/3/17.
//  Copyright © 2017 Xiao Yan. All rights reserved.
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var name: String?
    @NSManaged public var reps: Int32
    @NSManaged public var weight: Int32
    @NSManaged public var workout: Workout?

}
