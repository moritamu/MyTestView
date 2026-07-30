//
//  MainScreen.swift
//  MyTestView
//
//  Created by MsMacM on 2026/07/25.
//

import SwiftUI

struct MainScreen: View {
    @State private var viewModel = MainViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            VStack {
                MainContent(mainUIState: viewModel.uiState)
            }
            .navigationTitle("リポジトリ検索")
            .searchable(text: $searchText, prompt: "リポジトリを検索")
            .onSubmit(of: .search) {
                if !searchText.isEmpty {
                    Task {
                        await viewModel.searchRepositories(query: searchText)
                    }
                }
            }
            .onChange(of: searchText) { oldValue, newValue in
                if newValue.isEmpty && viewModel.uiState.hasSearched{
                    viewModel.clearSearch()
                }
            }
        }
    }
}

#Preview {
    MainScreen()
}
