//
//  MainScreen.swift
//  MyTestView
//
//  Created by MsMacM on 2026/07/25.
//

import SwiftUI

struct MainScreen: View {
    @State private var viewModel = MainViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                MainContent(mainUIState: viewModel.uiState)
            }
            .navigationTitle("Repositories")
            .onAppear {
                viewModel.load()
            }
        }
    }
}

#Preview {
    MainScreen()
}
