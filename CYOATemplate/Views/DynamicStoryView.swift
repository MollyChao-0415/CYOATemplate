//
//  DynamicStoryView.swift
//  CYOATemplate
//
//  Created by Yuk Tung Chao on 2026-05-24.
//

import SwiftUI

struct DynamicStoryView: View {
    // Shared environment preferences
    @EnvironmentObject var settings: StorySettingsManager
    
    // Connect to your existing ViewModels using the @Observable macro system
    @State private var pageVM: PageViewModel
    @State private var edgesVM: EdgesViewModel
    
    @State private var showSettings: Bool = false
    @State private var countdownActive: Bool = true
    
    // Custom init to wire your existing classes cleanly
    init() {
        let store = BookStore()
        self._pageVM = State(initialValue: PageViewModel(book: store))
        self._edgesVM = State(initialValue: EdgesViewModel(book: store))
    }

    var body: some View {
        ZStack {
            // Background Layer Handler
            (settings.isDarkMode ? Color.black : Color.white)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header Trace Console Strip
                HStack {
                    // Pulls the Integer ID safely and prints it
                    Text("LOG_TRACE_ID:// \(pageVM.page?.id ?? 1)")
                        .font(.caption.monospaced())
                        .foregroundColor(.red)
                        .bold()
                    Spacer()
                    Button(action: { withAnimation { showSettings.toggle() } }) {
                        Image(systemName: "slider.horizontal.3")
                            .font(.title3)
                            .foregroundColor(.red)
                    }
                }
                .padding()
                
                // Narrative Scrolling Text Box mapping your Supabase text column
                ScrollView {
                    // Looks at pageVM.page?.body or pageVM.page?.narrative based on your model
                    Text(pageVM.page?.narrative ?? "Initializing connection to database...")
                        .font(.system(size: settings.fontSize, weight: .medium, design: .monospaced))
                        .foregroundColor(settings.isDarkMode ? .white : .black)
                        .lineSpacing(6)
                        .padding(24)
                        .horrorGlitch() // Custom real-time visual distortion modifier
                        .id(pageVM.page?.id) // Automatically triggers smooth update when page changes
                }
                
                Spacer()
                
                // Time-Pressure Panic Timer Component Integration
                // This triggers specifically on your first node (ID 1)
                if (pageVM.page?.id == 1) && countdownActive {
                    PanicTimerView(totalTime: 7.0) {
                        withAnimation {
                            countdownActive = false
                            
                            // Automatically forces the reader down your fallback row if time expires
                            Task {
                                // Forces page navigation to your designated failure node (e.g., Row 3)
                                await pageVM.fetchPage(id: 3)
                                if let store = pageVM.book {
                                    edgesVM.edges = try? await store.getEdgesForCurrentPage()
                                }
                            }
                        }
                    }
                    .padding(.bottom, 12)
                }
                
                // Dynamic Choice Button Matrix
                VStack(spacing: 12) {
                    if let choices = edgesVM.edges {
                        ForEach(choices) { edge in
                            Button(action: {
                                withAnimation {
                                    countdownActive = false // Halt current running timer
                                    
                                    // Direct async execution block to pull down destination page rows
                                    Task {
                                        // targetPageId links to destination rows in your spreadsheet model
                                        await pageVM.fetchPage(id: edge.targetPageId)
                                        if let store = pageVM.book {
                                            edgesVM.edges = try? await store.getEdgesForCurrentPage()
                                        }
                                        
                                        // Reset timer context status
                                        countdownActive = true
                                    }
                                }
                            }) {
                                Text(edge.prompt.uppercased())
                                    .font(.system(size: max(13, settings.fontSize - 2), weight: .bold, design: .monospaced))
                                    .foregroundColor(settings.isDarkMode ? .black : .white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(settings.isDarkMode ? Color.white : Color.black)
                                    .cornerRadius(6)
                            }
                            .padding(.horizontal, 24)
                        }
                    }
                }
                .padding(.bottom, 30)
            }
            .blur(radius: showSettings ? 3.0 : 0.0)
            .opacity(settings.overlayBrightness) // Applies background light modifier
            
            // Drawer Panel Overlay Layer
            if showSettings {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture { withAnimation { showSettings = false } }
                    .zIndex(1)
                
                VStack {
                    Spacer()
                    StorySettingsPanel(settings: settings)
                        .transition(.move(edge: .bottom))
                }
                .zIndex(2)
            }
        }
        .task {
            // Initial asynchronous load call to open starting row #1 out of Supabase on launch
            await pageVM.fetchPage(id: 1)
            if let store = pageVM.book {
                edgesVM.edges = try? await store.getEdgesForCurrentPage()
            }
        }
    }
}
