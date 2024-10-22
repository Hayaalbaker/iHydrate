//
//  NotificationPreferences.swift
//  iHydrate
//
//  Created by Haya Albaker on 20/10/2024.
//

import SwiftUI

struct NotificationPreferences: View {
    // Add dailyWaterIntake property
    let dailyWaterIntake: Double

    // Start hour
    @State private var startHour: String = "3"     // Start hour input
    @State private var startMinute: String = "00"   // Start minute input
    @State private var startPeriod: String = "AM"   // Start AM/PM selection
    
    // End hour
    @State private var endHour: String = "3"       // End hour input
    @State private var endMinute: String = "00"    // End minute input
    @State private var endPeriod: String = "AM"     // End AM/PM selection
    
    let periods = ["AM", "PM"]  // Picker options for AM/PM
    
    @State private var selectedIndex: Int? = nil
    let numbers = ["15", "30", "60", "90", "2", "3", "4", "5"]
    let units = ["Mins", "Mins", "Mins", "Mins", "Hours", "Hours", "Hours", "Hours"]
    
    // Constants for styling
    private let rectangleBackgroundColor = Color(UIColor.systemGray6)
    private let selectedColor = Color(UIColor.systemCyan)
    private let unselectedColor = Color(UIColor.systemGray6)
    private let rectangleHeight: CGFloat = 70
    
    var body: some View {
        VStack(alignment: .leading) {
            headerSection
            timePickerSection
            notificationIntervalSection
            startButton
        }
        .padding()
        .padding(.top, 100)
    }
    
    // Header section
    private var headerSection: some View {
        Group {
            Text("Notification Preferences")
                .font(.title2)
                .fontWeight(.bold)
                .padding(20)
            Text("Specify the start and end time to receive notifications")
                .font(.body)
                .foregroundStyle(Color(UIColor.systemGray2))
        }
    }
    
    // Time Picker Section
    private var timePickerSection: some View {
        VStack(spacing: 20) {
            timePicker(title: "Start Time", hour: $startHour, minute: $startMinute, period: $startPeriod)
            timePicker(title: "End Time", hour: $endHour, minute: $endMinute, period: $endPeriod)
        }
        .padding(.bottom, 40)
    }

    private func timePicker(title: String, hour: Binding<String>, minute: Binding<String>, period: Binding<String>) -> some View {
        ZStack {
            Rectangle()
                .fill(rectangleBackgroundColor)
                .frame(width: 355, height: 108)

            VStack {
                HStack {
                    Text(title)
                        .font(.subheadline)
                    Spacer()
                    timeInput(hour: hour, minute: minute)
                    Picker("", selection: period) {
                        ForEach(periods, id: \.self) { period in
                            Text(period).tag(period)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 100)
                }
                Divider()
            }
            .padding()
        }
    }
    
    private func timeInput(hour: Binding<String>, minute: Binding<String>) -> some View {
        HStack(spacing: 0) {
            TextField("HH", text: hour)
                .frame(width: 40)
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .textFieldStyle(PlainTextFieldStyle())
            
            Text(":")
                .padding(0)
            
            TextField("MM", text: minute)
                .frame(width: 40)
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .textFieldStyle(PlainTextFieldStyle())
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.trailing, 5)
    }
    
    // Notification Interval Section
    private var notificationIntervalSection: some View {
        VStack(alignment: .leading) {
            Text("Notification Interval")
                .font(.body)
            Text("How often would you like to receive notifications within the specified time interval?")
                .font(.body)
                .foregroundStyle(Color(UIColor.systemGray2))
            
            ForEach(0..<2) { row in
                HStack(spacing: 16) {
                    ForEach(0..<4) { column in
                        let index = row * 4 + column
                        if index < numbers.count { // Ensure we don't go out of bounds
                            notificationIntervalOption(index: index)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
    
    private func notificationIntervalOption(index: Int) -> some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(selectedIndex == index ? selectedColor : unselectedColor)
            .frame(width: 77, height: rectangleHeight)
            .overlay(
                VStack {
                    Text(numbers[index])
                        .font(.system(size: 17))
                        .foregroundColor(selectedIndex == index ? .white : selectedColor)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text(units[index])
                        .font(.system(size: 17))
                        .foregroundColor(selectedIndex == index ? .white : .black)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .multilineTextAlignment(.center)
            )
            .onTapGesture {
                selectedIndex = selectedIndex == index ? nil : index
            }
    }

    // Start Button
    private var startButton: some View {
        Button(action: {
            // Handle start action
        }) {
            Text("Start")
                .frame(maxWidth: .infinity)
                .padding()
                .background(selectedColor)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding(.top) // Add some padding to the top of the button
    }
}

// Preview
#Preview {
    NotificationPreferences(dailyWaterIntake: 2.7) // Provide a sample value for preview
}
