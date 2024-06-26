//
//  CustomTextFieldStyle.swift
//  SwiftToDo
//
//  Created by Charlene Lava on 6/17/24.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    @EnvironmentObject var taskViewModel: TaskViewModel

    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.leading, 10)
            .frame(height: 40)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(10)
            .foregroundColor(taskViewModel.isAppInLightMode ? .indigo : .white)
            .accentColor(.indigo)
    }
}
