//
//  StorySettingsPanel.swift
//  CYOATemplate
//
//  Created by Yuk Tung Chao on 2026-05-24.
//


import SwiftUI

struct StorySettingsPanel: View {
    
    @ObservedObject var settings: StorySettingsManager
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Capsule()
                .fill(Color.secondary.opacity(0.4))
                .frame(width: 40, height: 5)
                .frame(maxWidth: .infinity)
                .padding(.top, 8)
            
            Text("STORY SETTINGS")
                .font(.headline.monospaced().bold())
                .foregroundColor(.red)
            
            Toggle("Dark Mode", isOn: $settings.isDarkMode)
                .font(.body.monospaced())
            
            VStack(alignment: .leading) {
                Text("Font Size: \(Int(settings.fontSize))")
                    .font(.body.monospaced())
                
                Slider(value: $settings.fontSize, in: 13...24, step: 1)
            }
            
            VStack(alignment: .leading) {
                Text("Overlay Brightness")
                    .font(.body.monospaced())
                
                Slider(value: $settings.overlayBrightness, in: 0.55...1.0, step: 0.05)
            }
            
            Button {
                settings.resetSettings()
            } label: {
                Text("RESET SETTINGS")
                    .font(.caption.monospaced().bold())
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red.opacity(0.2))
                    .cornerRadius(8)
            }
            
        }
        .padding(24)
        .background(settings.isDarkMode ? Color.black : Color.white)
        .foregroundColor(settings.isDarkMode ? .white : .black)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .padding()
    }
}
