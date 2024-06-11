//
//  TaskView.swift
//  SwiftToDo
//
//  Created by Charlene Lava on 4/11/24.
//

import SwiftUI

struct TaskView: View {

    let gray = Color(red: 0.5, green: 0.7, blue: 0.8)
    let red = Color(red: 1, green: 0.5, blue: 0.3)

    
    // everytime we have a new task it will always follow the TaskModel and will be displayed depending on which conditions it meets
    let task: TaskModel

    var body: some View {
        List {
            HStack {
                Image(systemName: task.isComplete ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isComplete ? .green : .red)
                    .font(.title3)
                task.isComplete ? Text(task.item).font(.title2).foregroundColor(gray) : Text(task.item).font(.title2).foregroundColor(red)
                Spacer()
            }
        }
    }
}

#Preview {
    Group{
        TaskView(task: TaskModel(item: "Completed task", isComplete: true))
        TaskView(task: TaskModel(item: "New Task", isComplete: false))
    }
    
}
