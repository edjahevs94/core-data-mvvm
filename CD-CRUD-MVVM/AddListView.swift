//
//  AddListView.swift
//  CD-CRUD-MVVM
//
//  Created by EdgardVS on 18/11/22.
//

import SwiftUI

struct AddListView: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var taskListVM: TaskListViewModel
    @Binding var addView: Bool
   
    
    var body: some View {
        NavigationView {
            Form {
                VStack {
                    TextField("Enter Title", text: $taskListVM.taskListTitle)
                    Button (action : {
                        taskListVM.createTask(context: viewContext)
                        addView.toggle()
                    } , label: {
                        Text("Add Item").frame(minWidth: 0, maxWidth: .infinity)
                    }).tint(.yellow)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle)

                }
            }.navigationTitle("Add")
        }
    }
}

struct AddListView_Previews: PreviewProvider {
    static var previews: some View {
        AddListView(addView: .constant(true))
    }
}
