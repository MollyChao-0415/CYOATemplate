//
//  StorySettingsManager.swift
//  CYOATemplate
//
//  Created by Yuk Tung Chao on 2026-05-24.
//
//This is helped by AI

import Foundation
import SwiftUI

final class StorySettingsManager: ObservableObject {
    
    @Published var isDarkMode: Bool = true
    @Published var fontSize: CGFloat = 17
    @Published var overlayBrightness: Double = 1.0
    
    @Published var bestieName: String = ""
    @Published var hasCompletedBestieSetup: Bool = false
    
    var displayedBestieName: String {
        let trimmed = bestieName.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty ? "your bestie" : trimmed
    }
    
    func completeBestieSetup() {
        hasCompletedBestieSetup = true
    }
    
    func resetStorySetup() {
        bestieName = ""
        hasCompletedBestieSetup = false
    }
    
    func resetSettings() {
        isDarkMode = true
        fontSize = 17
        overlayBrightness = 1.0
    }
}
