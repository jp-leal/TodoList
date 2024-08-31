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
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var context
    
    @Query private var items: [ToDoItem]
    @State private var showCreate = false
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(items) { item in
                    HStack{
                        VStack(alignment: .leading){
                            if item.isCritical{
                                Image(systemName: "exclamationmark.3")
                                    .symbolVariant(.fill)
                                    .foregroundStyle(.red)
                                    .font(.largeTitle)
                                    .bold()
                            }
                            Text(item.name)
                                .font(.largeTitle)
                                .bold()
                            Text("\(item.timeStamp, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                                .font(.callout)
                        }
                        Spacer()
                        
                        Button{}
                        label:{
                            Image(systemName: "checkmark")
                                .symbolVariant(.circle.fill)
                                .foregroundStyle(item.isCompleted ? .green : .gray)
                                .font(.largeTitle)
                        }
                        .buttonStyle(.plain)
                    }
                    .swipeActions {
                        Button(role: .destructive){
                            withAnimation {
                                context.delete(item)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                                .symbolVariant(.fill)
                        
                        }
                    }
                }}
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
