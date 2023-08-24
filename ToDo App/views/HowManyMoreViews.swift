//
//  HowManyMoreViews.swift
//  ToDo App
//
//  Created by Razan Raid on 23/08/2023.
//

import SwiftUI

struct HowManyMoreViews: View {
    
    @ObservedObject var todoManager : TodoManager
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HowManyMoreViews_Previews: PreviewProvider {
    static var previews: some View {
        HowManyMoreViews(todoManager: TodoManager())
    }
}
