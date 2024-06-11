//
//  TaskViewModel.swift
//  SwiftToDo
//
//  Created by Charlene Lava on 4/12/24.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var taskList: [TaskModel] = []
    
    init(){
        getTasks()
    }
    
    //  is it only the structs that need a mutating func? - clarify this
    func getTasks() {
        let newTasks = [
            TaskModel(item: "Call the doctor", isComplete: true),
            TaskModel(item: "Grocery shopping", isComplete: false)
        ]
        
        // contentsOf is used when you append multiple items
        taskList.append(contentsOf: newTasks)
    }
    
    func deleteTask(indexSet: IndexSet) {
        taskList.remove(atOffsets: indexSet)
    }
    
    func moveTask(from: IndexSet, to: Int) {
        taskList.move(fromOffsets: from, toOffset: to)
    }
    
    func addNewTask(item: String) {
        let newTask = TaskModel(item: item, isComplete: false)
        taskList.append(newTask)
    }
    
//    func markCompleted(indexSet: IndexSet) {
//        taskList.
//    }
}
