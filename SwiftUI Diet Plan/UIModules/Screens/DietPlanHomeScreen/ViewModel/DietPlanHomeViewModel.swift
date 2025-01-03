//
//  DietPlanHomeViewModel.swift
//  SwiftUI Diet Plan
//
//  Created by Prashant Kumar Soni on 20/12/24.
//

import Foundation

class DietPlanHomeViewModel: ObservableObject {
    @Published var apiData: DietPlanModel?
    
    func call() async throws {
        do {
            let fetchedData = try await AppNetworking.sharedInstance.apiCall(StringConstants.sharedInstance.apiEndPoint)
            DispatchQueue.main.async {
                self.apiData = fetchedData
            }
        } catch {
            print("Error ->", error.localizedDescription)
            throw error
        }
    }
}
