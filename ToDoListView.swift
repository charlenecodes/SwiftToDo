//
//  ToDoListView.swift
//  SwiftToDo
//
//  Created by Charlene Lava on 4/11/24.
//

import SwiftUI

struct ToDoListView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    @Environment(\.colorScheme) var colorScheme
    
    let darkGray = Color(red: 41, green: 42, blue: 48)
    
    var body: some View {
    
            ZStack {
                if taskViewModel.taskList.isEmpty {
                    VStack {
                        GettingStartedView()
                            .onTapGesture {
                                taskViewModel.isTextFieldInFocus = false
                            }
                        Spacer()
                        AddTaskView()
                    }
                } else {
                    VStack {
                        MyListView()
                            .onTapGesture {
                                taskViewModel.isTextFieldInFocus = false
                            }
                        Spacer()
                        AddTaskView()
                    }
                }
            }
            .scrollDismissesKeyboard(.interactively)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        taskViewModel.isAppInLightMode.toggle()
                    }) {
                        Image(systemName: !taskViewModel.isAppInLightMode ? "sun.max.fill" : "moon.circle.fill")
                            .foregroundColor( !taskViewModel.isAppInLightMode ? .yellow : .accentColor)
                    }
                }
            }
            .preferredColorScheme(taskViewModel.isAppInLightMode ? .light : .dark)
    }
}
#Preview {
    NavigationStack{
        ToDoListView()
    }
    // here we have to add this so that our preview works and doesn't show errors
    .environmentObject(TaskViewModel())
}
