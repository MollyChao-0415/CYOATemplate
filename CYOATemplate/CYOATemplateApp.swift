//
//  CYOATemplateApp.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2023-05-29.
//

import SwiftUI

@main
struct CYOATemplateApp: App {
    
    @StateObject private var settingsManager = StorySettingsManager()
    @State private var globalBestieName: String = ""
    
    var body: some Scene {
        WindowGroup {
            if globalBestieName.isEmpty {
                BestieSetupView(bestieName: $globalBestieName)
                    .environmentObject(settingsManager)
            } else {
                DynamicStoryView(bestieName: globalBestieName)
                    .environmentObject(settingsManager)
            }
        }
    }
}
