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
    @State private var showSampleDataalert = false
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
                            HStack{
                                Text(todo.title)
                                    .strikethrough( todo.isCompleted )
                                .foregroundColor(todo.isOverdue ? .red : .primary)
                                
                                Text(todo.isOverdue ? "Overdue" : "")
                                    .font(.caption)
                                    .italic()
                                    .foregroundColor(.red)
                                    .opacity(0.6)
                                
                            }
                            
                            if !todo.subtitle.isEmpty {
                                Text(todo.subtitle)
                                    .font(.callout)
                                    .foregroundColor(.gray)
                                    .strikethrough( todo.isCompleted )
                            }
                            if todo.selectedDate != nil {
                                                            Text(formatDate(date: todo.selectedDate!))
                                                                .font(.caption)
                                                            .foregroundColor(.gray)}
                            
                            if todo.selectedTime != nil {
                                                        Text(formatTime(time: todo.selectedTime!))
                                                            .font(.caption)
                                                            .foregroundColor(.gray)
                                                        
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
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button{
                       showSheet=true
                    }label: {
                        Image(systemName: "plus")
                    }
                    
                    #if DEBUG
                    Button{
                        showSampleDataalert=true
                    }label: {
                        Image(systemName:"clipboard")
                    }
                    #endif
                }
                }
            .sheet(isPresented: $showSheet) {
                CreateTodoView(sourceArray: $todoManager.todos)
                    .presentationDetents([.medium])
                     .presentationDragIndicator(.visible)
            }
            .alert("are you sure you want to load sample data? WARNING: this will eradicate ur previously made todos.", isPresented: $showSampleDataalert){
                Button("load",role: .destructive){
                    todoManager.loadSampleDate()
                }
            }
            }
            }
        }
    



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

