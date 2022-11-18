//
//  TaskListViewModel.swift
//  CD-CRUD-MVVM
//
//  Created by EdgardVS on 18/11/22.
//

import Foundation
import Combine
import CoreData

class TaskListViewModel: ObservableObject {
    
    @Published var taskListTitle = ""
    
    func createTask(context: NSManagedObjectContext){
        let task = TaskList(context: context)
        task.title = taskListTitle
        task.isDone = false
        task.isFavorite = false
        task.date = Date()
        task.id = UUID()
        save(context: context)
        taskListTitle = ""
    }
    
    func save(context:NSManagedObjectContext) {
        do {
            try context.save()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
}
