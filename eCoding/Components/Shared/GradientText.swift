//
//  GradientText.swift
//  eCoding
//
//  Created by Luca Lo Forte on 6/5/21.
//

import SwiftUI

struct GradientText: View {
    
    var text : String
    
    var body: some View {
        Text(self.text)
            .gradientForeground(colors: [
                Color("pink-gradient-1"),
                Color("pink-gradient-2")
            ])
    }
}

