//
//  CoreDataManager.swift
//  toDoAPP
//
//  Created by Khawaja Abdul Haleem on 18/05/2023.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //MARK: - Model Manupulation Methods
    func loadTasks() -> [ModelTask] {
        let fetchRequest = NSFetchRequest<ModelTask>(entityName: TASK_ENTITY_NAME)
        let sort = NSSortDescriptor(key: #keyPath(ModelTask.date), ascending: false)
        fetchRequest.sortDescriptors = [sort] // sort -> According to date
        do {
            let tasksArray = try context.fetch(fetchRequest)
            return tasksArray
            
        } catch {
            print("Cannot fetch Expenses")
        }
        
        return [ModelTask]()
    }
    
    func addTask(task: String) {
        let date = Date()
        let newTask = ModelTask(context: self.context)
        newTask.date = date
        newTask.task = task
        newTask.isDone = false
        
        self.saveTasks()
       
    }
    
    
    func deleteTask(task: ModelTask) {
        context.delete(task)
        saveTasks()
    }
    
    func saveTasks() {
        do {
            try context.save()
            
        } catch {
            print("Error Saving Context \(error)")
        }
        
    }
}
