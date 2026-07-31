//
//  FavoritesViewModel.swift
//  MyTestView
//
//  Created by MsMacM on 2026/07/30.
//

import SwiftUI

struct FavoritesUIState {
    var favoriteRepositories: [TrendItemModel] = []
    var isEmpty: Bool {
        return favoriteRepositories.isEmpty
    }
}

@Observable
class FavoritesViewModel {
    var uiState = FavoritesUIState()
    private let favoriteManager = FavoriteManager.shared

    init() {
        loadFavorites()
    }

    //お気に入りリストを読み込む
    func loadFavorites() {
        uiState.favoriteRepositories = favoriteManager.favoriteRepositories
    }

    //画面が表示される際に最新のお気に入りリストを取得
    func onAppear() {
        loadFavorites()
    }

    //リポジトリをお気に入りから削除
    func removeFromFavorite(_ repository: TrendItemModel) {
        favoriteManager.removeFromFavorites(repository)
        loadFavorites()
    }

    //リポジトリがお気に入りに登録されているかチェック
    func isFavorite(_ repository: TrendItemModel) -> Bool {
        return favoriteManager.isFavorite(repository)
    }
}
