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
        //        List(mainUIState.trendItemModelList) { trendItemModel in
        //            TrendItemView(trendItemModel: trendItemModel)
        //        }
        VStack {
            if mainUIState.isLoading {
                VStack {
                    ProgressView()
                        .scaleEffect(1.5)
                    Text("検索中...")
                        .padding(.top, 8)
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if !mainUIState.hasSearched {
                VStack {
                    Image(systemName: "magnifyingglass")
                        .font(.largeTitle)
                        .foregroundStyle(.gray)
                    Text("リポジトリを検索してみましょう")
                        .foregroundStyle(.gray)
                        .padding(.top, 8)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let errorMessage = mainUIState.errorMessage {
                VStack {
                    Image(systemName: "exclamationmark.triangle")
                        .font(.largeTitle)
                        .foregroundStyle(.orange)
                    Text(errorMessage)
                        .foregroundStyle(.red)
                    ,multilineTextAlignment(.center)
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if mainUIState.trendItemModelList.isEmpty {
                VStack {
                    Image(systemName: "magnifyingglass")
                        .font(.largeTitle)
                        .foregroundStyle(Color.gray)
                    Text("検索結果が見つかりませんでした")
                        .foregroundStyle(.gray)
                        .padding(.top, 8)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List(mainUIState.trendItemModelList) { trendItemModel in
                    TrendItemView(trendItemModel: trendItemModel)
                }
            }
        }
    }
}


//#Preview {//コメントアウトしなくても動く
//    MainContent(mainUIState: MainUIState())//ダミーデータを作成している
//}
