//
//  ImageCarouselView.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import SwiftUI

struct ImageCarouselView: View {
    let imageURLs: [URL]
    @State private var currentIndex: Int = 0
    @State private var isMovingForward: Bool = true

    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size.width

            ZStack(alignment: .bottomTrailing) {
                Rectangle()
                    .frame(width: size, height: size)
                    .foregroundColor(Color.gray.opacity(0.2))

                if currentIndex < imageURLs.count {
                    AsyncImageView(url: imageURLs[currentIndex], size: size)
                        .id(currentIndex) // Forces a new view identity for animation
                        .transition(isMovingForward ? .move(edge: .leading) : .move(edge: .trailing))
                }

                HStack(spacing: 16) {
                    Button(action: {
                        previousImage()
                    }) {
                        Image("image_left")
                            .foregroundColor(.white)
                            .background(Color.black.opacity(0.5))
                            .clipShape(Circle())
                    }

                    Button(action: {
                        nextImage()
                    }) {
                        Image("image_right")
                            .foregroundColor(.white)
                            .background(Color.black.opacity(0.5))
                            .clipShape(Circle())
                    }
                }
                .padding(15)
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .animation(.easeInOut, value: currentIndex)
    }

    struct AsyncImageView: View {
        let url: URL
        let size: CGFloat

        var body: some View {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .clipped()
            } placeholder: {
                ProgressView()
                    .frame(width: size, height: size)
            }
        }
    }

    private func previousImage() {
        isMovingForward = false
        withAnimation {
            if currentIndex > 0 {
                currentIndex -= 1
            } else {
                currentIndex = imageURLs.count - 1
            }
        }
    }

    private func nextImage() {
        isMovingForward = true
        withAnimation {
            if currentIndex < imageURLs.count - 1 {
                currentIndex += 1
            } else {
                currentIndex = 0
            }
        }
    }
}

#Preview {
    ImageCarouselView(imageURLs: [
        URL(string: "https://res.cloudinary.com/dca1li8a3/image/upload/v1732418686/zemobx2lk5e1amwh4s49.webp")!,
        URL(string: "https://picsum.photos/300/500")!,
        URL(string: "https://picsum.photos/500/300")!
    ])
}
