//
//  FruitsExample.swift
//  SearchViewExamples
//
//  Created by Abdullah Alhaider on 26/02/2024.
//

import SwiftUI
import SearchView

// Define your data model
struct Fruit: Searchable {
    var id: UUID = UUID()
    var name: String
    var description: String
    
    var idStringValue: String {
        id.uuidString
    }
}

extension Fruit {
    public static var example: [Fruit] {
        [
            Fruit(name: "Apple", description: "Green and red."),
            Fruit(name: "Banana", description: "Long and yellow."),
            Fruit(name: "Cherry", description: "Small and red."),
            Fruit(name: "Date", description: "Sweet and brown."),
            Fruit(name: "Elderberry", description: "Dark and tart."),
            Fruit(name: "Fig", description: "Purple and sweet."),
            Fruit(name: "Grape", description: "Small and juicy."),
            Fruit(name: "Honeydew", description: "Light green and sweet."),
            Fruit(name: "Kiwi", description: "Brown skin with green inside."),
            Fruit(name: "Lemon", description: "Yellow and sour."),
            Fruit(name: "Mango", description: "Orange, sweet, and tropical."),
            Fruit(name: "Nectarine", description: "Smooth and sweet."),
            Fruit(name: "Orange", description: "Orange and juicy."),
            Fruit(name: "Papaya", description: "Large and tropical."),
            Fruit(name: "Quince", description: "Yellow and aromatic."),
            Fruit(name: "Raspberry", description: "Red and tart."),
            Fruit(name: "Strawberry", description: "Red, juicy, and sweet."),
            Fruit(name: "Tangerine", description: "Small and sweet."),
            Fruit(name: "Ugli fruit", description: "Tart and wrinkled."),
            Fruit(name: "Vanilla Bean", description: "Flavorful and fragrant."),
            Fruit(name: "Watermelon", description: "Large, green, and sweet."),
            Fruit(name: "Xigua", description: "Chinese watermelon."),
            Fruit(name: "Yellow Watermelon", description: "Yellow version of the classic."),
            Fruit(name: "Zucchini", description: "Green and versatile in cooking."),
            Fruit(name: "Avocado", description: "Green and creamy."),
            Fruit(name: "Blackberry", description: "Black and juicy."),
            Fruit(name: "Cantaloupe", description: "Orange, sweet, and netted skin."),
            Fruit(name: "Dragonfruit", description: "Pink and scaly."),
            Fruit(name: "Eggfruit", description: "Yellow and egg-shaped."),
            Fruit(name: "Feijoa", description: "Green and tart."),
            Fruit(name: "Guanabana", description: "Green and spiky."),
            Fruit(name: "Huckleberry", description: "Blue and tart."),
            Fruit(name: "Ilama", description: "Tropical and rare."),
            Fruit(name: "Jackfruit", description: "Large and fibrous."),
            Fruit(name: "Kumquat", description: "Small and orange.")
        ]
    }
}

struct FruitsExample: View {
    @State private var searchQuery = ""
    let fruits: [Fruit] = Fruit.example
    
    var body: some View {
        NavigationStack {
            SearchView(
                items: fruits,
                searchableProperties: [\.name, \.description],
                searchQuery: $searchQuery
            ) { fruit, searchTerm in
                VStack(alignment: .leading) {
                    Text(fruit.name)
                        .bold()
                        .foregroundColor(.blue)
                    Text(fruit.description)
                        .font(.subheadline)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Fruits")
        }
    }
}
