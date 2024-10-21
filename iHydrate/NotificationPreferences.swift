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
                .foregroundColor(.gray)
            
// MARK: - START AND END
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 100)
                
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

                            // Hour input field
                            TextField("HH", text: $endHour)
                                .frame(width: 40)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad) // Number pad input
                                .textFieldStyle(RoundedBorderTextFieldStyle()) // Rounded style for input box
                            
                            Text(":") // Colon separator
                            
                            // Minute input field
                            TextField("MM", text: $endMinute)
                                .frame(width: 40)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad) // Number pad input
                                .textFieldStyle(RoundedBorderTextFieldStyle()) // Rounded style for input box
                            
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
                .foregroundColor(.gray)
            
            Spacer()

            
// MARK: - BUTTON
            Button(action: {
                // Handle start action
            }) {
                Text("Start")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
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
