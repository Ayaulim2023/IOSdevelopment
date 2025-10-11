//
//  ContentView.swift
//  ShoppingCartAssignment
//
//  Created by Аяулым Куат on 01.10.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("🛒 Shopping Cart Assignment")
                .font(.title)
                .bold()
            Text("All logic is tested in ShoppingCartAssignmentTests.swift")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
