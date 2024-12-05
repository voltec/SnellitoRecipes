//
//  FooterView.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import SwiftUI

struct FooterView: View {
    @ObservedObject var viewModel: RecipeDetailViewModel

    var body: some View {
        ZStack {
            Color.footerBackground
            VStack(spacing: 16) {
                HStack {
                    Image("footer_logo")
                    Text("Snellito")
                        .font(.sweetBold(size: 24))
                }
                Text(
                    "Lorem ipsum dolor sit amet consectetur. Et faucibus aliquam tempus morbi. Elementum condimentum consectetur amet tortor neque tortor."
                )
                .font(.sweetRegular(size: 14))
                .foregroundStyle(Color.footerSecondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

                Text("Menu")
                    .font(.sweetMedium(size: 18))

                HStack(spacing: 20) {
                    Button("Recipes") {
                        viewModel.didTapRecipes()
                    }
                    Button("About Us") {
                        viewModel.didTapAboutUs()
                    }
                    Button("FAQ") {
                        viewModel.didTapFAQ()
                    }
                    Button("Contact") {
                        viewModel.didTapContact()
                    }
                }
                .font(.sweetRegular(size: 16))

                socialMediaViews
            }
            .foregroundStyle(Color.footerText)
            .padding(.horizontal, 16)
            .padding(.vertical, 40)
        }
    }

    private var socialMediaViews: some View {
        VStack(spacing: 12) {
            Text("Social Media")
                .font(.sweetMedium(size: 18))

            HStack(spacing: 20) {
                Button(action: { viewModel.didTapInstagram() }) {
                    Text("Instagram")
                }
                Button(action: { viewModel.didTapFacebook() }) {
                    Text("Facebook")
                }
            }
            .font(.sweetRegular(size: 16))
        }
        .foregroundStyle(Color.footerText)
    }
}

#Preview {
    FooterView(viewModel: RecipeDetailViewModel(recipe: .mock()))
}
