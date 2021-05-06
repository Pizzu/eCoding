//
//  GradientButton.swift
//  eCoding
//
//  Created by Luca Lo Forte on 6/5/21.
//

import SwiftUI

struct GradientButton: View {
    
    var gradientOne : [Color] = [
        Color.init(red: 101/255, green: 134/255, blue: 1),
        Color.init(red: 1, green: 64/255, blue: 80/255),
        Color.init(red: 109/255, green: 1, blue: 185/255),
        Color.init(red: 39/255, green: 232/255, blue: 1)
    ]
    
    @State private var colorAngle : Double = 0.0
    
    var body: some View {
        Button(action: {
            print("Sign up")
        }, label: {
            GeometryReader() { geometry in
                ZStack {
                    AngularGradient(gradient: Gradient(colors: gradientOne), center: .center, angle: .degrees(self.colorAngle))
                        .blendMode(.overlay)
                        .blur(radius: 8)
                        .mask(
                            RoundedRectangle(cornerRadius: 16)
                                .frame(height: 50)
                                .frame(maxWidth: geometry.size.width - 16)
                                .blur(radius: 8)
                        )
                        .onAppear {
                            withAnimation(.linear(duration: 7)) {
                                self.colorAngle += 350.0
                            }
                        }
                    GradientText(text: "Create Account")
                        .font(.headline)
                        .frame(width: geometry.size.width - 16, height: 50)
                        .background(Color("tertiaryBackground").opacity(0.9))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 1)
                                .blendMode(.normal)
                                .opacity(0.7)
                        )
                        .cornerRadius(16)
                }
            }
            .frame(height: 50)
        })
    }
}

