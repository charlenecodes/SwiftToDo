//
//  GettingStartedView.swift
//  SwiftToDo
//
//  Created by Charlene Lava on 6/17/24.
//

import SwiftUI

struct GettingStartedView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                Text("✨ Getting Started ✨")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(taskViewModel.isAppInLightMode ? .accentColor : .cyan)
                    .padding(.vertical, 10)
                
                // putting the HStacks inside the VStack with the alignment in leading allows the list to all be closer to the left side
                VStack (alignment: .leading) {
                    // we want the alignment of the HStack to be centered because we want the image and text to be centered horizontally relative to each other
                    HStack (alignment: .center) {
                        Image(systemName: taskViewModel.isComplete ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(taskViewModel.isComplete ? .green : .red)
                            if taskViewModel.isComplete {
                                    Text("Tap to undo")
                                    .foregroundColor(taskViewModel.isAppInLightMode ? .gray : .white)
                                    .strikethrough(color: .accentColor)
                            } else {
                                Text("Tap task to mark as complete")
                                    .fontWeight(.bold)
                                    .foregroundColor(taskViewModel.isAppInLightMode ? .black : .white)
                            }
                    }
                    .onTapGesture {
                        taskViewModel.isComplete.toggle()
                    }
                    // frame alignment (.leading in this case) affects how the entire HStack content is positioned within its available space horizontally
                    // By using both, you ensure the content inside the HStack is centered vertically relative to each other while the entire HStack is aligned to the leading edge of its containing frame
                    // without alignment leading, the items inside the VStack are all on the leading edge, except the first item
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack (alignment: .center) {
                        Text("👈")
                        Text("Swipe left to delete")
                    }
                    .foregroundColor(taskViewModel.isAppInLightMode ? .black : .white)
                    
                    HStack (alignment: .center) {
                        Text("👆")
                        Text("Click edit and drag to move items")
                    }
                    .foregroundColor(taskViewModel.isAppInLightMode ? .black : .white)
                }
                Spacer()
            }
                    .padding(.horizontal, 25)
        }
    }
}

#Preview {
    GettingStartedView()
}
