//
//  AdaptableHeightModifier.swift
//  Mood Scribbler
//
//  Created by ioscribbler on 02.12.2024.
//

import Foundation
import SwiftUI

struct AdaptableHeightModifier: ViewModifier {
    @Binding var currentHeight: CGFloat

    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: AdaptableHeightPreferenceKey.self, value: geometry.size.height)
        }
    }

    func body(content: Content) -> some View {
        content
            .background(sizeView)
            .onPreferenceChange(AdaptableHeightPreferenceKey.self) { height in
                if let height {
                    currentHeight = height
                }
            }
    }
}
