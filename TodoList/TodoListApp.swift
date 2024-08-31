//
//  TodoListApp.swift
//  TodoList
//
//  Created by Joao Leal on 8/31/24.
//

import SwiftUI
import SwiftData

@main
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
