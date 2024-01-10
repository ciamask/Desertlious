//
//  DesertliousListView.swift
//  Desertlious
//
//  Created by Shreeya Maskey on 1/4/24.
//

import SwiftUI

struct DessertliousListView: View {
    
    @StateObject var viewModel = DessertliousListViewModel()
    @State private var isShowingDetail = false
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.dessertsList, id: \.idMeal) { value in
                    DessertsListCell(value: value)
                        .onTapGesture {
                            viewModel.getDessertsDetail(mealID: value.idMeal)
                            isShowingDetail = true
                        }
                }.listStyle(.grouped)
                .navigationTitle("Desserts")
                .disabled(isShowingDetail)
            }.onAppear {
                viewModel.getDesserts()
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            
            if isShowingDetail {
                DessertsDetailsView(value: viewModel.dessertsDetail.first ?? MockData.sampleData,
                                    isShowingDetail: $isShowingDetail)
            }
            
            if viewModel.isLoading {
                ProgressView("Downloading…")
            }
            
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
            
        }
    }

}

#Preview {
    DessertliousListView()
}
