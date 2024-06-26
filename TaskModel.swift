//
//  TaskModel.swift
//  SwiftToDo
//
//  Created by Charlene Lava on 4/11/24.
//

import Foundation

// this is an immutable struct (all are let - they will not change)
// conforming to Codable means that TaskModel can be encoded/decoded, which is needed for saving it into UserDefaults
struct TaskModel: Identifiable, Codable {
    let id: String
    let task: String
    let isComplete: Bool
    
    init(id: String = UUID().uuidString, task: String, isComplete: Bool) {
        self.id = id
        self.task = task
        self.isComplete = isComplete
    }
    
    func markComplete () -> TaskModel {
        return TaskModel(id: id, task: task, isComplete: !isComplete)
    }
    
    func undoCompletion () -> TaskModel {
        return TaskModel(id: id, task: task, isComplete: !isComplete)
    }
    
//    func editTask () -> TaskModel {
//        return TaskModel(id: id, task: task, isComplete: isComplete)
//    }

}
