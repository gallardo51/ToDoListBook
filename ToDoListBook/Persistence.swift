//
//  Persistence.swift
//  ToDoListBook
//
//  Created by Александр Соболев on 08.05.2024.
//

import CoreData

struct PersistentController {
    
    static let shared = PersistentController()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "ToDo")
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
            if let error = error as NSError? {
                fatalError("unresolved error: \(error)")
            }
        })
    }
}
