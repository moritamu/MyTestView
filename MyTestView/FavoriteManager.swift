//
//  FavoriteManager.swift
//  MyTestView
//
//  Created by MsMacM on 2026/07/31.
//

import Foundation

@Observable
class FavoriteManager {
    static let shared = FavoriteManager()

    private let userDefaults = UserDefaults.standard
    private let favoritesKey = "favoriteRepositories"

    var favoriteRepositories: [TrendItemModel] = []

    private init() {
        loadFavorites()
    }
    //    UserDefaultsからお気に入りリストを読み込む
    private func loadFavorites() {
        guard let data = userDefaults.data(forKey: favoritesKey) else {
            favoriteRepositories = []
            return }
        do {
            let favorites = try JSONDecoder().decode([FavoriteRepositoryModel].self, from: data)
            favoriteRepositories = favorites.map { $0.toTrendItemModel()}
        } catch {
            favoriteRepositories = []
        }
    }//loadFavorites
    //UserDefaultsにお気に入りリストを保存する
    private func saveFavorites() {
        let favorites = favoriteRepositories.map { FavoriteRepositoryModel(from: $0) }
        if let data = try? JSONEncoder().encode(favorites) {
            userDefaults.set(data, forKey: favoritesKey)
        }//if
    }//saveFavotites
    //リポジトリをお気に入りに追加
    func addToFavorites(_ repository: TrendItemModel) {
        if !favoriteRepositories.contains(where: { $0.url == repository.url }) {
            favoriteRepositories.append(repository)
            saveFavorites()
        }//if
    }//addToFavorites
    //リポジトリをお気に入りから削除
    func removeFromFavorites(_ repository: TrendItemModel) {
        favoriteRepositories.removeAll(where: { $0.url == repository.url })
        saveFavorites()
    }//removeFromFavorites
    //リポジトリがお気に入りに登録されているかチェック
    func isFavorite(_ repository: TrendItemModel) -> Bool {
        favoriteRepositories.contains(where: { $0.url == repository.url })
    }//isFavorites
    //UserDefaultsに保存するためのCodable対応構造体
    private struct FavoriteRepositoryModel: Codable {
        let name: String
        let description: String
        let language: String
        let stars: Int
        let url: String

        init (from trendItem: TrendItemModel) {
            name = trendItem.name
            description = trendItem.description
            language = trendItem.language
            stars = trendItem.stars
            url = trendItem.url
        }//init
        func toTrendItemModel() -> TrendItemModel {
            TrendItemModel(
                name: name,
                description: description,
                language: language,
                stars: stars,
                url: url)
        }//toTrendItemModel
    }//FavoriteRepositoryModel
}//class
