//
//  RecipeDetailView.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import SwiftUI

struct RecipeDetailView: View {
    @StateObject private var viewModel: RecipeDetailViewModel

    init(recipe: Recipe) {
        _viewModel = StateObject(wrappedValue: RecipeDetailViewModel(recipe: recipe))
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 14) {
                ImageCarouselView(imageURLs: viewModel.recipe.imageURLs)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.horizontal, 16)

                VStack(spacing: 20) {
                    RecipeInfoCardView(
                        recipeName: viewModel.recipe.name,
                        cuisine: viewModel.recipe.cuisine,
                        description: viewModel.recipe.description,
                        cookingTime: viewModel.recipe.cookingTime,
                        servings: $viewModel.servings,
                        preparationTime: viewModel.recipe.preparationTime
                    )

                    ExpandableStack(title: "Ingredients", defaultState: true) {
                        ForEach(viewModel.scaledIngredients) { ingredient in
                            IngredientView(
                                ingredient: ingredient,
                                isChecked: viewModel.isSelectedIngredient(ingredient)
                            )
                            .contentShape(Rectangle())
                            .onTapGesture {
                                viewModel.toggleSelectedIngredient(ingredient)
                            }
                        }
                    }

                    ExpandableStack(title: "Instructions") {
                        ForEach(viewModel.recipe.instructions) { instruction in
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
        RecipeDetailView(recipe: .mock())
    }
}
