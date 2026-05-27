//
//  GlitchTextModifier.swift
//  CYOATemplate
//
//  Created by Yuk Tung Chao on 2026-05-24.
//
// This is helped by AI

import SwiftUI

struct GlitchTextModifier: ViewModifier {
    
    @State private var xOffset: CGFloat = 0
    @State private var yOffset: CGFloat = 0
    @State private var blurRadius: CGFloat = 0
    @State private var isGlitched: Bool = false
    
    func body(content: Content) -> some View {
        content
            .offset(x: xOffset, y: yOffset)
            .blur(radius: blurRadius)
            .colorMultiply(isGlitched ? Color(red: 1.0, green: 0.3, blue: 0.3) : .white)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.35, repeats: true) { _ in
                    if Double.random(in: 0...1) > 0.88 {
                        withAnimation(.easeInOut(duration: 0.04)) {
                            xOffset = CGFloat.random(in: -6...6)
                            yOffset = CGFloat.random(in: -2...2)
                            blurRadius = CGFloat.random(in: 0...1.2)
                            isGlitched = true
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.06) {
                            xOffset = 0
                            yOffset = 0
                            blurRadius = 0
                            isGlitched = false
                        }
                    }
                }
            }
    }
}

extension View {
    func horrorGlitch() -> some View {
        self.modifier(GlitchTextModifier())
    }
}
