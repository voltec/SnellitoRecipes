//
//  ServingStepper.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import SwiftUI

struct ServingStepper: View {
    @Binding var value: Int
    var minValue: Int = 1
    var maxValue: Int = 10

    var body: some View {
        HStack(spacing: 0) {
            Button {
                if value > minValue {
                    value -= 1
                }
            } label: {
                Image("minus_button")
            }

            Text("\(value)")
                .font(.sweetMedium(size: 16))
                .frame(minWidth: 36)

            Button {
                if value < maxValue {
                    value += 1
                }
            } label: {
                Image("plus_button")
            }
        }
    }
}

#Preview {
    @Previewable @State var value = 4
    ServingStepper(value: $value)
}
