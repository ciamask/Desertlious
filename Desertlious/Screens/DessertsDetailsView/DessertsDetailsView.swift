//
//  DessertsDetailsView.swift
//  Desertlious
//
//  Created by Shreeya Maskey on 1/5/24.
//

import SwiftUI

struct DessertsDetailsView: View {
    
    let value: Dessert
    @State var ingredientsList = [EnumeratedSequence<[String?]>.Element]()
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button {
                    isShowingDetail = false
                } label: {
                    Image(systemName: "multiply")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .padding()
                }
            }
            ScrollView {
                VStack(spacing: 12) {
                    Text(value.strMeal ?? "")
                        .font(.title)
                        .fontWeight(.medium)
                    AsyncImage(url: URL(string: value.strMealThumb ?? ""), scale: 2)
                        .aspectRatio(contentMode: .fit)
                    Text("Ingredients: ")
                        .font(.title2)
                        .fontWeight(.medium)
                    LazyVGrid(columns: columns) {
                        ForEach(ingredientsList, id: \.offset) { value in
                            Text(value.element ?? "")
                        }
                    }
                    Text("Description")
                        .font(.title2)
                        .fontWeight(.medium)
                    Text(value.strInstructions ?? "")
                        .foregroundStyle(.secondary)
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
                .onAppear {
                    createEnumuratedValues()
                }
            }
        }.background(.white)
    }
    
    func createEnumuratedValues() {
        let x = [value.strIngredient1,  value.strMeasure1,
                 value.strIngredient2,  value.strMeasure2,
                 value.strIngredient3,  value.strMeasure3,
                 value.strIngredient4,  value.strMeasure4,
                 value.strIngredient5,  value.strMeasure5,
                 value.strIngredient6,  value.strMeasure6,
                 value.strIngredient7,  value.strMeasure7,
                 value.strIngredient8,  value.strMeasure8,
                 value.strIngredient9,  value.strMeasure9,
                 value.strIngredient10, value.strMeasure10,
                 value.strIngredient11, value.strMeasure11,
                 value.strIngredient12, value.strMeasure12,
                 value.strIngredient13, value.strMeasure13,
                 value.strIngredient14, value.strMeasure14,
                 value.strIngredient15, value.strMeasure15,
                 value.strIngredient16, value.strMeasure16,
                 value.strIngredient17, value.strMeasure17,
                 value.strIngredient18, value.strMeasure18,
                 value.strIngredient19, value.strMeasure19,
                 value.strIngredient20, value.strMeasure20]
        let p = x.filter{ ($0 ?? "") != " " && !($0 ?? "").isEmpty }
        let xp = Array(p.enumerated())
        self.ingredientsList = xp
    }
}
