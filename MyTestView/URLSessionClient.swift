//
//  URLSessionClient.swift
//  MyTestView
//
//  Created by MsMacM on 2026/07/27.
//

import Foundation

class URLSessionClient {
    func searchRepositories(query: String) async throws -> GitHubRepositorySearchResonse {//awaitが使え、エラーを投げる
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        components.path = "/search/repositories"
        components.queryItems = [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "sort", value: "stars"),
            URLQueryItem(name: "order", value: "desc"),
            URLQueryItem(name: "per_page", value: "30")
        ]
        guard let url = components.url else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        let (data, response) = try await URLSession.shared.data(for: request)//返り値はタプル型で、それぞれに代入
        guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)//ここはいまいちわからない
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(GitHubRepositorySearchResonse.self, from: data)
    }
}
