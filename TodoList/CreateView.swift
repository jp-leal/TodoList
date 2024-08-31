//
//  CreateView.swift
//  TodoList
//
//  Created by Joao Leal on 8/31/24.
//

//bind the instance to the forms
// in order to access the context and insert it.. add an @environment property of the model context, then on the create button insert it.
//in order to get the data, back in home view import swiftdata and add add Query, which is gonna be an array of the model

import SwiftUI

struct CreateView: View {
    
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @State private var item = ToDoItem()
    
    var body: some View {
        List{
            TextField("Title", text: $item.title)
            DatePicker("Choose a data", selection: $item.timeStamp)
            Toggle("Important?", isOn: $item.isCritical)
            Button("Create") {
                withAnimation{
                    context.insert(item)
                }
                    dismiss()
            }
        }
        .navigationTitle("Create To Do")
    }
    
}

#Preview {
    CreateView()
        .modelContainer(for: ToDoItem.self)
}
