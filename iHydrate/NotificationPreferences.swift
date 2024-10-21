//
//  NotificationPreferences.swift
//  iHydrate
//
//  Created by Haya Albaker on 20/10/2024.
//

import SwiftUI

struct NotificationPreferences: View {
    @State private var startHour: String = "3"     // Start hour input
    @State private var startMinute: String = "00"   // Start minute input
    @State private var startPeriod: String = "AM"   // Start AM/PM selection
    
    @State private var endHour: String = "3"       // End hour input
    @State private var endMinute: String = "00"    // End minute input
    @State private var endPeriod: String = "AM"    // End AM/PM selection
    
    let hours = Array(1...12)    // Define the hours array
    let periods = ["AM", "PM"]   // Picker options
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Notification Preferences")
                .font(.title2)
                .fontWeight(.bold)
            Text("The start and end hour")
                .font(.body)
            Text("Specify the start and end date to receive the notifications")
                .font(.body)
                .foregroundColor(.gray)
            
            // Gray box container
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 200)
                
                VStack(spacing: 40) {
                    
                    // Start hour picker
                    HStack {
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
                    
                    // End hour picker
                    HStack {
                        Text("End hour")
                            .font(.subheadline)
                        
                        Picker("", selection: $endHour) {
                            ForEach(hours, id: \.self) { hour in
                                Text("\(hour)").tag(hour)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 60)
                        
                        Picker("", selection: $endPeriod) {
                            ForEach(periods, id: \.self) { period in
                                Text(period).tag(period)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: 100)
                    }
                }
                .padding()
            }
            
            Spacer()
            
            Button(action: {
                // Action for the button
            }) {
                Text("Start")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .padding(.top, 100)
    }
}

#Preview {
    NotificationPreferences()
}
