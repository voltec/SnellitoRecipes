//
//  InstructionView.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import SwiftUI

struct InstructionView: View {
    let instruction: Instruction

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Step number
            Text("\(instruction.stepNumber)")
                .font(.sweetBold(size: 24))
                .foregroundColor(.accentColor)
                .frame(width: 30, height: 30)
                .background(Color.primaryBackground)
                .cornerRadius(15)
                .overlay(
                    Circle()
                        .stroke(Color.accentColor, lineWidth: 2)
                )

            VStack(alignment: .leading, spacing: 8) {
                // Instruction type
                Text(instruction.type.rawValue.uppercased())
                    .font(.headline)
                    .foregroundColor(.secondary)

                // Description
                Text(instruction.description)
                    .font(.sweetRegular(size: 16))
                    .foregroundColor(.textPrimary)

                // Special importance (if available)
                if let specialImportance = instruction.specialImportance {
                    Text(specialImportance)
                        .font(.sweetRegular(size: 14))
                        .foregroundColor(Color.accentColor)
                        .italic()
                }
            }
        }
    }
}

#Preview {
    InstructionView(instruction: Instruction(
        stepNumber: 1,
        type: .preparation,
        description: "Mix together dry spices.",
        specialImportance: "Ensure oil is heated enough before using."
    ))
    .background(Color.recipeBackground)
}
