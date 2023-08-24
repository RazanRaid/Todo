//
//  ContentView.swift
//  ToDo App
//
//  Created by Razan Raid on 19/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var todoManager = TodoManager()
    
    var body: some View {
        
        
        TabView{
            MainTodoListView(todoManager: todoManager)
                .tabItem {
                    Image(systemName: "list.bullet.clipboard")
                    Text("Todo List")
                }
            HowManyMoreViews(todoManager: todoManager)
                .tabItem {
                    Image(systemName: "checkmark.circle.badge.questionmark.fill")
                    Text("Todos left")
                }
                }
            
        }
    }
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    

