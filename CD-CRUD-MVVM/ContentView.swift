//
//  ContentView.swift
//  CD-CRUD-MVVM
//
//  Created by EdgardVS on 18/11/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var taskList: TaskListViewModel
    
    @FetchRequest(entity: TaskList.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)]) var fetchedTaskList:FetchedResults<TaskList>
    
    @State private var addView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fetchedTaskList.filter({$0.isFavorite == true
                })) {
                    item in
                    TaskListCell(taskListItem: item)
                }
            }.sheet(isPresented: $addView, content: {
                AddListView(addView: $addView)
            })
            .toolbar {
                Button(action: {
                    addView.toggle()
                }, label: {
                    Label("Add item", systemImage: "plus")
                })
            }
            .navigationTitle("CD CRUD MVVM")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
