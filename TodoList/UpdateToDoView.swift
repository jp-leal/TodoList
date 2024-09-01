//
//  UpdateToDoView.swift
//  TodoList
//
//  Created by Joao Leal on 8/31/24.
//

import SwiftUI
import SwiftData

struct UpdateToDoView: View {
    
    @Environment(\.dismiss) var dismiss
    @Bindable var item: ToDoItem
    
    var body: some View {
        List{
            TextField("Name", text: $item.name)
            DatePicker("Choose a Date", selection: $item.timeStamp)
            Toggle("Important?", isOn: $item.isCritical)
            Button("Update") {
                dismiss()
            }
        }.navigationTitle("Update ToDo")
    }
}

