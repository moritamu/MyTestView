//
//  TrendItemModel.swift
//  MyTestView
//
//  Created by MsMacM on 2026/07/25.
//

import SwiftUI

struct TrendItemModel: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let language: String
    let stars: Int
    let url: String
}
