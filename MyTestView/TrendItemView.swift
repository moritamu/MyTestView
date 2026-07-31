//
//  TrendItemView.swift
//  MyTestView
//
//  Created by MsMacM on 2026/07/25.
//

import SwiftUI

struct TrendItemView: View {
    let trendItemModel: TrendItemModel
    @State private var favoriteManager = FavoriteManager.shared
    @State private var showToast = false
    @State private var toastMessage = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(trendItemModel.name)
                    .font(.headline)
                Spacer()
                Button(action: toggleFavorite) {
                    Image(systemName: favoriteManager.isFavorite(trendItemModel) ? "heart.fill" : "heart")
                        .foregroundStyle(favoriteManager.isFavorite(trendItemModel) ? .red : .gray)
                        .font(.title2)
                }//Button
                .buttonStyle(PlainButtonStyle())//()がついてなかったエラー
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
                        .foregroundStyle(.orange)
                }//HStack language
                Button(action: {
                    if let url = URL(string: trendItemModel.url) {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Text(trendItemModel.url)
                        .font(.footnote)
                        .foregroundStyle(.blue)
                        .underline()
                }
                .buttonStyle(PlainButtonStyle())
            }//HStack
            .padding()
            .overlay(toastOverlay, alignment: .top)
        }//VStack
    }//View
    private func toggleFavorite() {
        if favoriteManager.isFavorite(trendItemModel) {
            favoriteManager.removeFromFavorites(trendItemModel)
            toastMessage = "お気に入りから削除しました"
        } else {
            favoriteManager.addToFavorites(trendItemModel)
            toastMessage = "お気に入りに追加しました"
        }
        showToast = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showToast = false
        }
    }//toggleFavorite
    private var toastOverlay: some View {
        VStack {
            if showToast {
                Text(toastMessage)
                    .font(.caption)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.gray.opacity(0.8))
                    .foregroundStyle(.white)
                    .cornerRadius(8)
                    .transition(.opacity)
            }//if
            Spacer()
        }
        .animation(.easeInOut(duration: 0.3), value: showToast)
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
