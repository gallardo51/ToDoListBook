//
//  AddTodoView.swift
//  ToDoListBook
//
//  Created by Александр Соболев on 08.05.2024.
//

import SwiftUI

struct AddTodoView: View {
    
    @Binding var showAddTodoView: Bool
    
    var body: some View {
        Text("Add Todo View")
        Button(action: {
            showAddTodoView = false
        },
               label: {
            Text("Done")
        })
    }
}

#Preview {
    AddTodoView(showAddTodoView: .constant(false))
}
