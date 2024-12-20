//
//  AppNetworking.swift
//  SwiftUI Diet Plan
//
//  Created by Prashant Kumar Soni on 20/12/24.
//

import Foundation

final class AppNetworking {
    public static let sharedInstance = AppNetworking()
    
    private init() {}
    
    func apiCall(_ urlString: String) async throws -> DietPlanModel {
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL string."])
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            return try JSONDecoder().decode(DietPlanModel.self, from: data)
        } catch {
            throw NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "Failed to decode data."])
        }
    }
}
