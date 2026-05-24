//
//  CYOATemplateApp.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2023-05-29.
//

import SwiftUI

@main
struct CYOATemplateApp: App {
    // 1. Create the persistent instance inside your root app target
    @StateObject private var settingsManager = StorySettingsManager()

    var body: some Scene {
        WindowGroup {
            // 2. This passes your state tracking down to your primary layout view
            // (Replace 'ContentView()' with whatever your main game screen or book view is named)
            BestieSetupView(bestieName: <#Binding<String>#>)
                .environmentObject(settingsManager)
        }
    }
}
