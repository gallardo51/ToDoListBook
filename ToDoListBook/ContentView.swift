//
//  ContentView.swift
//  ToDoListBook
//
//  Created by Александр Соболев on 08.05.2024.
//

import SwiftUI

struct Todo: Identifiable {
    let id = UUID()
    let name: String
    let category: String
}

struct ContentView: View {
    
    @State private var showAddTodoView = false
    @State private var todos = [
        Todo(name: "Write SwiftUI book", category: "work"),
        Todo(name: "Read Bible", category: "personal"),
        Todo(name: "Bring kids out to play", category: "family"),
        Todo(name: "Fetch wife", category: "family"),
        Todo(name: "family", category: "Call mum")]
    //    @Environment(\.managedObjectContext) private var viewContext
    //    @FetchRequest(sortDescriptors: []) private var todosCD: FetchedResults<TodoCD>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todos, id: \.name) { (todo) in
                    NavigationLink(destination:
                                    VStack {
                        Text(todo.name)
                        Image(todo.category)
                            .resizable()
                            .frame(width: 200, height: 200)
                    }
                    ) {
                        HStack {
                            Image(todo.category)
                                .resizable().frame(width: 30, height: 30)
                            Text(todo.name)
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    todos.remove(atOffsets: indexSet)
                })
                .onMove(perform: { indices, newOffset in
                    todos.move(fromOffsets: indices, toOffset: newOffset)
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
    
    func addTodo() {
        todos.append(Todo(name: "newTodo", category: "work"))
    }
}


#Preview {
    ContentView()
}
