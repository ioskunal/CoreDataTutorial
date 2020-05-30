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
    
    func fetchAllStudents() -> [Student] {
        var students = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do {
            students = try context.fetch(fetchRequest) as! [Student]
        } catch {
            print("cant retrive data")
        }
        
        return students
    }
    
    func deleteStudent(_ index: Int) -> [Student] {
        var students = fetchAllStudents()
        context.delete(students[index])
        students.remove(at: index)
        
        do {
            try context.save()
        } catch {
            print("Cant delete")
        }        
        return students
    }
    
    func editStudent( dict: [String: String], index: Int) {
        let student = fetchAllStudents()[index]
        student.name = dict["name"]
        student.mobile = dict["mobile"]
        student.city = dict["city"]
        student.email = dict["email"]
        
        do {
            try context.save()
        } catch  {
            print("Cant update")
        }
    }
    
}
