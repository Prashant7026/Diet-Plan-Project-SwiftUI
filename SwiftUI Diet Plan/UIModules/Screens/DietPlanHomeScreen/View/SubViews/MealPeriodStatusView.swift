//
//  MealPeriodStatusView.swift
//  SwiftUI Diet Plan
//
//  Created by Prashant Kumar Soni on 20/12/24.
//

import SwiftUI

struct MealPeriodStatusView: View {
    var mealDayTime: Daytime
    
    var body: some View {
        HStack {
            mealPeriod()
            Spacer()
            statusView()
        }
    }
    
    private func mealPeriod() -> some View {
        VStack(alignment: .leading, spacing: 2.0) {
            Group{
                switch mealDayTime {
                case .morningMeals:
                    Text("Morning Meals")
                case .afternoonMeals:
                    Text("Afternoon Meals")
                case .eveningMeals:
                    Text("Evening Meals")
                case .nightMeals:
                    Text("Night Meals")
                }
            }
            .bold()
            Text("6AM - 11:59AM")
                .foregroundColor(Color(red: 113.0/255.0, green: 113.0/255.0, blue: 113.0/255.0))
                .bold()
        }
    }
    
    private func statusView() -> some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Status")
            Text("1 of 3")
        }
        .foregroundColor(Color(red: 113.0/255.0, green: 113.0/255.0, blue: 113.0/255.0))
        .padding(16.0)
        .overlay {
            Circle()
                .stroke(Color(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0), lineWidth: 7.0)
        }
    }
}

//#Preview {
//    MealPeriodStatusView()
//}
