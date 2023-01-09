//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Dmitry Sharabin on 8.1.23..
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var toDosVM = ToDosViewModel()
    
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .environmentObject(toDosVM)
        }
    }
}
