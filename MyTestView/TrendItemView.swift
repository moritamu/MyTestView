//
//  TrendItemView.swift
//  MyTestView
//
//  Created by MsMacM on 2026/07/25.
//

import SwiftUI

struct TrendItemView: View {
    let trendItemModel: TrendItemModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(trendItemModel.name)
                .font(.headline)
            Text(trendItemModel.description)
                .font(.subheadline)
                .foregroundStyle(.gray)
            HStack{
                Text(trendItemModel.language)
                    .font(.caption)
                    .foregroundStyle(.blue)
                Spacer()
                Text(String(repeating: "⭐️", count: trendItemModel.stars))
                    .font(.caption)
            }//HStack
            Text(trendItemModel.url)
                .font(.footnote)
                .foregroundStyle(.blue)
        }//VStack
        .padding()
    }
}

#Preview {
    TrendItemView(trendItemModel: TrendItemModel(
        name: "Sample Repository",
        description: "This is a sample repository description",
        language: "Swift",
        stars: 3,
        url: "https://github.com/examlple"
    ))
}
