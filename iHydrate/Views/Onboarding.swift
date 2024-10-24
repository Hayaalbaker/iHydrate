//
//  Onboarding.swift
//  iHydrate
//
//  Created by Haya Albaker on 20/10/2024.
//

import SwiftUI

struct Onboarding: View {
    @StateObject private var viewModel = OnboardingViewModel()

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
                        .font(.system(size: 17))

                    Spacer()

                    TextField("Value", text: $viewModel.bodyWeight)
                        .frame(width: 100)
                        .keyboardType(.decimalPad)
                        .padding(8)
                        .cornerRadius(5)

                    Button(action: {
                        viewModel.bodyWeight = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
                .padding([.all], 10)
                .background(Color(.systemGray6))

                Spacer()

                NavigationLink(destination: NotificationPreferences(viewModel: NotificationPreferencesViewModel(), dailyWaterIntake: viewModel.dailyWaterIntake)) {
                    Text("Next")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.bodyWeight.isEmpty ? Color.gray : Color.lightBlue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                        .padding(.top, 20)
                }
                .disabled(viewModel.bodyWeight.isEmpty)
            }
            .padding()
            .padding(.top, 100)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    Onboarding()
}
