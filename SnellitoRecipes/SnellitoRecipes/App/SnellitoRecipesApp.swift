//
//  SnellitoRecipesApp.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import SwiftUI

@main
struct SnellitoRecipesApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RecipeDetailView()
            }
        }
    }
}
