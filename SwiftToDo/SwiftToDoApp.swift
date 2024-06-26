//
//  SwiftToDoApp.swift
//  SwiftToDo
//
//  Created by Charlene Lava on 10/19/23.
//

import SwiftUI

@main
struct SwiftToDoApp: App {
    
    @StateObject private var taskViewModel: TaskViewModel = TaskViewModel()
    
    var body: some Scene {
        WindowGroup {
            // we put the taskViewModel in the environment so that all the views within the navigation view have access to it
            NavigationStack {
                ToDoListView()
            }
            // we are able to observe taskViewModel as an environmentObject because we have set the class TaskViewModel to ObservableObject
            .environmentObject(taskViewModel)
                    }
    }
}
