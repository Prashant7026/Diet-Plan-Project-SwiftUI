//
//  MealPeriodStatusView.swift
//  SwiftUI Diet Plan
//
//  Created by Prashant Kumar Soni on 20/12/24.
//

import SwiftUI

struct MealPeriodStatusView: View {
    var mealDayTime: Daytime
    var mealTiming: String
    var progressStatus: ProgressStatus
    
    var body: some View {
        HStack {
            mealPeriod()
            Spacer()
            statusView(selected: progressStatus.completed, total: progressStatus.total)
        }
    }
    
    private func mealPeriod() -> some View {
        VStack(alignment: .leading, spacing: 2.0) {
            Group{
                switch mealDayTime {
                case .morningMeals:
                    Text(StringConstants.sharedInstance.morningMealsText)
                case .afternoonMeals:
                    Text(StringConstants.sharedInstance.afternoonMealsText)
                case .eveningMeals:
                    Text(StringConstants.sharedInstance.eveningMealsText)
                case .nightMeals:
                    Text(StringConstants.sharedInstance.nightMealsText)
                }
            }
            .bold()
            Text(mealTiming)
                .foregroundColor(Color(red: 113.0/255.0, green: 113.0/255.0, blue: 113.0/255.0))
        }
    }
    
    private func statusView(selected: Int, total: Int) -> some View {
        let progress = Double(selected) / Double(total)
        
        return ZStack {
            Circle()
                .stroke(
                    Color(red: 230.0 / 255.0, green: 230.0 / 255.0, blue: 230.0 / 255.0),
                    lineWidth: 7.0
                )
            
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(
                    Color(red: 239.0 / 255.0, green: 83.0 / 255.0, blue: 80.0 / 255.0),
                    style: StrokeStyle(lineWidth: 7.0, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
            
            VStack(alignment: .center, spacing: 4) {
                Text(StringConstants.sharedInstance.statusText)
                    .font(.caption2)
                    .foregroundColor(Color(red: 113.0 / 255.0, green: 113.0 / 255.0, blue: 113.0 / 255.0))
                
                Text("\(selected) of \(total)")
                    .font(.caption)
                    .bold()
                    .foregroundColor(Color(red: 113.0 / 255.0, green: 113.0 / 255.0, blue: 113.0 / 255.0))
            }
        }
        .frame(width: 64, height: 64)
    }
}

//#Preview {
//    MealPeriodStatusView(mealDayTime: Daytime.morningMeals, progressStatus: ProgressStatus(total: 3, completed: 1))
//}
