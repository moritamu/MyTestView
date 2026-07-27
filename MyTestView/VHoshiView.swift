//
//  HoshiView.swift
//  MyTestView
//
//  Created by MsMacM on 2026/07/25.
//

import SwiftUI

struct VHoshiView: View {
    var body: some View {

        VStack {
            HStack {
                Text("koko")
                    .padding()
                ForEach(0..<4) {_ in
                    Image(systemName: "star.fill")
                }
                Text("ko")
                    .padding()
            }//HStack
            .padding()
            HStack {
                ForEach(0..<4){_ in
                    Text("⭐️")
                }
            }
        }
    }
}

#Preview {
    VHoshiView()
}
