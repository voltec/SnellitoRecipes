//
//  Recipe+Mocks.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import Foundation

extension Recipe {
    static func mock() -> Self {
        Recipe(
            id: UUID(),
            name: "Bbl Chicken Enchilada Sauce",
            imageURLs: [
                URL(string: "https://res.cloudinary.com/dca1li8a3/image/upload/v1732418686/zemobx2lk5e1amwh4s49.webp")!,
                URL(string: "https://picsum.photos/300/500")!,
                URL(string: "https://picsum.photos/500/300")!
            ],
            cuisine: "Mexican",
            allergens: [],
            webLink: URL(string: "https://www.gimmesomeoven.com/caprese-phyllo-cups/")!,
            description: "A rich and flavorful homemade enchilada sauce made with chili powder, tomato paste, and a blend of spices.",
            cookingTime: 20,
            preparationTime: 15,
            flavors: ["Savory", "Spicy"],
            proteins: 40,
            nutrition: "High-Protein",
            servings: 4,
            sourceName: "Gimme Some Oven",
            ingredients: [
                Ingredient(name: "Olive Oil", amount: 2, unit: .tablespoon),
                Ingredient(name: "All-Purpose Flour", amount: 2, unit: .tablespoon),
                Ingredient(name: "Chili Powder", amount: 4, unit: .tablespoon),
                Ingredient(name: "Garlic Powder", amount: 0.5, unit: .teaspoon),
                Ingredient(name: "Ground Cumin", amount: 0.5, unit: .teaspoon),
                Ingredient(name: "Dried Oregano", amount: 0.25, unit: .teaspoon),
                Ingredient(name: "Water", amount: 2, unit: .cup),
                Ingredient(name: "Sea Salt", amount: 1, unit: .teaspoon),
                Ingredient(name: "Black Pepper", amount: 1, unit: .pinch),
                Ingredient(name: "Tomato Paste", amount: 3, unit: .ounce),
                Ingredient(name: "Boneless Skinless Chicken Breast", amount: 16, unit: .ounce)
            ],
            instructions: [
                Instruction(
                    stepNumber: 1,
                    type: .preparation,
                    description: "Mix together dry spices.",
                    specialImportance: "Ensure oil is heated enough before using."
                ),
                Instruction(
                    stepNumber: 2,
                    type: .cooking,
                    description: "Heat olive oil and whisk in flour for 1 minute.",
                    specialImportance: "Whisk continuously to avoid burning."
                ),
                Instruction(
                    stepNumber: 3,
                    type: .cooking,
                    description: "Add dry seasonings and whisk to combine.",
                    specialImportance: "Whisk continuously to avoid lumps."
                ),
                Instruction(
                    stepNumber: 4,
                    type: .cooking,
                    description: "Gradually add water, whisking until smooth.",
                    specialImportance: "Ensure the sauce is smooth."
                ),
                Instruction(
                    stepNumber: 5,
                    type: .cooking,
                    description: "Add tomato paste and whisk until smooth.",
                    specialImportance: "Continue whisking to fully incorporate the paste."
                ),
                Instruction(
                    stepNumber: 6,
                    type: .cooking,
                    description: "Simmer for 10–15 minutes until desired consistency.",
                    specialImportance: "Simmer time affects thickness."
                ),
                Instruction(
                    stepNumber: 7,
                    type: .preparation,
                    description: "Taste and season with additional salt/pepper as needed.",
                    specialImportance: "Adjust seasoning to taste."
                ),
                Instruction(
                    stepNumber: 8,
                    type: .serving,
                    description: "Serve or store in a sealed container (3 days in fridge, 3 months in freezer).",
                    specialImportance: "Consider storage options if not using immediately."
                )
            ]
        )
    }
}
