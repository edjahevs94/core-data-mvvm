//
//  TaskListCell.swift
//  CD-CRUD-MVVM
//
//  Created by EdgardVS on 18/11/22.
//

import SwiftUI

struct TaskListCell: View {
    
    @ObservedObject var taskListItem: TaskList
    
    
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                if taskListItem.isDone{
                    Text(taskListItem.title ?? "").foregroundColor(.gray)
                }else{
                    Text(taskListItem.title ?? "")
                }
                Text("\(taskListItem.date!.formatted(.dateTime.month().day().hour().minute()))")
            }
            Spacer()
            Button(action: {}, label: {
                Image(systemName: !taskListItem.isDone ? "circle": "checkmark.circle")
            }).tint(.blue)
        }
        .swipeActions(edge: .leading , allowsFullSwipe: true) {
            Button(action: {
                
            }, label: {
                Label("Favorite", systemImage: taskListItem.isFavorite ? "heart.slash" : "heart")
            })
        }
        .swipeActions(edge: .leading, allowsFullSwipe: false) {
            Button(role: .destructive, action: {}, label: {
                Label("Delete", systemImage: "trash")
            })
            Button(role: .destructive, action: {}, label: {
                Label("Edit", systemImage: "pencil")
            })
        }
    }
}


