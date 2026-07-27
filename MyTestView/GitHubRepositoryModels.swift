//
//  GitHubRepositoryModels.swift
//  MyTestView
//
//  Created by MsMacM on 2026/07/27.
//

import Foundation
struct GitHubRepositorySearchResonse: Decodable {
    let totalCount: Int
    let inCompleteResults: Bool
    let items: [GitHubRepositoryItem]
}

struct GitHubRepositoryItem: Decodable {//これはTrendItemModelへ変換する
    let id: Int
    let name: String
    let fullName: String
    let htmlUrl: String
    let description: String?
    let stargazersCount: Int
    let language: String?
    let owner: GitHubRepositoryOwner
}

struct GitHubRepositoryOwner: Decodable {
    let login: String
    let id: Int
    let avatarUrl: String
}
