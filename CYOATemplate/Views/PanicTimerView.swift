////
////  PanicTimerView.swift
////  CYOATemplate
////
////  Created by Yuk Tung Chao on 2026-05-24.
////


import SwiftUI

struct PanicTimerView: View {
    
    let totalTime: Double
    let onTimeExpired: () -> Void
    
    @State private var timeRemaining: Double
    @State private var hasExpired = false
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    init(totalTime: Double, onTimeExpired: @escaping () -> Void) {
        self.totalTime = totalTime
        self.onTimeExpired = onTimeExpired
        _timeRemaining = State(initialValue: totalTime)
    }
    
    private var progress: CGFloat {
        guard totalTime > 0 else { return 0 }
        return CGFloat(max(0, min(1, timeRemaining / totalTime)))
    }
    
    private var isUrgent: Bool {
        timeRemaining <= 3.0
    }
    
    var body: some View {
        VStack(spacing: 6) {
            HStack {
                Text("WARNING: ENVIRONMENT UNSTABLE — CHOOSE")
                    .font(.caption.monospaced())
                    .fontWeight(.bold)
                
                Spacer()
                
                Text(String(format: "%.1fs", max(0, timeRemaining)))
                    .font(.caption.monospaced())
                    .fontWeight(.bold)
            }
            .foregroundColor(isUrgent ? .red : .orange)
            
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.gray.opacity(0.25))
                        .frame(height: 5)
                    
                    Capsule()
                        .fill(isUrgent ? Color.red : Color.orange)
                        .frame(width: geo.size.width * progress, height: 5)
                        .animation(.linear(duration: 0.1), value: progress)
                }
            }
            .frame(height: 5)
        }
        .padding(.horizontal, 24)
        .onReceive(timer) { _ in
            guard !hasExpired else { return }
            
            if timeRemaining > 0 {
                timeRemaining -= 0.1
            } else {
                hasExpired = true
                onTimeExpired()
            }
        }
    }
}
