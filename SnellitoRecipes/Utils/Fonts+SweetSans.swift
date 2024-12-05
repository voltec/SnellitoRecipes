//
//  Fonts+SweetSans.swift
//  SnellitoRecipes
//
//  Created by Mikhail Mukminov on 05.12.2024.
//

import SwiftUI

extension Font {
    static func sweetRegular(size: CGFloat) -> Font {
        .custom("SweetSansPro-Regular", size: size)
    }

    static func sweetMedium(size: CGFloat) -> Font {
        .custom("SweetSansPro-Medium", size: size)
    }

    static func sweetBold(size: CGFloat) -> Font {
        .custom("SweetSansPro-Bold", size: size)
    }
}
