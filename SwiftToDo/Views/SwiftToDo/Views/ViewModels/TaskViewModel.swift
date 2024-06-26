//
//  TaskViewModel.swift
//  SwiftToDo
//
//  Created by Charlene Lava on 4/12/24.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var taskList: [TaskModel] = [] {
        // if anything changes with the array, saveItems will be called
        didSet {
            saveItems()
        }
    }
    let taskListKey: String = "task_list"
    
    @Published var textFieldText: String = ""
    
    // for alerts
    @Published var alertTitle: String = "";
    @Published var showAlert: Bool = false;
    
    @Published var isComplete: Bool = false;
    @Published var isTextFieldInFocus: Bool = false;
    
    @Published var isAppInLightMode: Bool = true
    
    @Published var onlyShowsIncompleteTasks: Bool = false
    
    init() {
        getItems()
    }
    
    func getItems() {
        // guard will try to get data and if it's true it will run the code, otherwise it will return what is in the curly brackets (in this case exit the code)
        guard 
            let data = UserDefaults.standard.data(forKey: taskListKey),
            let savedItems = try? JSONDecoder().decode([TaskModel].self, from: data)
        else { return }
        self.taskList = savedItems
    }
    
    func addNewTask(task: String) {
        let newTask = TaskModel(task: task, isComplete: false)
        taskList.append(newTask)
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "The new task must be at least 3 characters long ❌"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func submitTask() {
        if textIsAppropriate() {
            addNewTask(task: textFieldText)
        }
        textFieldText = ""
        isTextFieldInFocus = false
    }
    
    func markTaskComplete(taskItem: TaskModel) {
        if let index = taskList.firstIndex(where: { $0.id == taskItem.id }) {
            taskList[index] = taskItem.markComplete()
        }
    }
    
    func markTaskIncomplete(taskItem: TaskModel) {
        if let index = taskList.firstIndex(where: { $0.id == taskItem.id }) {
            taskList[index] = taskItem.undoCompletion()
        }
    }
    
    func moveTask(from: IndexSet, to: Int) {
        taskList.move(fromOffsets: from, toOffset: to)
    }
    
    func deleteTask(indexSet: IndexSet) {
        taskList.remove(atOffsets: indexSet)
    }
    
    // in a class it's better to use defaults, AppStorage is used in the View
    func saveItems() {
        // taskList will be JSON data if successful
        if let encodedData = try? JSONEncoder().encode(taskList) {
            UserDefaults.standard.set(encodedData, forKey: taskListKey)
        }
    }
}
