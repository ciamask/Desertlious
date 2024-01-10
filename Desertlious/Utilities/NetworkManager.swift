//
//  NetworkManager.swift
//  Desertlious
//
//  Created by Shreeya Maskey on 1/4/24.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://themealdb.com/api/json/v1/1/"
    private let dessertsListURL = baseURL + "filter.php?c=Dessert"
    private let dessertsDetailURL = baseURL + "lookup.php?i="
    
    private init() {}
    
    func getAppetizers(completed: @escaping (Result<[Meal], DLError>) -> Void) {
        guard let url = URL(string: dessertsListURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(DessertsList.self, from: data)
                completed(.success(decodedResponse.meals))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
    func getAppetizersDetail(mealID: String, completed: @escaping (Result<[Dessert], DLError>) -> Void) {
        let dessertsDetailURL = dessertsDetailURL + mealID
        guard let url = URL(string: dessertsDetailURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(Desserts.self, from: data)
                completed(.success(decodedResponse.meals))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
}
