//
//  FavoritesContent.swift
//  MyTestView
//
//  Created by MsMacM on 2026/07/31.
//

import SwiftUI

struct FavoritesContent: View {
    let favoritesUIState: FavoritesUIState

    var body: some View {
        VStack {
            if favoritesUIState.isEmpty {
                VStack {
                    Image(systemName: "heart.slash")
                        .font(.largeTitle)
                        .foregroundStyle(.gray)
                    Text("お気に入りがありません")
                        .foregroundStyle(.gray)
                        .padding(.top, 8)
                    Text("検索画面でリポジトリをお気に入りに追加してみましょう")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .padding(.top, 4)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List(favoritesUIState.favoriteRepositories) { trendItemModel in
                    TrendItemView(trendItemModel: trendItemModel)}
            }
        }
    }
}


#Preview("お気に入りなし") {
    FavoritesContent(favoritesUIState: FavoritesUIState())
}

#Preview("お気に入りあり") {
    FavoritesContent(favoritesUIState: FavoritesUIState(
        favoriteRepositories: [
            TrendItemModel(
                name: "apple/swift",
                description: "The Swift programming language",
                language: "Swift",
                stars: 5,
                url: "https://github.com/apple/swift"
            )
        ]
    ))
}
