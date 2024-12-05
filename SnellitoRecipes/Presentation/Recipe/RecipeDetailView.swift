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
                    imageCarousel
                    recipeDetails(scroll: scroll)
                    footer
                }
                .padding(.top, 16)
            }
        }
        .background(Color.primaryBackground)
        .ignoresSafeArea(edges: .bottom)
    }
}

private extension RecipeDetailView {
    var imageCarousel: some View {
        ImageCarouselView(imageURLs: viewModel.recipe.imageURLs)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.horizontal, 16)
    }

    func recipeDetails(scroll: ScrollViewProxy) -> some View {
        VStack(spacing: 20) {
            recipeInfoCard
            ingredientsSection(scroll: scroll)
            instructionsSection(scroll: scroll)
            separator
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 15).fill(Color.recipeBackground))
        .padding(.horizontal, 16)
    }

    var recipeInfoCard: some View {
        RecipeInfoCardView(
            recipeName: viewModel.recipe.name,
            cuisine: viewModel.recipe.cuisine,
            description: viewModel.recipe.description,
            cookingTime: viewModel.recipe.cookingTime,
            servings: $viewModel.servings,
            preparationTime: viewModel.recipe.preparationTime
        )
    }

    func ingredientsSection(scroll: ScrollViewProxy) -> some View {
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
        .animation(.easeInOut(duration: 0.1), value: viewModel.servings)
    }

    func instructionsSection(scroll: ScrollViewProxy) -> some View {
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
    }

    var separator: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundStyle(Color.accentColor)
    }

    var footer: some View {
        FooterView(viewModel: viewModel)
            .padding(.top, 16)
    }
}

#Preview {
    NavigationStack {
        RecipeDetailView(recipe: .mock())
    }
}
