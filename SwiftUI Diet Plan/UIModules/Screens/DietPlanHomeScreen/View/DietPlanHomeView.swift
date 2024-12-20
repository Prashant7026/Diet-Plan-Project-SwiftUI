//
//  DietPlanHomeView.swift
//  SwiftUI Diet Plan
//
//  Created by Prashant Kumar Soni on 19/12/24.
//

import SwiftUI

struct DietPlanHomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 16.0)
                HeaderView()
                Spacer()
                    .frame(height: 18.0)
                DietStreakView()
                Spacer()
                
            }
            .padding(.horizontal, 16.0)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {
                        print("Back Arrow Button Tapped!")
                    }) {
                        backArrowButton()
                    }
                }
            }
        }
        
    }
    
    private func backArrowButton() -> some View {
        ZStack {
            Circle()
                .fill(Color(red: 246.0/255.0, green: 246.0/255.0, blue: 246.0/255.0))
                .frame(width: 44.0, height: 44.0)
                .cornerRadius(10)
                .overlay(
                    Circle()
                        .stroke(Color(red: 190.0/255.0, green: 190.0/255.0, blue: 190.0/255.0), lineWidth: 1.0)
                )
            AppImageProvider.backArrowIcon
                .resizable()
                .frame(width: 10.0, height: 20)
        }
    }
}

#Preview {
    DietPlanHomeView()
}
