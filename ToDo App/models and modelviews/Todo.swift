//
//  Todo.swift
//  ToDo App
//
//  Created by Razan Raid on 19/08/2023.
//

import SwiftUI

struct Todo: Identifiable, Codable {
    var id = UUID()
    var title : String
    var isCompleted = false
    var subtitle = ""
    var selectedDate : Date?
    var selectedTime : Date?
    var priortise = false
    var isOverdue: Bool {
        if let selectedDate = selectedDate {
            let calendar = Calendar.current
            let currentDate = calendar.startOfDay(for: Date())
            return selectedDate  < currentDate
        }
        return false
    }
}

func formatDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMMM yyyy"
    return dateFormatter.string(from: date)
}

func formatTime(time: Date) -> String {
    let timeFormatter = DateFormatter()
    timeFormatter.timeStyle = .short
    return timeFormatter.string(from: time)
}
