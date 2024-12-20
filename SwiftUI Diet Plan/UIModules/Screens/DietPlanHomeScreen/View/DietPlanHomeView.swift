//
//  DietPlanHomeView.swift
//  SwiftUI Diet Plan
//
//  Created by Prashant Kumar Soni on 19/12/24.
//

import SwiftUI

struct DietPlanHomeView: View {
    @State private var selectBtnClickedDayTime: Daytime?
    @State private var selectAllBtnClicked: [Daytime: Bool] = [:]
    @StateObject private var viewModel = DietPlanHomeViewModel()
    @State private var dietPlanData: DataClass?
    var isAnySelectAllClicked: Bool {
        selectAllBtnClicked.values.contains(true)
    }
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollView {
                    if let data = dietPlanData{
                        VStack {
                            Spacer()
                                .frame(height: 16.0)
                            HeaderView()
                            Spacer()
                                .frame(height: 18.0)
                            DietStreakView(dietPlanData?.diets.dietStreak)
                            Spacer()
                                .frame(height: 27.0)
                            SearchAndFilterView()
                            Spacer()
                                .frame(height: 24.0)
                            
                            dietsView()
                            
                            Spacer()
                            
                        }
                        .padding(.horizontal, 16.0)
                    } else {
                        ProgressView("Loading...")
                    }
                }
                
                if isAnySelectAllClicked{
                    FooterDoubleButtonView()
                        .padding(.horizontal, 18.0)
                        .padding(.top, 35.0)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {
                        print("Back Arrow Button Tapped!")
                    }) {
                        backArrowButton()
                    }
                }
            }
            .task {
                do {
                    try await viewModel.call()
                    self.dietPlanData = viewModel.apiData?.data
                } catch {
                    print("Failed to fetch data:", error.localizedDescription)
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
    
    private func dietsView() -> some View {
        Group{
            if let diets = dietPlanData?.diets.allDiets {
                ForEach(diets.indices, id: \.self) { index in
                    switch diets[index].daytime {
                    case .morningMeals:
                        recipesView(diets[index])
                        Divider()
                            .padding(.vertical, 23.0)
                    case .afternoonMeals:
                        recipesView(diets[index])
                        Divider()
                            .padding(.vertical, 23.0)
                    case .eveningMeals:
                        recipesView(diets[index])
                        Divider()
                            .padding(.vertical, 23.0)
                    case .nightMeals:
                        recipesView(diets[index])
                    }
                }
            } else {
                Text("No diets available")
            }
        }
    }
    
    private func recipesView(_ diet: AllDiet) -> some View {
        Group{
            mealView(diet.daytime)
            ForEach(diet.recipes.indices, id: \.self){ index in
                RecipesCellView(selectAllClicked: Binding(
                    get: { selectAllBtnClicked[diet.daytime] ?? false },
                    set: { selectAllBtnClicked[diet.daytime] = $0 }
                ), cellData: diet.recipes[index])
            }
        }
    }
    
    private func mealView(_ dayTime: Daytime) -> some View {
        Group{
            MealPeriodStatusView(mealDayTime: dayTime)
            
            selectAllButton(dayTime)
            Spacer()
                .frame(height: 11.0)
        }
    }
    
    private func selectAllButton(_ dayTime: Daytime) -> some View {
        Button {
            selectAllBtnClicked[dayTime] = !(selectAllBtnClicked[dayTime] ?? false)
        } label: {
            HStack(spacing: 9.0){
                if selectAllBtnClicked[dayTime] == true{
                    Image(systemName: "checkmark.square.fill")
                        .resizable()
                        .foregroundColor(Color(red: 76.0/255.0, green: 88.0/255.0, blue: 217.0/255.0))
                        .frame(width: 19.0, height: 19.0)
                } else {
                    RoundedRectangle(cornerRadius: 2.0)
                        .foregroundColor(Color.clear)
                        .overlay {
                            RoundedRectangle(cornerRadius: 2.0)
                                .stroke(Color.black, lineWidth: 1.0)
                        }
                        .frame(width: 19.0, height: 19.0)
                }
                Text("Select All")
                    .foregroundColor(Color.black)
                    .bold()
            }
        }
        .buttonStyle(.plain)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    DietPlanHomeView()
}
