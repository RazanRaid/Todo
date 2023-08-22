//
//  ContentView.swift
//  ToDo App
//
//  Created by Razan Raid on 19/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var todoManager = TodoManager()
    @State private var showSheet = false
    var body: some View {
        
        NavigationStack {
            List($todoManager.todos, editActions: [.delete,.move]){ $todo in
                
                NavigationLink{
                    TodoDetailView(todo: $todo)
                }label: {
                    HStack {
                        Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                            .onTapGesture {
                                todo.isCompleted.toggle()
                            }
                        Text(todo.priortise ? "‼️" : "")
                        VStack(alignment: .leading ){
                            Text(todo.title)
                                .strikethrough( todo.isCompleted )
                            
                            if !todo.subtitle.isEmpty {
                                Text(todo.subtitle)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .strikethrough( todo.isCompleted )
                                
                                if todo.selectedDate != nil {
                                                                Text(formatDate(date: todo.selectedDate!))
                                                                    .font(.caption)
                                                                .foregroundColor(.gray)}
                                    
                            }
                        }
                    }
                    
                }
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                    }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                       showSheet=true
                    }label: {
                        Image(systemName: "plus")
                    }
                    
                }
                }
            .sheet(isPresented: $showSheet) {
                CreateTodoView(sourceArray: $todoManager.todos)
                    .presentationDetents([.medium])
                     .presentationDragIndicator(.visible)
            }

            }
            }
        }
    



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

