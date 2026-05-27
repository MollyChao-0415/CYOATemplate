//
//  CYOATemplateApp.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2023-05-29.
//


import SwiftUI

@main
struct CYOATemplateApp: App {
    
    @StateObject private var settings = StorySettingsManager()
    
    var body: some Scene {
        WindowGroup {
            if settings.hasCompletedBestieSetup {
                DynamicStoryView()
                    .environmentObject(settings)
            } else {
                BestieSetupView()
                    .environmentObject(settings)
            }
        }
    }
}
