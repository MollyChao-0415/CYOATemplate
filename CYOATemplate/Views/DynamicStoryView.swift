//
//  DynamicStoryView.swift
//  CYOATemplate
//
// Created by Humphrey Yan on 2026-05-24

import SwiftUI

struct DynamicStoryView: View {
    
    @EnvironmentObject var settings: StorySettingsManager
    
    let bestieName: String
    
    @State private var activeNodeID: String = "N0"
    @State private var countdownActive: Bool = true
    @State private var showSettings: Bool = false
    
    private var currentNode: StoryNode? {
        LocalStoryDatabase.nodes[activeNodeID]
    }
    
    private var currentEdges: [StoryEdge] {
        LocalStoryDatabase.edges
            .filter { $0.fromNode == activeNodeID }
            .sorted { $0.id < $1.id }
    }
    
    private var displayedNarrative: String {
        guard let currentNode else {
            return "ERROR: NODE '\(activeNodeID)' DOES NOT EXIST."
        }
        
        return currentNode.narrativeText
            .replacingOccurrences(of: "your best friend", with: bestieName)
            .replacingOccurrences(of: "Your best friend", with: bestieName)
            .replacingOccurrences(of: "best friend", with: bestieName)
    }
    
    var body: some View {
        ZStack {
            
            backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                headerBar
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {
                        
                        if let endingTitle = currentNode?.endingTitle {
                            Text(endingTitle)
                                .font(.title2.monospaced().bold())
                                .foregroundColor(.red)
                                .padding(.horizontal, 24)
                                .padding(.top, 24)
                        }
                        
                        Text(displayedNarrative)
                            .font(.system(size: settings.fontSize, weight: .medium, design: .monospaced))
                            .foregroundColor(textColor)
                            .lineSpacing(6)
                            .padding(.horizontal, 24)
                            .padding(.top, currentNode?.endingTitle == nil ? 24 : 0)
                            .horrorGlitch()
                            .id(activeNodeID)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Spacer()
                
                if shouldShowTimer {
                    PanicTimerView(totalTime: 25.0) {
                        handleTimerExpired()
                    }
                    .padding(.bottom, 12)
                    .id(activeNodeID)
                }
                
                if currentNode?.isEnding == true {
                    restartButton
                        .padding(.bottom, 30)
                } else {
                    choiceButtons
                        .padding(.bottom, 30)
                }
            }
            .blur(radius: showSettings ? 3.0 : 0.0)
            .opacity(settings.overlayBrightness)
            
            settingsOverlay
        }
    }
    
    private var backgroundColor: Color {
        settings.isDarkMode ? .black : .white
    }
    
    private var textColor: Color {
        settings.isDarkMode ? .white : .black
    }
    
    private var shouldShowTimer: Bool {
        guard let currentNode else {
            return false
        }
        
        return currentNode.isDanger && countdownActive && !currentNode.isEnding
    }
    
    private var headerBar: some View {
        HStack {
            Text("NODE:// \(activeNodeID)")
                .font(.caption.monospaced())
                .foregroundColor(.red)
                .bold()
            
            Spacer()
            
            Button {
                withAnimation {
                    showSettings.toggle()
                }
            } label: {
                Image(systemName: "slider.horizontal.3")
                    .font(.title3)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
    
    private var choiceButtons: some View {
        VStack(spacing: 12) {
            ForEach(currentEdges, id: \.id) { edge in
                Button {
                    moveTo(edge.toNode)
                } label: {
                    Text(edge.choiceText.uppercased())
                        .font(.system(size: max(13, settings.fontSize - 2), weight: .bold, design: .monospaced))
                        .foregroundColor(settings.isDarkMode ? .black : .white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(settings.isDarkMode ? Color.white : Color.black)
                        .cornerRadius(6)
                }
                .padding(.horizontal, 24)
            }
            
            if currentEdges.isEmpty {
                Text("NO CHOICES AVAILABLE FOR THIS NODE.")
                    .font(.caption.monospaced())
                    .foregroundColor(.red)
                    .padding(.horizontal, 24)
            }
        }
    }
    
    private var restartButton: some View {
        Button {
            restartStory()
        } label: {
            Text("RESTART STORY")
                .font(.system(size: max(13, settings.fontSize - 2), weight: .bold, design: .monospaced))
                .foregroundColor(settings.isDarkMode ? .black : .white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(settings.isDarkMode ? Color.white : Color.black)
                .cornerRadius(6)
        }
        .padding(.horizontal, 24)
    }
    
    @ViewBuilder
    private var settingsOverlay: some View {
        if showSettings {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        showSettings = false
                    }
                }
                .zIndex(1)
            
            VStack {
                Spacer()
                StorySettingsPanel(settings: settings)
                    .transition(.move(edge: .bottom))
            }
            .zIndex(2)
        }
    }
    
    private func moveTo(_ nodeID: String) {
        withAnimation {
            countdownActive = false
            
            if LocalStoryDatabase.nodes[nodeID] != nil {
                activeNodeID = nodeID
            } else {
                activeNodeID = "N10C"
            }
            
            countdownActive = true
        }
    }
    
    private func handleTimerExpired() {
        withAnimation {
            countdownActive = false
            
            switch activeNodeID {
            case "N0":
                activeNodeID = "N1B"
            case "N3A", "N4B", "N4C", "N6C", "N6D", "N7D", "N8D":
                activeNodeID = "N10A"
            case "N6B", "N7B", "N8B", "N9B", "N9C":
                activeNodeID = "N10B"
            default:
                activeNodeID = "N10C"
            }
            
            countdownActive = true
        }
    }
    
    private func restartStory() {
        withAnimation {
            countdownActive = false
            activeNodeID = "N0"
            countdownActive = true
        }
    }
}
