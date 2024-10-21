//
//  Onboarding.swift
//  iHydrate
//
//  Created by Haya Albaker on 20/10/2024.
//

import SwiftUI

struct Onboarding: View {
@State private var bodyWeight: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Image("waterdrop")
            Text("Hydrate")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Start with Hydrate to record and track your water intake daily based on your needs and stay hydrated")
                .font(.body)
                .foregroundColor(.gray)
        HStack {
            Text("Body weight")
                .font(.headline)
        Spacer()
            TextField("Value", text: $bodyWeight)
                .frame(width: 100)
            
            Button(action: {
                bodyWeight = ""
                }) {
            Image(systemName: "xmark.circle.fill")
                .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color(.systemGray6))

            Spacer()
            
            Button(action: {
            }) {
                Text("Next")
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
    Onboarding()
}
