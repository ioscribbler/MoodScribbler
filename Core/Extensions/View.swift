//
//  View.swift
//  Mood Scribbler
//
//  Created by ioscribbler on 02.12.2024.
//

import Foundation
import SwiftUI

extension View {
    func readAndBindHeight(to height: Binding<CGFloat>) -> some View {
        self.modifier(AdaptableHeightModifier(currentHeight: height))
    }
}
