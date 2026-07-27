//
//  MainContent.swift
//  MyTestView
//
//  Created by MsMacM on 2026/07/27.
//

import SwiftUI

struct MainContent: View {
    let mainUIState: MainUIState

    var body: some View {
        List(mainUIState.trendItemModelList) { trendItemModel in
            TrendItemView(trendItemModel: trendItemModel)
        }
    }
}

//#Preview {
//    MainContent(mainUIState: MainUIState())
//}
