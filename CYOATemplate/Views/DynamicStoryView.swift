import SwiftUI

struct DynamicStoryView: View {
    // Shared accessibility theme preferences
    @EnvironmentObject var settings: StorySettingsManager
    
    // Explicitly tracks your specific spreadsheet node IDs as Strings
    @State private var activeNodeID: String = "N0"
    @State private var countdownActive: Bool = true
    @State private var showSettings: Bool = false
    
    // Filtered list of choice edges belonging to your specific section
    private var currentEdges: [StoryEdge] {
        LocalStoryDatabase.edges.filter { $0.fromNode == activeNodeID }
    }

    var body: some View {
        ZStack {
            // Background Theme Controller
            (settings.isDarkMode ? Color.black : Color.white)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Top Interactive Trace Header Bar
                HStack {
                    Text("ASSIGNED_NODE_ID:// \(activeNodeID)")
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
                
                // Narrative Main Text Terminal
                ScrollView {
                    if let currentNode = LocalStoryDatabase.nodes[activeNodeID] {
                        Text(currentNode.narrativeText)
                            .font(.system(size: settings.fontSize, weight: .medium, design: .monospaced))
                            .foregroundColor(settings.isDarkMode ? .white : .black)
                            .lineSpacing(6)
                            .padding(24)
                            .horrorGlitch() // Ambient text shudder and red flash modifier
                            .id(activeNodeID) // Triggers smooth redraw animation when text changes
                    } else {
                        // Fallback indicator if navigation lands out of scope
                        Text("ERROR: NODE '\(activeNodeID)' OUTSIDE ASSIGNED ASSIGNMENT SCOPE.")
                            .font(.caption.monospaced())
                            .foregroundColor(.red)
                            .padding(24)
                    }
                }
                
                Spacer()
                
                // Time-Pressure Panic Timer Layout Integration
                // Automatically triggers if your active node data is flagged as "isDanger: true"
                if let node = LocalStoryDatabase.nodes[activeNodeID], node.isDanger && countdownActive {
                    PanicTimerView(totalTime: 7.0) {
                        withAnimation {
                            countdownActive = false
                            
                            // Forced penalty branch destination if timer lapses on your N0 opening scene
                            if activeNodeID == "N0" {
                                activeNodeID = "N1B"
                            }
                            
                            countdownActive = true
                        }
                    }
                    .padding(.bottom, 12)
                }
                
                // Dynamic Choice Button Matrix
                VStack(spacing: 12) {
                    ForEach(currentEdges, id: \.id) { edge in
                        Button(action: {
                            withAnimation {
                                countdownActive = false // Halt current running clock timeline
                                activeNodeID = edge.toNode // Advance active node straight to next choice target string
                                countdownActive = true // Re-arm timer configurations
                            }
                        }) {
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
                }
                .padding(.bottom, 30)
            }
            .blur(radius: showSettings ? 3.0 : 0.0)
            .opacity(settings.overlayBrightness) // Multiplies background brightness dimmer overlay values
            
            // Slide Panel Drawer Customizer Overlays
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
    }
}
