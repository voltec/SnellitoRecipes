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
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            HStack(spacing: 10) {
                                Image("header_logo")
                                Text("Snellito")
                                    .font(.sweetBold(size: 24))
                            }
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {} label: {
                                Image("menu")
                            }
                        }
                    }
            }
        }
    }
}
