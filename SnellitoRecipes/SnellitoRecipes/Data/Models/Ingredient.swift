//
//  Ingredient.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import Foundation

struct Ingredient: Identifiable {
    let id = UUID()
    let name: String
    let amount: Double
    let unit: String
}
