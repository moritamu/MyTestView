//
//  AppTabView.swift
//  MyTestView
//
//  Created by MsMacM on 2026/07/30.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView {
            MainScreen()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("検索")
                }
            FavoritesScreen()
                .tabItem {
                    Image(systemName: "heart")
                    Text("お気に入り")
                }
        }
    }
}

#Preview {
    AppTabView()
}
