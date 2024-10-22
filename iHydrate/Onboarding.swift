//
//  Onboarding.swift
//  iHydrate
//
//  Created by Haya Albaker on 20/10/2024.
//

import SwiftUI

struct Onboarding: View {
    @State private var bodyWeight: String = ""
    
    var dailyWaterIntake: Double {
        // Calculate daily water intake based on the body weight
        if let weight = Double(bodyWeight) {
            return weight * 0.03 // Return calculated intake
        }
        return 0.0 // Default value if input is invalid
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Image("waterdrop")
            Text("Hydrate")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Stay hydrated by recording and tracking your daily water intake based on your needs.")
                .font(.body)
                .foregroundColor(.gray)
            
            HStack {
                Text("Body Weight (kg)")
                    .font(.headline)
                
                Spacer()
                
                TextField("Value", text: $bodyWeight)
                    .frame(width: 100)
                    .keyboardType(.decimalPad) // Ensure numeric input
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                
                Button(action: {
                    bodyWeight = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            
            Spacer()
            
            NavigationLink(destination: NotificationPreferences(dailyWaterIntake: dailyWaterIntake)) {
                Text("Next")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.lightBlue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
        }
        .padding()
        .padding(.top, 100)
    }
}

#Preview {
    Onboarding()
}
