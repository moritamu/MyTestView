//
//  ContentView.swift
//  MyTestView
//
//  Created by MsMacM on 2026/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            GreetingView(name: "mumumu")
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
