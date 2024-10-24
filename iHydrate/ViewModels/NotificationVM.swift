//
//  NotificationVM.swift
//  iHydrate
//
//  Created by Haya Albaker on 24/10/2024.
//

import Foundation

class NotificationPreferencesViewModel: ObservableObject {
    @Published var startHour: String = "3"
    @Published var startMinute: String = "00"
    @Published var startPeriod: String = "AM"

    @Published var endHour: String = "3"
    @Published var endMinute: String = "00"
    @Published var endPeriod: String = "AM"

    @Published var selectedIndex: Int? = nil

    let periods = ["AM", "PM"]
    let numbers = ["15", "30", "60", "90", "2", "3", "4", "5"]
    let units = ["Mins", "Mins", "Mins", "Mins", "Hours", "Hours", "Hours", "Hours"]
}
