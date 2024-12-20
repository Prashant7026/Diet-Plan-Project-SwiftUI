//
//  DietPlanModel.swift
//  SwiftUI Diet Plan
//
//  Created by Prashant Kumar Soni on 20/12/24.
//

import Foundation

struct DietPlanModel: Codable {
    let status, message: String
    let data: DataClass
}

struct DataClass: Codable{
    let diets: Diets
}

struct Diets: Codable {
    let dietStreak: [DietStreak]
    let allDiets: [AllDiet]
}

enum DietStreak: String, Codable {
    case completed = "COMPLETED"
    case current = "CURRENT"
    case upcoming = "UPCOMING"
}

struct AllDiet: Codable {
    let daytime: Daytime
    let timings: String
    let progressStatus: ProgressStatus
    let recipes: [Recipe]
}

enum Daytime: String, Codable {
    case morningMeals = "Morning Meals"
    case afternoonMeals = "Afternoon Meals"
    case eveningMeals = "Evening Meals"
    case nightMeals = "Night Meals"
}

struct ProgressStatus: Codable {
    let total, completed: Int
}

struct Recipe: Codable {
    let id: Int
    let title, timeSlot: String
    let duration: Int
    let image: String
    let isFavorite, isCompleted: Int
}
