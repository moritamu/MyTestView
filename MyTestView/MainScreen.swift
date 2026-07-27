//
//  MainScreen.swift
//  MyTestView
//
//  Created by MsMacM on 2026/07/25.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        NavigationStack {
            MainContent()
            .navigationTitle("Repositories")
        }
    }
}

#Preview {
    MainScreen()
}
