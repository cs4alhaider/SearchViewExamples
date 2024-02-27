//
//  ContentView.swift
//  SearchViewExamples
//
//  Created by Abdullah Alhaider on 26/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FruitsExample()
                .tabItem {
                    Label("Fruits", systemImage: "applelogo")
                }
            
            CountryExample()
                .tabItem {
                    Label("Countries", systemImage: "map")
                }
        }
    }
}

#Preview {
    ContentView()
}
