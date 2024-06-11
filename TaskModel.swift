//
//  TaskModel.swift
//  SwiftToDo
//
//  Created by Charlene Lava on 4/11/24.
//

import Foundation
struct TaskModel: Identifiable {
    let id: String = UUID().uuidString
    let item: String
    let isComplete: Bool
    let isStrikethrough: Bool = false
}
