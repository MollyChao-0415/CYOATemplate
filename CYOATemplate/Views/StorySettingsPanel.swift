//
//  StorySettingsPanel.swift
//  CYOATemplate
//
//  Created by Yuk Tung Chao on 2026-05-24.
//


//
//  StorySettingsPanel.swift
//  CYOATemplate
//

import SwiftUI

struct StorySettingsPanel: View {
    
    @ObservedObject var settings: StorySettingsManager
    
    var body: some View {
        VStack(spacing: 20) {
            Capsule()
                .frame(width: 40, height: 5)
                .foregroundColor(.secondary.opacity(0.3))
                .padding(.top, 4)
            
            Text("ACCESSIBILITY INTERFACE")
                .font(.caption.monospaced())
                .fontWeight(.bold)
                .foregroundColor(.secondary)
            
            Toggle(isOn: $settings.isDarkMode) {
                Label(
                    "Dark Mode Theme",
                    systemImage: settings.isDarkMode ? "moon.fill" : "sun.max.fill"
                )
                .font(.body.monospaced())
            }
            .toggleStyle(SwitchToggleStyle(tint: .red))
            
            Divider()
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Text Display Scale")
                        .font(.body.monospaced())
                    Spacer()
                    Text("\(Int(settings.fontSize))pt")
                        .font(.caption.monospaced())
                }
                
                Slider(value: $settings.fontSize, in: 14...26, step: 1)
                    .tint(.red)
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Display Exposure")
                        .font(.body.monospaced())
                    Spacer()
                    Text("\(Int(settings.overlayBrightness * 100))%")
                        .font(.caption.monospaced())
                }
                
                Slider(value: $settings.overlayBrightness, in: 0.15...1.0)
                    .tint(.red)
            }
        }
        .padding([.horizontal, .bottom], 24)
        .background(settings.isDarkMode ? Color(.systemGray6) : Color(.systemBackground))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}
