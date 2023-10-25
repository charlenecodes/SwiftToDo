//
//  ContentView.swift
//  SwiftToDo
//
//  Created by Charlene Lava on 10/19/23.
//

import SwiftUI

struct ContentView: View {
    @State var taskList: [String] = []
    @State var taskEntry: String = ""
    @State var isActive = false
    @State var doubleClicked = false
    @State var isComplete = false
    
    var body: some View {
        NavigationView {
            VStack{
                if taskList.isEmpty {
                    Spacer()
                    Text("Enter a task below").padding(4)
                    HStack{
                        Text("Click the")
                        Image(systemName: "plus.circle.fill")
                        Text("to add a new task")
                    }
                    Text("Click ❌ to delete").padding(2)
                    
                    Spacer()
                } else {
                    List{
                        ForEach(taskList.indices, id: \.self) { i in
                            HStack{
                                isComplete ? Text("✅") : Text("")
                                doubleClicked ? Text(taskList[i]).strikethrough() : Text(taskList[i])
                                Spacer()
                                Text("❌")
                                    .onTapGesture {
                                        taskList.remove(at: i)
                                    }
                            }
//                                need to fix so only one item is selected
//                                .onTapGesture (count: 2) {
//                                    doubleClicked.toggle()
//                                }
//                                .onTapGesture {
//                                    isComplete.toggle()
//                                }
                                
                        }
                    }
                    Spacer()
                }
                HStack {
                    TextField("Enter a task", text: $taskEntry)
                        .font(.headline)
                        .foregroundColor(isActive ? Color(.purple) : Color(.lightGray))
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(.lightGray), lineWidth: 1.0)
                        )
                        .onTapGesture {
                            if !isActive {
                                isActive.toggle()
                            }
                        }
                    Image(systemName: "plus.circle.fill")
                        .onTapGesture {
                            if isActive {
                                isActive.toggle()
                            }
                            if taskEntry != "" {
                                taskList.append(taskEntry)
                                taskEntry.removeAll()
                            }
                        }
                }
                .padding()
            }
            .navigationTitle("To Do List 📝")
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
