//
//  CYOATemplateApp.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2023-05-29.
//

import SwiftUI

@main
struct CYOATemplateApp: App {
    // 1. Instantiate the Global Appearance & Customization Settings Controller
    @StateObject private var settingsManager = StorySettingsManager()
    
    // 2. Holds the player's best friend name; starts empty to show onboarding first
    @State private var globalBestieName: String = ""

    var body: some Scene {
        WindowGroup {
            if globalBestieName.isEmpty {
                // Displays your friend setup screen on launch
                BestieSetupView(bestieName: $globalBestieName)
                    .environmentObject(settingsManager)
            } else {
                // Seamlessly boots your dynamic database engine once they press continue
                DynamicStoryView()
                    .environmentObject(settingsManager)
            }
        }
    }
}
