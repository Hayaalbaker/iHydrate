//
//  NotificationPreferences.swift
//  iHydrate
//
//  Created by Haya Albaker on 20/10/2024.
//

import SwiftUI

struct NotificationPreferences: View {
    @State private var bodyWeight: String = ""

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


                Spacer()
                
                Button(action: {
                }) {
                    Text("Start")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.lightBlue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

            }
            .padding()
            .padding(.top, 100)
        }}

#Preview {
    NotificationPreferences()
    }

