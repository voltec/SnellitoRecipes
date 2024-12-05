//
//  RecipeDetailView.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe = .mock()
    @State var servings: Int = 4

    var body: some View {
        ScrollView {
            VStack(spacing: 14) {
                ImageCarouselView(imageURLs: recipe.imageURLs)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.horizontal, 16)

                VStack {
                    RecipeInfoCardView(
                        recipeName: recipe.name,
                        cuisine: recipe.cuisine,
                        description: recipe.description,
                        cookingTime: recipe.cookingTime,
                        servings: $servings,
                        preparationTime: recipe.preparationTime
                    )
                    ExpandableStack(title: "Ingredients") {
                        ForEach(recipe.ingredients) { ingredient in
                            IngredientView(ingredient: ingredient, isChecked: false)
                        }
                    }

                    ExpandableStack(title: "Instructions") {
                        ForEach(recipe.instructions) { instruction in
                            InstructionView(instruction: instruction)
                        }
                    }
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(Color.accentColor)
                }
                .padding(16)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color.recipeBackground))
                .padding(.horizontal, 16)

                FooterView()
                    .padding(.top, 16)
            }
            .padding(.top, 16)
        }
        .background(Color.primaryBackground)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    NavigationStack {
        RecipeDetailView()
    }
}
