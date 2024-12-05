//
//  RecipeDetailView.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import SwiftUI

struct RecipeDetailView: View {
    enum ScrollSection: Hashable {
        case ingredients
        case instructions
    }

    @StateObject private var viewModel: RecipeDetailViewModel

    init(recipe: Recipe) {
        _viewModel = StateObject(wrappedValue: RecipeDetailViewModel(recipe: recipe))
    }

    var body: some View {
        ScrollViewReader { scroll in
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

                        ExpandableStack(title: "Ingredients", defaultState: true, onExpand: { expanded in
                            if expanded {
                                withAnimation {
                                    scroll.scrollTo(ScrollSection.ingredients, anchor: .top)
                                }
                            }
                        }) {
                            ForEach(viewModel.scaledIngredients) { ingredient in
                                IngredientView(
                                    ingredient: ingredient,
                                    isChecked: viewModel.isSelectedIngredient(ingredient)
                                )
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation {
                                        viewModel.toggleSelectedIngredient(ingredient)
                                    }
                                }
                            }
                        }
                        .id(ScrollSection.ingredients)

                        ExpandableStack(title: "Instructions", onExpand: { expanded in
                            if expanded {
                                withAnimation {
                                    scroll.scrollTo(ScrollSection.instructions, anchor: .top)
                                }
                            }
                        }) {
                            ForEach(viewModel.recipe.instructions) { instruction in
                                InstructionView(instruction: instruction)
                            }
                        }
                        .id(ScrollSection.instructions)

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
