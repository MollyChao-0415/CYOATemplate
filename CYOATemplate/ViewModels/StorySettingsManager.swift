//
//  StorySettingsManager.swift
//  CYOATemplate
//
//  Created by Yuk Tung Chao on 2026-05-24.
//


import Foundation
import SwiftUI

class StorySettingsManager: ObservableObject {
    
    @Published var isDarkMode: Bool = true {
        didSet {
            UserDefaults.standard.set(isDarkMode, forKey: "cyoa_is_dark_mode")
        }
    }
    
    @Published var fontSize: CGFloat = 18.0 {
        didSet {
            UserDefaults.standard.set(Double(fontSize), forKey: "cyoa_font_size")
        }
    }
    
    @Published var overlayBrightness: Double = 1.0 {
        didSet {
            UserDefaults.standard.set(overlayBrightness, forKey: "cyoa_overlay_brightness")
        }
    }
    
    init() {
        UserDefaults.standard.register(defaults: [
            "cyoa_is_dark_mode": true,
            "cyoa_font_size": 18.0,
            "cyoa_overlay_brightness": 1.0
        ])
        
        self.isDarkMode = UserDefaults.standard.bool(forKey: "cyoa_is_dark_mode")
        self.fontSize = CGFloat(UserDefaults.standard.double(forKey: "cyoa_font_size"))
        self.overlayBrightness = UserDefaults.standard.double(forKey: "cyoa_overlay_brightness")
        
        if self.fontSize == 0 {
            self.fontSize = 18.0
        }
        
        if self.overlayBrightness == 0 {
            self.overlayBrightness = 1.0
        }
    }
}
