//
//  DynamicStoryView.swift
//  CYOATemplate
//
// Created by Humphrey Yan on 2026-05-24

import SwiftUI

struct DynamicStoryView: View {
    
    @EnvironmentObject var settings: StorySettingsManager
    
    @StateObject private var viewModel = StoryViewModel()
    @State private var showSettings: Bool = false
    
    var body: some View {
        ZStack {
            
            backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                headerBar
                
                if viewModel.isLoading {
                    loadingView
                    
                } else if let errorMessage = viewModel.errorMessage {
                    errorView(errorMessage)
                    
                } else if let page = viewModel.currentPage {
                    storyContent(page)
                    
                } else {
                    startView
                }
            }
            .blur(radius: showSettings ? 3.0 : 0.0)
            .opacity(settings.overlayBrightness)
            
            settingsOverlay
        }
        .task {
            if viewModel.currentPage == nil {
                await viewModel.loadStartingPage()
            }
        }
    }
    
        // MARK: - Basic Colors
    
    private var backgroundColor: Color {
        settings.isDarkMode ? .black : .white
    }
    
    private var textColor: Color {
        settings.isDarkMode ? .white : .black
    }
    
    private var buttonTextColor: Color {
        settings.isDarkMode ? .black : .white
    }
    
    private var buttonBackgroundColor: Color {
        settings.isDarkMode ? .white : .black
    }
    
    // MARK: - Bestie Name Replacement
    
    private func personalizedText(_ text: String) -> String {
        let name = settings.displayedBestieName
        
        return text
            .replacingOccurrences(of: "{{bestfired}}", with: name)
            .replacingOccurrences(of: "your best friend", with: name)
            .replacingOccurrences(of: "Your best friend", with: name)
            .replacingOccurrences(of: "Best friend", with: name)
            .replacingOccurrences(of: "Best friend", with: name)
    }
    
    // MARK: - Header
    
    private var headerBar: some View {
        HStack(spacing: 16) {
            
            if let page = viewModel.currentPage {
                Text("PAGE:// \(page.id)")
                    .font(.caption.monospaced())
                    .foregroundColor(.red)
                    .bold()
            } else {
                Text("PAGE:// --")
                    .font(.caption.monospaced())
                    .foregroundColor(.red)
                    .bold()
            }
            
            Spacer()
            
            if viewModel.canGoBack {
                Button {
                    Task {
                        await viewModel.goBack()
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(.red)
                }
            }
            
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
    
    // MARK: - Loading View
    
    private var loadingView: some View {
        VStack(spacing: 16) {
            ProgressView()
                .tint(.red)
            
            Text("LOADING STORY DATA...")
                .font(.caption.monospaced())
                .foregroundColor(.red)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    // MARK: - Error View
    
    private func errorView(_ message: String) -> some View {
        VStack(spacing: 16) {
            
            Text("DATABASE ERROR")
                .font(.title2.monospaced().bold())
                .foregroundColor(.red)
            
            Text(message)
                .font(.caption.monospaced())
                .foregroundColor(textColor)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            Button {
                Task {
                    await viewModel.loadStartingPage()
                }
            } label: {
                Text("TRY AGAIN")
                    .font(.caption.monospaced().bold())
                    .foregroundColor(buttonTextColor)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(buttonBackgroundColor)
                    .cornerRadius(6)
            }
            .padding(.horizontal, 24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    // MARK: - Start View
    
    private var startView: some View {
        VStack(spacing: 20) {
            
            Text("DO NOT OPEN")
                .font(.title.monospaced().bold())
                .foregroundColor(textColor)
            
            Text("An interactive dorm horror story")
                .font(.caption.monospaced())
                .foregroundColor(textColor.opacity(0.7))
            
            Button {
                Task {
                    await viewModel.loadStartingPage()
                }
            } label: {
                Text("START STORY")
                    .font(.caption.monospaced().bold())
                    .foregroundColor(buttonTextColor)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(buttonBackgroundColor)
                    .cornerRadius(6)
            }
            .padding(.horizontal, 24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    // MARK: - Main Story Content
    
    private func storyContent(_ page: Page) -> some View {
        VStack(spacing: 0) {
            
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    
                    if page.isAnEndingOfTheStory {
                        endingHeader(page)
                    }
                    
                    if let imageName = page.image, !imageName.isEmpty {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(8)
                            .padding(.horizontal, 24)
                            .padding(.top, 12)
                    }
                    
                    Text(personalizedText(page.narrative))
                        .font(.system(size: settings.fontSize, weight: .medium, design: .monospaced))
                        .foregroundColor(textColor)
                        .lineSpacing(6)
                        .padding(.horizontal, 24)
                        .padding(.top, page.isAnEndingOfTheStory ? 8 : 24)
                        .horrorGlitch()
                        .id(page.id)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Spacer()
            
            if page.isDanger == true && !page.isAnEndingOfTheStory {
                PanicTimerView(totalTime: 25.0) {
                    Task {
                        await handleTimerExpired(for: page)
                    }
                }
                .padding(.bottom, 12)
                .id(page.id)
            }
            
            if page.isAnEndingOfTheStory {
                restartButton
                    .padding(.bottom, 30)
            } else {
                choiceButtons
                    .padding(.bottom, 30)
            }
        }
    }
    
    // MARK: - Ending Header
    
    private func endingHeader(_ page: Page) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text(page.endingContext ?? "Ending")
                .font(.title2.monospaced().bold())
                .foregroundColor(.red)
            
            if let endingType = viewModel.endingType {
                Text(endingType.label.uppercased())
                    .font(.caption.monospaced().bold())
                    .foregroundColor(.red.opacity(0.8))
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 24)
    }
    
    // MARK: - Choice Buttons
    
    private var choiceButtons: some View {
        VStack(spacing: 12) {
            
            ForEach(viewModel.choices) { edge in
                Button {
                    Task {
                        await viewModel.choose(edge)
                    }
                } label: {
                    Text((edge.prompt ?? "Continue").uppercased())
                        .font(.system(size: max(13, settings.fontSize - 2), weight: .bold, design: .monospaced))
                        .foregroundColor(buttonTextColor)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(buttonBackgroundColor)
                        .cornerRadius(6)
                }
                .padding(.horizontal, 24)
            }
            
            if viewModel.choices.isEmpty {
                Text("NO CHOICES AVAILABLE FOR THIS PAGE.")
                    .font(.caption.monospaced())
                    .foregroundColor(.red)
                    .padding(.horizontal, 24)
            }
        }
    }
    
    // MARK: - Restart Button
    
    private var restartButton: some View {
        Button {
            Task {
                await viewModel.restart()
            }
        } label: {
            Text("RESTART STORY")
                .font(.system(size: max(13, settings.fontSize - 2), weight: .bold, design: .monospaced))
                .foregroundColor(buttonTextColor)
                .frame(maxWidth: .infinity)
                .padding()
                .background(buttonBackgroundColor)
                .cornerRadius(6)
        }
        .padding(.horizontal, 24)
    }
    
    // MARK: - Timer Logic
    
    private func handleTimerExpired(for page: Page) async {
        if let timeoutPageId = page.timeoutPageId {
            await viewModel.loadPage(id: timeoutPageId)
        } else {
            await viewModel.loadPage(id: 29)
        }
    }
    
    // MARK: - Settings Overlay
    
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
}
