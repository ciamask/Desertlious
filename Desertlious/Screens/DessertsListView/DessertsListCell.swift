//
//  DessertsListCell.swift
//  Desertlious
//
//  Created by Shreeya Maskey on 1/4/24.
//

import SwiftUI

struct DessertsListCell: View {
    let value: MealModel
    var body: some View {
        Text(value.strMeal)
            .foregroundColor(.white)
            .font(.system(size: 22))
            .fontWeight(.semibold)
            .padding(8)
            .background(.secondary.opacity(0.8))
            .cornerRadius(4)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 60)
            .background(AsyncImage(url: URL(string: value.strMealThumb )))
            .cornerRadius(12)
    }
}


