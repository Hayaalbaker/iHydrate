//
//  iHydrateApp.swift
//  iHydrate
//
//  Created by Haya Albaker on 20/10/2024.
//

import SwiftUI
import UserNotifications

@main
struct iHydrateApp: App {
    init() {
        requestNotificationPermission()
    }

    var body: some Scene {
        WindowGroup {
            Onboarding()
        }
    }

    private func requestNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                print("Permission granted")
            } else if let error = error {
                print("Error requesting permission: \(error.localizedDescription)")
            }
        }
    }
}
