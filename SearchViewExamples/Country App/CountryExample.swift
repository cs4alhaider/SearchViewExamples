//
//  CountryExample.swift
//  SearchViewExamples
//
//  Created by Abdullah Alhaider on 26/02/2024.
//

import SwiftUI
import SearchView

struct CountryExample: View {
    @State private var showSelectCountry = false
    @State private var selectedCountry = Country.currentCountry ?? Country.allCountrys[0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        CountryListCellView(country: selectedCountry)
                        Color.black.opacity(0.4)
                            .frame(width: 1)
                            .cornerRadius(0.5)
                            .padding(.horizontal, 5)
                            .padding(.vertical, 2)
                        Button("Change") { showSelectCountry.toggle() }
                    }
                    .sheet(isPresented: $showSelectCountry) {
                        SelectCountryView(
                            isPresented: $showSelectCountry,
                            selectedCountry: $selectedCountry
                        )
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .navigationBarTitle("Home")
        }
    }
}

struct SelectCountryView: View {
    @Binding var isPresented: Bool
    @Binding var selectedCountry: Country
    @State private var searchQuery = ""
    let allCountrys: [Country] = Country.allCountrys
    
    var body: some View {
        NavigationStack {
            SearchView(
                items: allCountrys,
                searchableProperties: [\.name, \.code, \.dialCode, \Country.flag],
                searchQuery: $searchQuery
            ) { country, searchTerm in
                CountryListCellView(country: country)
                    .onTapGesture {
                        updateWith(selected: country)
                }
            }
            .navigationTitle("Selecte Country")
        }
    }
    
    private func updateWith(selected country: Country) {
        // Saving country code for new app open -> better UX
        UserDefaults.setValue(country.code, forKey: .lastSelectedCountry)
        // Updating selectedCountry with new country
        selectedCountry = country
        // Dismissing the sheet
        isPresented.toggle()
    }
}

struct CountryListCellView: View {
    let country: Country
    
    var body: some View {
        HStack {
            Text(country.flag ?? "🤒")
                .font(.title)
            Text(country.name ?? "")
            Spacer()
            Text("📞 \(country.dialCode ?? "")")
                .font(.body)
        }
    }
}
