//
//  MainViewModel.swift
//  MyTestView
//
//  Created by MsMacM on 2026/07/27.
//

import SwiftUI

struct MainUIState {
    var trendItemModelList: [TrendItemModel] = []
    var isLoading: Bool = false
    var errorMessage: String? = nil
    var hasSearched: Bool = false
}
@Observable
class MainViewModel {
    var uiState = MainUIState()
    private let urlSessionClient = URLSessionClient()

    //検索状態をリセットする
    func clearSearch() {
        uiState.trendItemModelList = []
        uiState.errorMessage = nil
        uiState.hasSearched = false
    }
    //GitHubAPIを使ってリポジトリを検索する関数
    @MainActor
    func searchRepositories(query: String) async {
        guard !query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            uiState.errorMessage = "検索キーワードを入力してください"
            return
        }

        uiState.isLoading = true
        uiState.errorMessage = nil
        uiState.hasSearched = true

        do {
            let response = try await urlSessionClient.searchRepositories(query: query)
            //GitHubRepositoryItemをTrendItemModelに変換
            let trendItems = response.items.map{
                TrendItemModel(from: $0)
            }
            uiState.trendItemModelList = trendItems
            uiState.isLoading = false
            if trendItems.isEmpty {
                uiState.errorMessage = "該当するリポジトリはありませんでした"
            }
        } catch {
            uiState.isLoading = false
            uiState.errorMessage = "データの取得に失敗しました：\(error.localizedDescription)"
            uiState.trendItemModelList = []
        }
    }
//    実際にリポジトリの情報を取得するための関数
//    func load() {
//        uiState.trendItemModelList = createTrendList()
//    }
////    仮想的にリスト要素を作成する関数
//    private func createTrendList() -> [TrendItemModel] {
//        return [
//            TrendItemModel(
//                name: "Sample Repository Name1",
//                description: "Sample Repository Description",
//                language: "Swift",
//                stars: 4,
//                url: "https://example.com"
//            ),
//            TrendItemModel(
//                name: "Sample Repository Name2",
//                description: "Sample Repository Description",
//                language: "Objective-C",
//                stars: 2,
//                url: "https://example.com"
//            )
//        ]
//    }

}//class
