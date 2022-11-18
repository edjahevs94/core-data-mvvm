//
//  CD_CRUD_MVVMApp.swift
//  CD-CRUD-MVVM
//
//  Created by EdgardVS on 18/11/22.
//

import SwiftUI

@main
struct CD_CRUD_MVVMApp: App {
    
    let persistenceController = PersistenceController.shared
    @StateObject var taskListViewModel = TaskListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(taskListViewModel)
        }
    }
}
