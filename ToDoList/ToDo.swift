//
//  ToDo.swift
//  ToDoList
//
//  Created by Dmitry Sharabin on 9.1.23..
//

import Foundation

struct ToDo: Identifiable {
    let id = UUID().uuidString
    
    var item = ""
    var reminderIsOn = false
    var dueDate = Date.now + (60 * 60 * 24) // the next day
    var notes = ""
    var isCompleted = false
}
