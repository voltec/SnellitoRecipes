//
//  ExpandableView.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import SwiftUI

struct ExpandableStack<Content: View>: View {
    private let title: String
    private let content: () -> Content
    @State private var isExpanded: Bool = false
    private var onExpand: (Bool) -> Void

    public init(title: String, defaultState: Bool = false, onExpand: @escaping (Bool) -> Void = { _ in },
                @ViewBuilder content: @escaping () -> Content)
    {
        self.title = title
        isExpanded = defaultState
        self.onExpand = onExpand
        self.content = content
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color.accentColor)
            // Header with toggle button
            HStack {
                Text(title)
                    .font(.sweetMedium(size: 20))
                Spacer()
                Image(isExpanded ? "expand_minus" : "expand_plus")
                    .renderingMode(.template)
            }
            .foregroundStyle(Color.textPrimary)
            .padding(.top, 14)
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation {
                    isExpanded.toggle()
                }
                onExpand(isExpanded)
            }

            // Expandable content
            if isExpanded {
                content()
                    .transition(.opacity)
                    .padding(.top, 20)
            }
        }
    }
}

#Preview {
    ExpandableStack(title: "Energy value per serving") {
        Rectangle().frame(height: 200)
            .foregroundStyle(.blue)
    }
    .padding()
}
