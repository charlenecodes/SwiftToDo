//
//  AddTaskView.swift
//  SwiftToDo
//
//  Created by Charlene Lava on 4/30/24.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var taskViewModel: TaskViewModel
    @State var textFieldText: String = ""
    
    // for alerts
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            // we bind to a variable by using the $ dollar sign before it
            VStack {
                TextField("Enter a new task...", text: $textFieldText)
                    .textFieldStyle(.roundedBorder)
                    .frame(height: 50)
                    .background(.white)
                    .cornerRadius(10)
                    .foregroundColor(.indigo)
                // even if the action is a function we do not add the braces
                Button(action: submitTask, label: {
                    Text("Submit".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(.indigo)
                        .cornerRadius(10)
                })
            }
            .padding(18)
        }
        .navigationTitle("Add a task")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func submitTask() {
        if textIsAppropriate() {
            taskViewModel.addNewTask(item: textFieldText)
            // this allows us to dismiss the current view
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "The new task must be at least 3 characters long ❌"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    }

#Preview {
    NavigationView {
        AddTaskView()
    }
    .environmentObject(TaskViewModel())
}
