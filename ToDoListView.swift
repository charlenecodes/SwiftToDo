//
//  ToDoListView.swift
//  SwiftToDo
//
//  Created by Charlene Lava on 4/11/24.
//

import SwiftUI

struct ToDoListView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel

    
    var body: some View {
        NavigationView{
            List {
                ForEach(taskViewModel.taskList) { taskItem in
                    // we are passing the task from the ForEach loop as a parameter to the task that we created inside of TaskView
                    TaskView(task: taskItem)
                }
                .onDelete(perform: taskViewModel.deleteTask)
                .onMove(perform: taskViewModel.moveTask)

            }
            .listStyle(.inset)
        }
        .navigationTitle("To Do List 📝")
        .navigationBarItems(
            // default Xcode Edit Button, but uses the onDelete and onMove that is defined in taskViewModel
            leading: EditButton(),
            trailing: NavigationLink(
                "Add",
                destination: AddTaskView()
            )
        )
    }
}
#Preview {
    NavigationView{
        ToDoListView()
    }
    // here we have to add this so that our preview works and doesn't show errors
    .environmentObject(TaskViewModel())
}
