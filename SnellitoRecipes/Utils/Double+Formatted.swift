//
//  Double+Formatted.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import Foundation

extension Double {
    func formattedString(maxFractionDigits: Int = 2) -> String {
        if self == floor(self) {
            return String(format: "%.0f", self)
        } else {
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = maxFractionDigits
            formatter.numberStyle = .decimal
            return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
        }
    }
}
