//
//  AdaptableHeightPreferenceKey.swift
//  Mood Scribbler
//
//  Created by ioscribbler on 02.12.2024.
//

import Foundation
import SwiftUI

struct AdaptableHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat?

    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        guard let nextValue = nextValue() else { return }
        value = nextValue
    }
}
