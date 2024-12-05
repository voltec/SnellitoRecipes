//
//  Color+Theme.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import SwiftUI

extension Color {
    static let primaryBackground = Color(light: Color(hex: "#F5EFE7"), dark: Color(hex: "#050F07"))
    static let accentColor = Color(hex: "#DB4725")
    static let textPrimary = Color(light: Color(hex: "#000000"), dark: Color(hex: "#F1F1F1"))
    static let textSecondary = Color(light: Color(hex: "#626262"), dark: Color(hex: "#B2B2B2"))
    static let recipeBackground = Color(
        light: Color(hex: "#DFA8EE").opacity(0.38),
        dark: Color(hex: "#9B4CB5").opacity(0.6)
    )
    static let footerBackground = Color(hex: "#1433A4")
    static let footerText = Color.white
    static let footerSecondary = Color(hex: "#F1F1F1")
}

#Preview {
    ColorPreview()
}

private struct ColorPreview: View {
    let colors = [
        ("Primary Background", Color.primaryBackground),
        ("Accent Color", Color.accentColor),
        ("Text Primary", Color.textPrimary),
        ("Text Secondary", Color.textSecondary),
        ("Recipe Background", Color.recipeBackground),
        ("Footer Background", Color.footerBackground),
        ("Footer Text", Color.footerText),
        ("Footer Secondary", Color.footerSecondary)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(colors, id: \.0) { name, color in
                HStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(color)
                        .frame(width: 50, height: 50)
                        .shadow(color: .black.opacity(0.2), radius: 2)
                    Text(name)
                        .foregroundColor(.black)
                        .font(.headline)
                }
            }
        }
        .padding()
    }
}
