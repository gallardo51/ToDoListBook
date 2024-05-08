//
//  AddTodoView.swift
//  ToDoListBook
//
//  Created by Александр Соболев on 08.05.2024.
//

import SwiftUI

struct AddTodoView: View {
    
    @Binding var showAddTodoView: Bool
    
    @State private var name: String = ""
    @State private var selectedCategory = 0
    var categoryTypes = ["family", "personal", "work"]
    
    @Binding var todos: [Todo]
    
    var body: some View {
        VStack {
            Text("Add Todo").font(.largeTitle)
            TextField("To Do name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.black).padding()
            Text("Select Category")
            Picker("", selection: $selectedCategory) {
                ForEach(0..<categoryTypes.count) {
                    Text(categoryTypes[$0])
                }
            }.pickerStyle(SegmentedPickerStyle())
            Spacer()
            Button(action: {
                showAddTodoView = false
                todos.append((Todo(name: name, category: categoryTypes[selectedCategory])))
            },
                   label: {
                Text("Done")
            })
        }
        .padding()
    }
}

#Preview {
    AddTodoView(showAddTodoView: .constant(false), todos: .constant([]))
}
