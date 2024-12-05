//
//  Recipe.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import Foundation

struct Recipe: Identifiable {
    let id: UUID
    let name: String
    let imageURLs: [URL]
    let cuisine: String
    let allergens: [String]
    let webLink: URL
    let description: String
    let cookingTime: Int
    let preparationTime: Int
    let flavors: [String]
    let proteins: Int
    let nutrition: String
    let servings: Int
    let sourceName: String
    let ingredients: [Ingredient]
    let instructions: [Instruction]
}
