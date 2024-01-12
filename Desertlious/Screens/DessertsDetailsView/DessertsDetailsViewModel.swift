//
//  DessertsDetailsViewModel.swift
//  Desertlious
//
//  Created by Shreeya Maskey on 1/10/24.
//

import SwiftUI

class DessertsDetailsViewModel: ObservableObject {
    
    @Published var dessertsDetail: DessertModel = DessertModel.mockData
    @Published var alertItem: AlertItems?
    @Published var isLoading = true
    @State var ingredientsList = [EnumeratedSequence<[String?]>.Element]()

    func getDessertsDetail(mealID: String) {
        
        NetworkManager.shared.getAppetizersDetail(mealID: mealID) { results in
            DispatchQueue.main.async {
                self.isLoading = false
                switch results {
                case .success(let desserts):
                    if let dessert = desserts.first {
                        self.dessertsDetail = dessert
                    }
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
