//
//  MainViewModel.swift
//  MyTestView
//
//  Created by MsMacM on 2026/07/27.
//

import SwiftUI

struct MainUIState {
        var trendItemModelList: [TrendItemModel] = []
}
@Observable
class MainViewModel {
    var uiState = MainUIState()
//    実際にリポジトリの情報を取得するための関数
    func load() {
        uiState.trendItemModelList = createTrendList()
    }
//    仮想的にリスト要素を作成する関数
    private func createTrendList() -> [TrendItemModel] {
        return [
            TrendItemModel(
                name: "Sample Repository Name1",
                description: "Sample Repository Description",
                language: "Swift",
                stars: 4,
                url: "https://example.com"
            ),
            TrendItemModel(
                name: "Sample Repository Name2",
                description: "Sample Repository Description",
                language: "Objective-C",
                stars: 2,
                url: "https://example.com"
            )
        ]
    }

}
