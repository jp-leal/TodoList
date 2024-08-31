//
//  CreateView.swift
//  TodoList
//
//  Created by Joao Leal on 8/31/24.
//

import SwiftUI

struct CreateView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List{
            TextField("Title", text: .constant(""))
            DatePicker("Choose a data", selection: .constant(.now))
            Toggle("Important?", isOn: .constant(false))
            Button("Create") {
                dismiss()
            }
        }
        .navigationTitle("Create To Do")
    }
    
}

#Preview {
    CreateView()
}
