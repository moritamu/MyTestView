//
//  FavoritesScreen.swift
//  MyTestView
//
//  Created by MsMacM on 2026/07/31.
//

import SwiftUI

/// お気に入り画面を構成するビュー
struct FavoritesScreen: View {
    @State private var viewModel = FavoritesViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                FavoritesContent(favoritesUIState: viewModel.uiState)
            }
            .navigationTitle("お気に入り")
            .onAppear {
                viewModel.onAppear()
            }
        }
    }
}

#Preview {
    FavoritesScreen()
}
