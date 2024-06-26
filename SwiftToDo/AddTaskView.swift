//
//  AddTaskView.swift
//  SwiftToDo
//
//  Created by Charlene Lava on 4/30/24.
//

import SwiftUI

struct AddTaskView: View {
    
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    var brightPurple: Color = Color(red: 166, green: 124, blue: 217)
    var pastelPurple: Color = Color(red: 218, green: 186, blue: 252)
    
    var body: some View {
        // we bind to a variable by using the $ dollar sign before it
        VStack {
            if taskViewModel.taskList.isEmpty {
                Text("Add an item to start your list 🖊️")
                    .foregroundColor(taskViewModel.isAppInLightMode ? .indigo : .white)
                    .fontWeight(.bold)
            }
            if taskViewModel.isAppInLightMode {
                HStack {
                    TextField("Enter a new task...", text: $taskViewModel.textFieldText)
                        .textFieldStyle(CustomTextFieldStyle())
                        .onTapGesture {
                            taskViewModel.isTextFieldInFocus = true
                        }
                    if taskViewModel.textFieldText != "" {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .onTapGesture {
                                taskViewModel.textFieldText = ""
                            }
                            .padding(.trailing, 5)
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(taskViewModel.isTextFieldInFocus ? .indigo : .gray, lineWidth: taskViewModel.isTextFieldInFocus ? 3 : 2)
                )
                // this background makes it so that the cancel button looks like it's part of the text field
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
            } else {
                HStack {
                    TextField("Enter a new task...", text: $taskViewModel.textFieldText)
                        .textFieldStyle(CustomTextFieldStyle())
                        .onTapGesture {
                            taskViewModel.isTextFieldInFocus = true
                        }
                    if taskViewModel.textFieldText != "" {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .onTapGesture {
                                taskViewModel.textFieldText = ""
                            }
                            .padding(.trailing, 5)
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(taskViewModel.isTextFieldInFocus ? .indigo : .black, lineWidth: taskViewModel.isTextFieldInFocus ? 3 : 2)
                )
                // this background makes it so that the cancel button looks like it's part of the text field
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
            }
            
            // even if the action is a function we do not add the parentheses (before moving the submitTask in the ViewModel we just had it as submitTask)
            Button(action: taskViewModel.submitTask, label: {
                Text("Submit".uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 45)
                    .frame(maxWidth: .infinity)
                    .background(.indigo)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 1)
                    )
            })
        }
        .padding(18)
        .alert(isPresented: $taskViewModel.showAlert, content: getAlert)
    }
        func getAlert() -> Alert {
            return Alert(title: Text(taskViewModel.alertTitle))
        }
    }

#Preview {
    NavigationStack {
        AddTaskView()
    }
    .environmentObject(TaskViewModel())
}
