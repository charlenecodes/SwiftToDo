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
    @State var isDoubleClicked = false
    
    var body: some View {
        NavigationView {
            VStack{
                if taskList.isEmpty {
                    Spacer()
                    Text("Enter a task below").padding(7)
                    HStack{
                        Text("Click the")
                        Image(systemName: "plus.circle.fill")
                        Text("to add a new task")
                    }
                    
                    Spacer()
                } else {
                    List{
                        ForEach(taskList.indices, id: \.self) { index in
                            HStack{
                                Text(taskList[index])
                                    .onTapGesture (count: 2) {
                                        isDoubleClicked.toggle()
                                    }
                                Spacer()
                                Text("❌")
                                    .onTapGesture {
                                        taskList.remove(at: index)
                                    }
                            }
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
                            taskList.append(taskEntry)
                            if isActive {
                                isActive.toggle()
                            }
                            if taskEntry != "" {
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
