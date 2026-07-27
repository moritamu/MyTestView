//
//  MainContent.swift
//  MyTestView
//
//  Created by MsMacM on 2026/07/27.
//

import SwiftUI

struct MainContent: View {
    let trendList: [TrendItemModel] = createTrendList()

    var body: some View {
        List(trendList) { trendItemModel in
            TrendItemView(trendItemModel: trendItemModel)
        }
    }
}
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

#Preview {
    MainContent()
}
