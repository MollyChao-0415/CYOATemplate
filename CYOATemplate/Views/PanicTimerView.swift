//
//  PanicTimerView.swift
//  CYOATemplate
//
//  Created by Yuk Tung Chao on 2026-05-24.
//

import SwiftUI

struct PanicTimerView: View {
    let totalTime: Double
    var onTimeExpired: () -> Void
    
    @State private var timeRemaining: Double
    @State private var isUrgent: Bool = false
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    init(totalTime: Double, onTimeExpired: @escaping () -> Void) {
        self.totalTime = totalTime
        self._timeRemaining = State(initialValue: totalTime)
        self.onTimeExpired = onTimeExpired
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
            }
            .foregroundColor(isUrgent ? .red : .orange)
            
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 5)
                    Capsule()
                        .fill(isUrgent ? Color.red : Color.orange)
                        .frame(width: geo.size.width * CGFloat(timeRemaining / totalTime), height: 5)
                        .animation(.linear(duration: 0.1), value: timeRemaining)
                }
            }
            .frame(height: 5)
        }
        .padding(.horizontal, 24)
        .onReceive(timer) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 0.1
                if timeRemaining <= 3.0 { isUrgent = true }
            } else {
                timer.upstream.connect().cancel()
                onTimeExpired()
            }
        }
    }
}
