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

        if let weight = Double(bodyWeight) {
            return weight * 0.03
        }
        return 0.0
    }

    var body: some View {
        NavigationView {
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
                        .background(bodyWeight.isEmpty ? Color.gray : Color.lightBlue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                        .padding(.top, 20)
                }
                .disabled(bodyWeight.isEmpty)

            }
            .padding()
            .padding(.top, 100)
        }
    }
}

#Preview {
    Onboarding()
}
