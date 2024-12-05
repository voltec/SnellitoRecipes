//
//  FooterView.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import SwiftUI

struct FooterView: View {
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
                    Button("Recipes") {}
                    Button("About Us") {}
                    Button("FAQ") {}
                    Button("Contact") {}
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
                Button(action: {}) {
                    Text("Instagram")
                }
                Button(action: {}) {
                    Text("Facebook")
                }
            }
            .font(.sweetRegular(size: 16))
        }
        .foregroundStyle(Color.footerText)
    }
}

#Preview {
    FooterView()
}
