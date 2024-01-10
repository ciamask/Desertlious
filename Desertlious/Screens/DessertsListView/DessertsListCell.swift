//
//  DessertsListCell.swift
//  Desertlious
//
//  Created by Shreeya Maskey on 1/4/24.
//

import SwiftUI

struct DessertsListCell: View {
    let value: Meal
    var body: some View {
        Text(value.strMeal)
            .foregroundColor(.white)
            .font(.system(size: 22))
            .fontWeight(.semibold)
            .padding(6)
            .background(.black)
            .cornerRadius(4)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 80)
            .background(AsyncImage(url: URL(string: value.strMealThumb )))
            .cornerRadius(12)
    }
}

#Preview {
    DessertsListCell(value: Meal(strMeal: "idk", strMealThumb: "https://www.youtube.com/watch?v=6R8ffRRJcrg", idMeal: "111"))
}

