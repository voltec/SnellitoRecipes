//
//  RecipeInfoCardView.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import SwiftUI

struct RecipeInfoCardView: View {
    let recipeName: String
    let cuisine: String
    let description: String
    let cookingTime: Int
    @Binding var servings: Int
    let preparationTime: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 6) {
                    Text(cuisine)
                    Circle()
                        .frame(width: 5, height: 5)
                    Text("Main Dish")
                }
                .font(.sweetRegular(size: 14))
                .textCase(.uppercase)

                Text("\(recipeName)")
                    .font(.sweetBold(size: 34))
                    .bold()
            }

            Text(description)
                .font(.sweetRegular(size: 16))
                .lineSpacing(1.3)

            HStack {
                VStack(spacing: 9) {
                    Text("Cooking")
                        .textCase(.uppercase)
                        .font(.sweetRegular(size: 12))
                        .foregroundStyle(Color.textSecondary)
                    Text("\(cookingTime) min")
                        .font(.sweetMedium(size: 16))
                        .frame(height: 20)
                }

                Spacer()

                VStack(spacing: 9) {
                    Text("Servings")
                        .textCase(.uppercase)
                        .font(.sweetRegular(size: 12))
                        .foregroundStyle(Color.textSecondary)
                    ServingStepper(value: $servings)
                }

                Spacer()

                VStack(spacing: 9) {
                    Text("Preparation")
                        .textCase(.uppercase)
                        .font(.sweetRegular(size: 12))
                        .foregroundStyle(Color.textSecondary)
                    Text("\(preparationTime) min")
                        .font(.sweetMedium(size: 16))
                        .frame(height: 20)
                }
            }
            .padding(16)
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.accentColor, lineWidth: 1))
        }
    }
}

#Preview {
    @Previewable @State var servings = 4
    let recipe: Recipe = .mock()
    RecipeInfoCardView(
        recipeName: recipe.name,
        cuisine: recipe.cuisine,
        description: recipe.description,
        cookingTime: recipe.cookingTime,
        servings: $servings,
        preparationTime: recipe.preparationTime
    )
    .padding(16)
}
