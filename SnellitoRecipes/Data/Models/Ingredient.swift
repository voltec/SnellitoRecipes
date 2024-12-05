//
//  Ingredient.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import Foundation

enum IngredientUnit: String {
    case tablespoon = "Tablespoon"
    case teaspoon = "Teaspoon"
    case cup = "Cup"
    case ounce = "Ounce"
    case pinch = "Pinch"
    case none = ""

    var abbreviation: String {
        switch self {
        case .tablespoon: "Tblsp"
        case .teaspoon: "Tsp"
        case .cup: "Cups"
        case .ounce: "oz"
        case .pinch: "Pinch"
        case .none: ""
        }
    }
}

struct Ingredient: Identifiable, Equatable {
    var id: UUID = .init()
    let name: String
    let amount: Double
    let unit: IngredientUnit

    var amountString: String {
        if unit.abbreviation.isEmpty {
            String(format: "%.2g", amount)
        } else {
            String(format: "%.2g", amount) + " " + unit.abbreviation
        }
    }
}
