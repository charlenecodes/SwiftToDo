//
//  MyListView.swift
//  SwiftToDo
//
//  Created by Charlene Lava on 6/17/24.
//

import SwiftUI

struct MyListView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    var body: some View {
        
            VStack {
                if (!taskViewModel.taskList.filter {$0.isComplete}.isEmpty) {
                    HStack {
                        Spacer()
                        Text(taskViewModel.onlyShowsIncompleteTasks ? "Show All" : "")
                        Image(systemName: taskViewModel.onlyShowsIncompleteTasks ? "line.3.horizontal.decrease.circle.fill" : "line.3.horizontal.decrease.circle")
                            .font(.title3)
                    }
                    .foregroundColor(.accentColor)
                    .onTapGesture {
                        taskViewModel.onlyShowsIncompleteTasks.toggle()
                    }
                    .padding(.bottom, 5)
                }
                
                List {
                        ForEach(taskViewModel.onlyShowsIncompleteTasks ? taskViewModel.taskList.filter {!$0.isComplete} : taskViewModel.taskList) { taskItem in
                            // we are passing the task from the ForEach loop as a parameter to the task that we created inside of TaskView
                            TaskView(taskItem: taskItem)
                                .onTapGesture {
                                    withAnimation(.spring) {
                                        taskViewModel.markTaskComplete(taskItem: taskItem)
                                    }
                                }
                        }
                        .onDelete(perform: taskViewModel.deleteTask)
                        .onMove(perform: taskViewModel.moveTask)
                    
                }
                .listStyle(.inset)
            }
            .navigationTitle("To Do List 📝")
            .navigationBarItems(leading: EditButton())
            .padding(.trailing, 25)

        }
}

#Preview {
    MyListView()
}
