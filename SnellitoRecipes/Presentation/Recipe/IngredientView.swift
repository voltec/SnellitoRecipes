//
//  IngredientView.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import SwiftUI

struct IngredientView: View {
    let ingredient: Ingredient
    let isChecked: Bool

    var body: some View {
        HStack(spacing: 10) {
            Image(isChecked ? "checkbox" : "checkbox_off")
            Text(ingredient.name)
            Spacer()
            Text(ingredient.amountString)
        }
        .font(.sweetRegular(size: 16))
    }
}

#Preview {
    VStack {
        IngredientView(ingredient: Ingredient(name: "Olive Oil", amount: 2, unit: .tablespoon), isChecked: true)
        IngredientView(ingredient: Ingredient(name: "Water", amount: 2, unit: .cup), isChecked: false)
    }
    .padding()
}
