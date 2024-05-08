//
//  ToDoListBookApp.swift
//  ToDoListBook
//
//  Created by Александр Соболев on 08.05.2024.
//

import SwiftUI

@main
struct ToDoListBookApp: App {
    var body: some Scene {
        
        let persistentContainer = PersistentController.shared
        
        WindowGroup {
            ContentView().environment(
                \.managedObjectContext,
                 persistentContainer.container.viewContext
            )
        }
    }
}
