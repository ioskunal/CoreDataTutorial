//
//  CoreDataHelper.swift
//  CoreDataPractice
//
//  Created by Kunal Gupta on 30/05/20.
//  Copyright © 2020 Kunal Gupta. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper {
    
    static var shared = CoreDataHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveData( dict: [String: String]) {
        let entity  = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as? Student
        entity?.name = dict["name"]
        entity?.city = dict["city"]
        entity?.mobile = dict["mobile"]
        entity?.email = dict["email"]

        do {
            try context.save()
        } catch {
            print("Unable to save")
        }
    }
}
