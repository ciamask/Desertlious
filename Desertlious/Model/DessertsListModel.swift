//
//  DessertsListModel.swift
//  Desertlious
//
//  Created by Shreeya Maskey on 1/11/24.
//

import Foundation

struct DessertsListModel: Decodable {
    let meals: [MealModel]
}

struct MealModel: Decodable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
