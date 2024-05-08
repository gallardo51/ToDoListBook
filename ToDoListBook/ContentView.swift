//
//  ContentView.swift
//  ToDoListBook
//
//  Created by Александр Соболев on 08.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAddTodoView = false
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \TodoCD.name, ascending: false)]) private var todosCD: FetchedResults<TodoCD>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todosCD, id: \.self) { todo in
                    NavigationLink(destination:
                                    VStack {
                        Text(todo.name ?? "untitled")
                        Image(todo.category ?? "")
                            .resizable()
                            .frame(width: 200, height: 200)
                    }
                    ) {
                        HStack {
                            Image(todo.category ?? "")
                                .resizable().frame(width: 30, height: 30)
                            Text(todo.name ?? "untitled")
                        }
                    }
                    .onLongPressGesture(perform: {
                        updateTodo(todo: todo)
                    })
                }
                .onDelete(perform: { indexSet in
                    deleteTodo(offsets: indexSet)
                })
            }
            .navigationTitle("Todo Items")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { showAddTodoView.toggle()}, label: {
                        Text("Add")
                    })
                    .sheet(isPresented: $showAddTodoView, content: {
                        AddTodoView(showAddTodoView: $showAddTodoView)
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
        }
    }
    
    private func deleteTodo(offsets: IndexSet) {
        for index in offsets {
            let todo = todosCD[index]
            viewContext.delete(todo)
        }
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("unresolved error: \(error)")
        }
    }
    
    private func updateTodo(todo: FetchedResults<TodoCD>.Element) {
        todo.name = "😀"
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("unresolved error: \(error)")
        }
        
    }
}


#Preview {
    ContentView()
}
