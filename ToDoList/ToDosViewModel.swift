//
//  ToDosViewModel.swift
//  ToDoList
//
//  Created by Dmitry Sharabin on 9.1.23..
//

import Foundation

class ToDosViewModel: ObservableObject {
    @Published var toDos: [ToDo] = []
    
    init() {
        // Temp data here.
        toDos.append(ToDo(item: "Learn Swift"))
        toDos.append(ToDo(item: "Build Apps"))
        toDos.append(ToDo(item: "Change the World!"))
    }
    
    func saveToDo(toDo: ToDo, newTodo: Bool) {
        if newTodo {
            toDos.append(toDo)
        } else {
            if let index = toDos.firstIndex(where: { $0.id == toDo.id }) {
                toDos[index] = toDo
            }
        }
    }
    
    func delete(indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
    }
    
    func move(fromOffsets: IndexSet, toOffset: Int) {
        toDos.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
}
