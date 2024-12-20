//
//  StringConstants.swift
//  SwiftUI Diet Plan
//
//  Created by Prashant Kumar Soni on 20/12/24.
//

final class StringConstants {
    public static let sharedInstance = StringConstants()
    
    private init() {}
    
    let apiEndPoint = "https://uptodd.com/fetch-all-diets"
    let appTitle = "Everyday Diet Plan"
    let appSubTitle = "Track Ananya’s every meal"
    let showLoadingtext = "Loading..."
    let dayPeriodArray = ["Morning", "Afternoon", "Evening", "Night"]
    let groceryListText = "Grocery List"
    let morningMealsText = "Morning Meals"
    let afternoonMealsText = "Afternoon Meals"
    let eveningMealsText = "Evening Meals"
    let nightMealsText = "Night Meals"
    let selectAllText = "Select All"
    let dietStreakText = "Diet Streak"
    let searchBarPlaceholder = "Search Meals"
    let customizeText = "Customize"
    let fedText = "Fed"
    let cancelText = "Cancel"
    let statusText = "Status"
}
