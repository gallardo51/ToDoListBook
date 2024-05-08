//
//  AddTodoView.swift
//  ToDoListBook
//
//  Created by Александр Соболев on 08.05.2024.
//

import SwiftUI

struct AddTodoView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @Binding var showAddTodoView: Bool
    
    @State private var name: String = ""
    @State private var selectedCategory = 0
    var categoryTypes = ["family", "personal", "work"]
    
    var body: some View {
        VStack {
            Text("Add Todo").font(.largeTitle)
            TextField("To Do name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.black)
                .padding()
            Text("Select Category")
            Picker("", selection: $selectedCategory) {
                ForEach(0..<categoryTypes.count, id: \.self) {
                    Text(categoryTypes[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
            
            Button(
                action: {
                    showAddTodoView = false
                    let newTodoCD = TodoCD(context: viewContext)
                    newTodoCD.name = name
                    newTodoCD.category = categoryTypes[selectedCategory]
                    do {
                        try viewContext.save()
                    } catch {
                        let error = error as NSError
                        fatalError("unresolved error: \(error)")
                    }
                },
                label: {
                    Text("Done")
                }
            )
        }
        .padding()
    }
}

#Preview {
    AddTodoView(showAddTodoView: .constant(false))
}
