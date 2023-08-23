//
//  DateFunctions.swift
//  ToDo App
//
//  Created by Razan Raid on 23/08/2023.
//

import Foundation

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
