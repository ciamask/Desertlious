//
//  Dessert.swift
//  Desertlious
//
//  Created by Shreeya Maskey on 1/4/24.
//

import SwiftUI

struct DessertModel: Decodable, Identifiable {
    var id: String { idMeal }
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String
    let ingredients: [String?]
    let measurements: [String?]
}

extension DessertModel {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        idMeal = try container.decode(String.self, forKey: .idMeal)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        strMealThumb = try container.decode(String.self, forKey: .strMealThumb)

        // Initialize the arrays
        var ingredients = [String?]()
        var measurements = [String?]()

        // Decode each possible ingredient and measurement, up to 20
        for i in 1...20 {
            let ingredientKey = CodingKeys(rawValue: "strIngredient\(i)")
            let measurementKey = CodingKeys(rawValue: "strMeasure\(i)")

            if let ingredientKey = ingredientKey,
               let ingredient = try container.decodeIfPresent(String.self, forKey: ingredientKey),
               !ingredient.isEmpty {
                ingredients.append(ingredient)
            } else {
                ingredients.append(nil)
            }

            if let measurementKey = measurementKey,
               let measurement = try container.decodeIfPresent(String.self, forKey: measurementKey),
               !measurement.isEmpty {
                measurements.append(measurement)
            } else {
                measurements.append(nil)
            }
        }

        self.ingredients = ingredients
        self.measurements = measurements
    }
    
    private enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strInstructions, strMealThumb
        case strIngredient1, strIngredient2, strIngredient3 ,strIngredient4,strIngredient5,strIngredient6,strIngredient7,strIngredient8,strIngredient9,strIngredient10,
             strIngredient11,strIngredient12,strIngredient13,strIngredient14,strIngredient15,strIngredient16,strIngredient17,strIngredient18,strIngredient19,strIngredient20
        
        case strMeasure1, strMeasure2, strMeasure3,strMeasure4,strMeasure5,strMeasure6,strMeasure7,strMeasure8,strMeasure9,strMeasure10,
             strMeasure11,strMeasure12,strMeasure13,strMeasure14,strMeasure15,strMeasure16,strMeasure17,strMeasure18,strMeasure19,strMeasure20
    }
}

extension DessertModel {
    static let mockData = DessertModel(
        idMeal: "XXXX",
        strMeal: "Desserts ",
        strInstructions: "Instructions are Loading",
        strMealThumb: "https://cdn.dribbble.com/users/1012566/screenshots/4187820/media/3cb974c28eb00627cc0671685c79ffd9.jpg",
        ingredients: [
            "Ingredients1", "Ingredients2", "Ingredients3", "Ingredients4",
            "Ingredients5", "Ingredients6", "Ingredients7", "Ingredients8", "Ingredients9"
        ],
        measurements: [
            "Measurements1", "Measurements2", "Measurements3", "Measurements4",
            "Measurements5", "Measurements6", "Measurements7", "Measurements8", "Measurements9"
        ]
    )
}

struct Desserts: Decodable {
    let meals: [DessertModel]
}
