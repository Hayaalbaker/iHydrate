//
//  NotificationPreferences.swift
//  iHydrate
//
//  Created by Haya Albaker on 20/10/2024.
//

import SwiftUI

struct NotificationPreferences: View {
    @ObservedObject var viewModel: NotificationPreferencesViewModel
    var dailyWaterIntake: Double
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
            VStack(alignment: .leading) {
                customBackButton
                header
                timeInputSection
                notificationIntervalSection
                startButton
            }
            .padding()
            .padding(.top, 20)
            .navigationBarBackButtonHidden(true) // Hide the default back button
    }

    // MARK: - Header
    private var customBackButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss() // This will dismiss the current view
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .font(.title2)
                Text("Back")
                    .font(.headline)
            }
            .padding()
            .foregroundColor(.blue)
        }
    }
    
    private var header: some View {
        VStack(alignment: .leading) {
            Text("Notification Preferences")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            Text("The start and end hour")
                .font(.body)
            Text("Specify the start and end time to receive notifications")
                .font(.body)
                .foregroundStyle(Color(UIColor.systemGray2))
                .padding(.bottom, 20)
        }
    }
    
    // MARK: - Time Input Section
    private var timeInputSection: some View {
        ZStack {
            Rectangle()
                .fill(Color(UIColor.systemGray6))
                .frame(width: 355, height: 108)
            
            VStack {
                timeInputRow(title: "Start Time", hour: $viewModel.startHour, minute: $viewModel.startMinute, period: $viewModel.startPeriod)
                Divider().padding(0)
                timeInputRow(title: "End Time", hour: $viewModel.endHour, minute: $viewModel.endMinute, period: $viewModel.endPeriod)
            }
            .padding()
        }
        .padding(.bottom, 40)
    }
    
    private func timeInputRow(title: String, hour: Binding<String>, minute: Binding<String>, period: Binding<String>) -> some View {
        HStack {
            Text(title)
                .font(.subheadline)
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 90, height: 30)
                
                HStack(spacing: 0) {
                    TextField("HH", text: hour)
                        .frame(width: 40)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .textFieldStyle(PlainTextFieldStyle())
                    
                    Text(":").padding(0)
                    
                    TextField("MM", text: minute)
                        .frame(width: 40)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .textFieldStyle(PlainTextFieldStyle())
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 5)
            }
            .fixedSize()
            
            // AM/PM toggle
            Picker("", selection: period) {
                ForEach(viewModel.periods, id: \.self) { period in
                    Text(period).tag(period)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 100)
        }
    }
    
    // MARK: - Notification Interval Section
    private var notificationIntervalSection: some View {
        VStack(alignment: .leading) {
            Text("Notification interval")
                .font(.body)
            Text("How often would you like to receive notifications within the specified time interval?")
                .font(.body)
                .foregroundStyle(Color(UIColor.systemGray2))
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            ForEach(0..<2) { row in
                HStack(spacing: 16) {
                    ForEach(0..<4) { column in
                        let index = row * 4 + column
                        if index < viewModel.numbers.count {
                            intervalButton(index: index)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
    
    private func intervalButton(index: Int) -> some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(viewModel.selectedIndex == index ? Color(UIColor.systemCyan) : Color(UIColor.systemGray6))
            .frame(width: 77, height: 70)
            .overlay(
                VStack {
                    Text(viewModel.numbers[index])
                        .font(.system(size: 17))
                        .foregroundColor(viewModel.selectedIndex == index ? .white : Color(UIColor.systemCyan))
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text(viewModel.units[index])
                        .font(.system(size: 17))
                        .foregroundColor(viewModel.selectedIndex == index ? .white : .black)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .multilineTextAlignment(.center)
            )
            .onTapGesture {
                viewModel.selectedIndex = viewModel.selectedIndex == index ? nil : index
            }
        
    }
    
    // MARK: - Start Button
    private var startButton: some View {
        VStack {
            Spacer()
            Button(action: {

            }) {
                Text("Start")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(UIColor.systemCyan))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    NotificationPreferences(viewModel: NotificationPreferencesViewModel(), dailyWaterIntake: 0.0)
}
