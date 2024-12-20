//
//  DietStreakView.swift
//  SwiftUI Diet Plan
//
//  Created by Prashant Kumar Soni on 19/12/24.
//

import SwiftUI

struct DietStreakView: View {
    private let dayPeriods = ["Morning", "Afternoon", "Evening", "Night"]
    private let dayPeriodsIcons = [AppImageProvider.morningIcon, AppImageProvider.afternoonIcon, AppImageProvider.eveningIcon, AppImageProvider.nightIcon]
    
    var body: some View {
        VStack {
            HStack {
                topView()
            }
            Spacer()
                .frame(height: 8.0)
            allPeriodView()
        }
        .frame(maxWidth: .infinity)
        .padding(EdgeInsets(top: 12.0, leading: 11.0, bottom: 22.0, trailing: 5.0))
        .background(Color(red: 246.0/255.0, green: 251.0/255.0, blue: 233.0/255.0))
        .cornerRadius(12.0)
        .overlay {
            RoundedRectangle(cornerRadius: 12.0)
                .stroke(Color(red: 229.0/255.0, green: 245.0/255.0, blue: 189.0/255.0), lineWidth: 1.0)
        }
    }
    
    private func topView() -> some View {
        HStack{
            Text("Diet Streak")
                .bold()
            Spacer()
            streakView()
        }
    }
    
    private func streakView() -> some View {
        HStack(spacing: 4.0) {
            AppImageProvider.streakIcon
            Text("1 Streak")
                .bold()
                .foregroundColor(Color(red: 113.0/255.0, green: 113.0/255.0, blue: 113.0/255.0))
        }
        .padding(.horizontal, 8.0)
        .padding(.vertical, 2.0)
        .overlay {
            RoundedRectangle(cornerRadius: 20.0)
                .stroke(Color(red: 76.0/255.0, green: 88.0/255.0, blue: 217.0/255.0), lineWidth: 1.0)
        }
    }
    
    private func allPeriodView() -> some View {
        HStack{
            ForEach(dayPeriods.indices, id: \.self) { index in
                periodView(dayPeriods[index], dayPeriodsIcons[index])
                if index < dayPeriods.count-1{
                    Spacer()
                }
            }
        }
    }
    
    private func periodView(_ dayName: String, _ icon: Image) -> some View {
        VStack(spacing: 4.0){
            Text(dayName)
            icon
        }
    }
}

#Preview {
    DietStreakView()
}
