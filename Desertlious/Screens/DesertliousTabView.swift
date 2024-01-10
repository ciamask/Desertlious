//
//  ContentView.swift
//  Desertlious
//
//  Created by Shreeya Maskey on 1/4/24.
//

import SwiftUI

struct DesertliousTabView: View {
    var body: some View {
        TabView {
            DessertliousListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
        }.accentColor(.brandPrimary)
    }
}

#Preview {
    DesertliousTabView()
}
