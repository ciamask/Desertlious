//
//  DesertliousListView.swift
//  Desertlious
//
//  Created by Shreeya Maskey on 1/4/24.
//

import SwiftUI

struct DessertliousListView: View {
    
    @StateObject var viewModel = DessertliousListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.dessertsList, id: \.idMeal) { value in
                    ZStack {
                        DessertsListCell(value: value)
                        NavigationLink (destination:DessertsDetailsView(meal: value)){EmptyView()}.buttonStyle(PlainButtonStyle())
                    }
                }.listStyle(.grouped)
                    .navigationTitle("Desserts")
            }.onAppear {
                viewModel.getDesserts()
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
