//
//  SwiftUIView.swift
//  CYOATemplate
//
//  Created by xinyu zhang on 2026-05-24.
//

import SwiftUI

struct BestieSetupView: View {
    
    @EnvironmentObject var settings: StorySettingsManager
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                
                Text("DO NOT OPEN")
                    .font(.largeTitle.monospaced().bold())
                    .foregroundColor(.red)
                
                Text("Before the alarm begins, enter your bestfriend's name.")
                    .font(.body.monospaced())
                    .foregroundColor(.white.opacity(0.75))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                
                TextField("Best friend's name", text: $settings.bestieName)
                    .textFieldStyle(.roundedBorder)
                    .font(.body.monospaced())
                    .padding(.horizontal, 32)
                
                Button {
                    settings.completeBestieSetup()
                } label: {
                    Text("START STORY")
                        .font(.headline.monospaced().bold())
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal, 32)
                
                Button {
                    settings.bestieName = "your best friend"
                    settings.completeBestieSetup()
                } label: {
                    Text("SKIP")
                        .font(.caption.monospaced())
                        .foregroundColor(.white.opacity(0.6))
                }
            }
        }
    }
}
