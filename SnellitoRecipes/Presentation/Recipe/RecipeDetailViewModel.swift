//
//  RecipeDetailViewModel.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import Foundation

final class RecipeDetailViewModel: ObservableObject {
    let recipe: Recipe
    @Published var servings: Int {
        didSet { updateServings(to: servings) }
    }

    @Published var scaledIngredients: [Ingredient]
    @Published var selectedIngredients: [UUID] = []

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
        selectedIngredients.contains(ingredient.id)
    }

    func toggleSelectedIngredient(_ ingredient: Ingredient) {
        if selectedIngredients.contains(ingredient.id) {
            selectedIngredients.remove(at: selectedIngredients.firstIndex(of: ingredient.id)!)
        } else {
            selectedIngredients.append(ingredient.id)
        }
    }
}

// MARK: - Footer Actions

extension RecipeDetailViewModel {
    func didTapRecipes() {
        print("Tapped Recipes")
    }

    func didTapAboutUs() {
        print("Tapped About Us")
    }

    func didTapFAQ() {
        print("Tapped FAQ")
    }

    func didTapContact() {
        print("Tapped Contact")
    }

    func didTapInstagram() {
        print("Tapped Instagram")
    }

    func didTapFacebook() {
        print("Tapped Facebook")
    }
}
