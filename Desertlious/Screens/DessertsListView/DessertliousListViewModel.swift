//
//  DessertliousViewModel.swift
//  Desertlious
//
//  Created by Shreeya Maskey on 1/5/24.
//

import SwiftUI

class DessertliousListViewModel: ObservableObject {
    @Published var dessertsList = [MealModel]()
    @Published var dessertsDetail = [DessertModel]()
    @Published var alertItem: AlertItems?
    @Published var isLoading = false
    var mealID = ""
    
    func getDesserts() {
        isLoading = true
        NetworkManager.shared.getAppetizers { results in
            DispatchQueue.main.async {
                self.isLoading = false
                switch results {
                case .success(let desserts):
                    self.dessertsList = desserts.sorted { $0.strMeal < $1.strMeal }
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
    
    func getDessertsDetail(mealID: String) {
        isLoading = true
        NetworkManager.shared.getAppetizersDetail(mealID: mealID) { results in
            DispatchQueue.main.async {
                self.isLoading = false
                switch results {
                case .success(let desserts):
                    self.dessertsDetail = desserts
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
    
    
    
}
