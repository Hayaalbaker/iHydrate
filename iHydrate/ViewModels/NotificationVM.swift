//
//  NotificationVM.swift
//  iHydrate
//
//  Created by Haya Albaker on 24/10/2024.
//

import Foundation
import UserNotifications

class NotificationPreferencesViewModel: ObservableObject {
    @Published var startHour: String = "3"
    @Published var startMinute: String = "00"
    @Published var startPeriod: String = "AM"

    @Published var endHour: String = "3"
    @Published var endMinute: String = "00"
    @Published var endPeriod: String = "AM"

    @Published var selectedIndex: Int? = nil
    @Published var selectedIntervalIndex: Int? = nil
    
    let periods = ["AM", "PM"]
    let numbers = ["15", "30", "60", "90", "2", "3", "4", "5"]
    let units = ["Mins", "Mins", "Mins", "Mins", "Hours", "Hours", "Hours", "Hours"]

    func scheduleNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()

        guard let intervalIndex = selectedIntervalIndex else { return }

        let intervalMinutes = calculateIntervalMinutes(index: intervalIndex)
        if intervalMinutes == 0 { return }
        
        let startTime = convertTo24HourFormat(hour: startHour, minute: startMinute, period: startPeriod)
        let endTime = convertTo24HourFormat(hour: endHour, minute: endMinute, period: endPeriod)

        var nextTriggerTime = startTime
        while nextTriggerTime <= endTime {
            scheduleNotification(at: nextTriggerTime)
            nextTriggerTime += Double(intervalMinutes) * 60
        }
    }

    private func calculateIntervalMinutes(index: Int) -> Int {
        let number = Int(numbers[index]) ?? 0
        let unit = units[index]
        return unit == "Hours" ? number * 60 : number
    }

    private func convertTo24HourFormat(hour: String, minute: String, period: String) -> TimeInterval {
        var hourInt = Int(hour) ?? 0
        let minuteInt = Int(minute) ?? 0
        
        if period == "PM" && hourInt != 12 {
            hourInt += 12
        } else if period == "AM" && hourInt == 12 {
            hourInt = 0
        }
        
        return TimeInterval(hourInt * 3600 + minuteInt * 60)
    }

    private func scheduleNotification(at triggerTime: TimeInterval) {
        let content = UNMutableNotificationContent()
        content.title = "iHydrate Reminder"
        content.body = "Time to drink water!"
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: triggerTime, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Notification scheduling error: \(error)")
            }
        }
    }

    func cancelNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
