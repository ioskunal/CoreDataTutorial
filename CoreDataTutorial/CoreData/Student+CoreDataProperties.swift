//
//  Student+CoreDataProperties.swift
//  CoreDataTutorial
//
//  Created by Kunal Gupta on 30/05/20.
//  Copyright © 2020 Kunal Gupta. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var mobile: String?
    @NSManaged public var email: String?
    @NSManaged public var city: String?

}
