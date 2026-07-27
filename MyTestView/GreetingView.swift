//
//  GreetingView.swift
//  MyTestView
//
//  Created by MsMacM on 2026/07/25.
//

import SwiftUI

struct GreetingView: View {
    let name: String
    var body: some View {
        Text("Hellow, \(name)!")
    }
}

#Preview ("挨拶"){
    GreetingView(name: "iOS")
}
