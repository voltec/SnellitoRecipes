//
//  Instruction.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import Foundation

struct Instruction: Identifiable {
    var id: UUID = .init()
    let stepNumber: Int
    let type: InstructionType
    let description: String
    let specialImportance: String?
}

enum InstructionType: String {
    case preparation = "Preparation"
    case cooking = "Cooking"
    case serving = "Serving"
}
