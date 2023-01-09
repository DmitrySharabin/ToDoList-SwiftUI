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
//        toDos.append(ToDo(id: UUID().uuidString, item: "Learn Swift"))
//        toDos.append(ToDo(id: UUID().uuidString, item: "Build Apps"))
//        toDos.append(ToDo(id: UUID().uuidString, item: "Change the World!"))
        loadData()
    }
    
    func saveToDo(toDo: ToDo) {
        if toDo.id == nil {
            var newToDo = toDo
            newToDo.id = UUID().uuidString
            toDos.append(newToDo)
        } else {
            if let index = toDos.firstIndex(where: { $0.id == toDo.id }) {
                toDos[index] = toDo
            }
        }
        saveData()
    }
    
    func deleteToDo(indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
        saveData()
    }
    
    func moveToDo(fromOffsets: IndexSet, toOffset: Int) {
        toDos.move(fromOffsets: fromOffsets, toOffset: toOffset)
        saveData()
    }
    
    func toggleCompleted(toDo: ToDo) {
        guard toDo.id != nil else { return }
        if let index = toDos.firstIndex(where: { $0.id == toDo.id }) {
            toDos[index].isCompleted.toggle()
        }
        saveData()
    }
    
    func loadData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        guard let data = try? Data(contentsOf: path) else { return }
        do {
            toDos = try JSONDecoder().decode([ToDo].self, from: data)
        } catch {
            print("😡 ERROR: Could not save data \(error.localizedDescription)")
        }
    }
    
    func saveData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode(toDos) // try? means if error thrown, data = nil
        do {
            try data?.write(to: path)
        } catch {
            print("😡 ERROR: Could not save data \(error.localizedDescription)")
        }
    }
    
    func purgeData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode("")
        do {
            try data?.write(to: path)
        } catch {
            print("😡 ERROR: Could not save data \(error.localizedDescription)")
        }
    }
}
