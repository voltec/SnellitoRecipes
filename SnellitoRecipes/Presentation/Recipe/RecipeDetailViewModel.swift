//
//  RecipeDetailViewModel.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import Foundation

class RecipeDetailViewModel: ObservableObject {
    let recipe: Recipe
    @Published var servings: Int {
        didSet { updateServings(to: servings) }
    }

    @Published var scaledIngredients: [Ingredient]
    @Published var selectedIngredients: [Ingredient] = []

    init(recipe: Recipe) {
        self.recipe = recipe
        servings = recipe.servings
        scaledIngredients = recipe.ingredients
    }

    func updateServings(to newServings: Int) {
        let scaleFactor = Double(newServings) / Double(recipe.servings)
        scaledIngredients = recipe.ingredients.map { ingredient in
            Ingredient(
                id: ingredient.id,
                name: ingredient.name,
                amount: ingredient.amount * scaleFactor,
                unit: ingredient.unit
            )
        }
    }

    func isSelectedIngredient(_ ingredient: Ingredient) -> Bool {
        selectedIngredients.contains(ingredient)
    }

    func toggleSelectedIngredient(_ ingredient: Ingredient) {
        if selectedIngredients.contains(ingredient) {
            selectedIngredients.remove(at: selectedIngredients.firstIndex(of: ingredient)!)
        } else {
            selectedIngredients.append(ingredient)
        }
    }
}
