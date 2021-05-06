//
//  ViewExtensions.swift
//  eCoding
//
//  Created by Luca Lo Forte on 6/5/21.
//

import SwiftUI

extension View {
    func gradientForeground(colors: [Color]) -> some View {
        self.overlay(
            LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .mask(self)
    }
}
