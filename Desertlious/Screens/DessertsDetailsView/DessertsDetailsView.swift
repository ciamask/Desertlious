//
//  DessertsDetailsView.swift
//  Desertlious
//
//  Created by Shreeya Maskey on 1/5/24.
//

import SwiftUI

struct DessertsDetailsView: View {
    
    let meal: MealModel
    let columns: [GridItem] = [GridItem(.flexible())]
    @StateObject var viewModel = DessertsDetailsViewModel()
    
    var body: some View {
        VStack{
            ScrollView {
                VStack(spacing: 12) {
                    AsyncImage(url: URL(string: viewModel.dessertsDetail.strMealThumb), scale: 2)
                        .aspectRatio(contentMode: .fit)
                    Text("Ingredients: ")
                        .font(.title2)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    LazyVGrid(columns: columns) {
                        ForEach(Array(zip(viewModel.dessertsDetail.ingredients.indices, viewModel.dessertsDetail.ingredients)), id: \.0) {index, ingredient in
                            if let ingredient = ingredient, !ingredient.isEmpty {
                                HStack {
                                    Text(ingredient)
                                    Text("-")
                                    Text(viewModel.dessertsDetail.measurements[index] ?? "")
                                    Spacer()
                            }
                            }
                        }
                    }
                    .padding()
                    .background(.secondary.opacity(0.2))
                    .cornerRadius(8)
                    Text("Description")
                        .font(.title2)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(viewModel.dessertsDetail.strInstructions)
                        .padding()
                        .background(.secondary.opacity(0.2))
                        .cornerRadius(8)
                }
                .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
                .onAppear {
                    viewModel.getDessertsDetail(mealID: meal.idMeal)
                }
            }
        }.navigationTitle(meal.strMeal)
        if viewModel.isLoading {
            ProgressView("Downloading…")
        }
    }
    
    
}


