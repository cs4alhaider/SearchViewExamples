//
//  CountryExample.swift
//  SearchViewExamples
//
//  Created by Abdullah Alhaider on 26/02/2024.
//

import SwiftUI
import SearchView
import CountryKit

struct CountryExample: View {
    @State private var showSelectCountry = false
    @State private var selectedCountry = Country.currentCountry ?? Country.allCountries[0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        CountryRow(for: selectedCountry)
                        Color.black.opacity(0.4)
                            .frame(width: 1)
                            .cornerRadius(0.5)
                            .padding(.horizontal, 5)
                            .padding(.vertical, 2)
                        Button("Change") { showSelectCountry.toggle() }
                    }
                    .sheet(isPresented: $showSelectCountry) {
                        SelectCountry { newSelection in
                            selectedCountry = newSelection
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .navigationBarTitle("Home")
        }
    }
}

