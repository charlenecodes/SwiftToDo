//
//  TaskView.swift
//  SwiftToDo
//
//  Created by Charlene Lava on 4/11/24.
//

import SwiftUI

struct TaskView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    let red = Color(red: 1, green: 0, blue: 0)
    
    // everytime we have a new task it will always follow the TaskModel and will be displayed depending on which conditions it meets
    let taskItem: TaskModel

    var body: some View {
        List {
            HStack {
                Image(systemName: taskItem.isComplete ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(taskItem.isComplete ? .green : .accentColor)
                    .font(.title3)
                taskItem.isComplete ?
                Text(taskItem.task)
                    .font(.title2)
                    .foregroundColor(.gray)
                    .strikethrough(color: .accentColor) : Text(taskItem.task)
                    .font(.title2)
                    .foregroundColor(taskViewModel.isAppInLightMode ? .accentColor : .white)
                Spacer()
            }
        }
        .listRowSeparator(.automatic)
    }
}

#Preview {
    Group{
        TaskView(taskItem: TaskModel(task: "Completed task", isComplete: true))
        TaskView(taskItem: TaskModel(task: "New Task", isComplete: false))
    }
    
}
