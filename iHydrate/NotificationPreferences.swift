//
//  NotificationPreferences.swift
//  iHydrate
//
//  Created by Haya Albaker on 20/10/2024.
//

import SwiftUI

struct NotificationPreferences: View {
    // Start hour
    @State private var startHour: String = "3"     // Start hour input
    @State private var startMinute: String = "00"   // Start minute input
    @State private var startPeriod: String = "AM"   // Start AM/PM selection
    
    // End hour
    @State private var endHour: String = "3"       // End hour input
    @State private var endMinute: String = "00"    // End minute input
    @State private var endPeriod: String = "AM"    // End AM/PM selection
    
    let periods = ["AM", "PM"]  // Picker options for AM/PM
    
    @State private var selectedIndex: Int? = nil
    let numbers = ["15", "30", "60", "90", "2", "3", "4", "5"]
    let units = ["Mins", "Mins", "Mins", "Mins", "Hours", "Hours", "Hours", "Hours"]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // Title and description
            Text("Notification Preferences")
                .font(.title2)
                .fontWeight(.bold)
                .padding(20)
            Text("The start and end hour")
                .font(.body)
            Text("Specify the start and end time to receive notifications")
                .font(.body)
                .foregroundStyle(Color(UIColor.systemGray2))
            
// MARK: - START AND END
            ZStack {
                Rectangle()
                    .fill(Color(UIColor.systemGray6))
                    .frame(width: 355, height: 108)

                VStack() {
                    
// MARK: START
                    HStack() {
                        Text("Start Time")
                            .font(.subheadline)
                        
                        Spacer()
                            // Hour input field
                            TextField("HH", text: $startHour)
                                .frame(width: 40)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad) // Number pad input
                                .textFieldStyle(RoundedBorderTextFieldStyle()) // Rounded style for input box
                            
                            Text(":") // Colon separator
                            
                            // Minute input field
                            TextField("MM", text: $startMinute)
                                .frame(width: 40)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad) // Number pad input
                                .textFieldStyle(RoundedBorderTextFieldStyle()) // Rounded style for input box
                            
                            // AM/PM toggle
                            Picker("", selection: $startPeriod) {
                                ForEach(periods, id: \.self) { period in
                                    Text(period).tag(period)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle()) // AM/PM picker style
                            .frame(width: 100)
                        
                    }
                    Divider()
                        .padding(0)
// MARK: END
                    HStack() {
                        Text("End Time")
                            .font(.subheadline)
                        Spacer()

                        ZStack {
                            // Gray rounded rectangle background
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 90, height: 30) // Adjust width as needed
                            
                            HStack(spacing: 0) { // Set spacing to 0 to keep the elements close together
                                // Hour input field
                                TextField("HH", text: $endHour)
                                    .frame(width: 40)
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad) // Number pad input
                                    .textFieldStyle(PlainTextFieldStyle()) // Use PlainTextFieldStyle for no borders

                                Text(":") // Colon separator
                                    .padding(0) // Remove any padding around the colon
                                
                                // Minute input field
                                TextField("MM", text: $endMinute)
                                    .frame(width: 40)
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad) // Number pad input
                                    .textFieldStyle(PlainTextFieldStyle()) // Use PlainTextFieldStyle for no borders
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing) // Align to the right
                            .padding(.trailing, 5) // Optional: Add some padding to the right edge
                        }
                        .fixedSize() // Ensures the ZStack takes only the size it needs
                        
                        
                        
                        
                        // AM/PM toggle
                            Picker("", selection: $endPeriod) {
                                ForEach(periods, id: \.self) { period in
                                    Text(period).tag(period)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle()) // AM/PM picker style
                            .frame(width: 100)
                        
                    }
                }
                .padding()
            }// END START AND END
            .padding(.bottom, 40)
            
// MARK: - NOTIF INTERVAL
            
            Text("Notification interval")
                .font(.body)
            Text("How often would you like to receive notifications within the specified time interval?")
                .font(.body)
                .foregroundStyle(Color(UIColor.systemGray2))


            ForEach(0..<2) { row in
                HStack(spacing: 16) {
                    ForEach(0..<4) { column in
                        let index = row * 4 + column
                        if index < numbers.count { // Ensure we don't go out of bounds
                            RoundedRectangle(cornerRadius: 12)
                                .fill(selectedIndex == index ? Color(UIColor.systemCyan) : Color(UIColor.systemGray6)) // Blue when selected, gray when not
                                .frame(width: 77, height: 70)
                                .overlay(
                                    VStack {
                                        Text(numbers[index]) // Display the number part
                                            .font(.system(size: 17))
                                            .foregroundColor(selectedIndex == index ? .white : Color(UIColor.systemCyan))
                                            .frame(maxWidth: .infinity, alignment: .center)

                                        Text(units[index])
                                            .font(.system(size: 17))
                                            .foregroundColor(selectedIndex == index ? .white : .black)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .multilineTextAlignment(.center)
                                )
                                .onTapGesture {
                                    selectedIndex = selectedIndex == index ? nil : index
                                }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            
// MARK: - BUTTON
            Spacer()
            Button(action: {
                // Handle start action
            }) {
                Text("Start")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(UIColor.systemCyan))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }// MAIN VSTACK
        .padding()
        .padding(.top, 100)
    }
}

// Preview
#Preview {
    NotificationPreferences()
}
