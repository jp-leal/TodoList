//
//  ToDoItem.swift
//  TodoList
//
//  Created by Joao Leal on 8/31/24.
//

import Foundation
import SwiftData
//define the model with swiftdata
//Register .container in the appdata
//Create the create todo view

@Model
final class ToDoItem{
    var title: String
    var timeStamp: Date
    var isCritical: Bool
    var isCompleted: Bool
    
    init(title: String = "", timeStamp: Date = .now, isCritical: Bool = false, isCompleted: Bool = false) {
        self.title = title
        self.timeStamp = timeStamp
        self.isCritical = isCritical
        self.isCompleted = isCompleted
    }
    
}
