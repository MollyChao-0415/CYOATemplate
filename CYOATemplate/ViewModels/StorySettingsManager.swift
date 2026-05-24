//
//  StorySettingsManager.swift
//  CYOATemplate
//
//  Created by Yuk Tung Chao on 2026-05-24.
//

import Foundation
import SwiftUI

/// Manages the visual accessibility settings and environmental controls of the story reader UI.
class StorySettingsManager: ObservableObject {
    
    // 1. Controls whether the app draws a black background (Dark mode) or white background
    @Published var isDarkMode: Bool = true {
        didSet {
            UserDefaults.standard.set(isDarkMode, forKey: "cyoa_is_dark_mode")
        }
    }
    
    // 2. Adjusts text point sizes for dialogue layout blocks
    @Published var fontSize: CGFloat = 18.0 {
        didSet {
            UserDefaults.standard.set(Double(fontSize), forKey: "cyoa_font_size")
        }
    }
    
    // 3. Simulated environmental darkness layer (1.0 = normal, lower values dim the entire UI view)
    @Published var overlayBrightness: Double = 1.0
    
    init() {
        // Register fallback defaults
        UserDefaults.standard.register(defaults: [
            "cyoa_is_dark_mode": true,
            "cyoa_font_size": 18.0
        ])
        
        // Retrieve values saved by the reader previously
        self.isDarkMode = UserDefaults.standard.bool(forKey: "cyoa_is_dark_mode")
        self.fontSize = CGFloat(UserDefaults.standard.double(forKey: "cyoa_font_size"))
    }
}
