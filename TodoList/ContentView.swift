//
//  ContentView.swift
//  TodoList
//
//  Created by Joao Leal on 8/31/24.
//

// on the home view add a state property to allow showing the create view and within a button add the toggle function (within the navigation Stack -> .toolbar, ToolbarItem{ Button
// Add sheet modifier, with a presentationdetents medium within a navigation Stack
// back in the create view, Create and instance of the model ToDoItem()
// i the preview add a .modelContainer for the model.self

import SwiftUI

struct ContentView: View {
    
    @State private var showCreate = false
    
    var body: some View {
        NavigationStack {
            Text("Helo2, world!")
                .toolbar{
                    ToolbarItem{
                        Button(action: {
                            showCreate.toggle()
                        }, label: {
                            Label("Add Item", systemImage: "plus")
                        })
                    }}
                .sheet(isPresented: $showCreate) {
                    NavigationStack{
                        CreateView()
                            .presentationDetents([.medium])
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
