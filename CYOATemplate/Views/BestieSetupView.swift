//
//  SwiftUIView.swift
//  CYOATemplate
//
//  Created by xinyu zhang on 2026-05-24.
//

import SwiftUI

struct BestieSetupView: View {
    
    @Binding var bestieName: String
    @State private var inputName = ""
    
    var body: some View {
        VStack(spacing: 25) {
            
            Spacer()
            
            Text("Enter your best friend's name")
                .font(.title2)
                .foregroundColor(.white)
            
            TextField("Name", text: $inputName)
                .padding()
                .background(Color.white.opacity(0.12))
                .cornerRadius(12)
                .foregroundColor(.white)
                .padding(.horizontal, 40)
            
            Button("CONTINUE") {
                let trimmedName = inputName.trimmingCharacters(in: .whitespaces)
                
                if !trimmedName.isEmpty {
                    bestieName = trimmedName
                }
            }
            .frame(width: 200, height: 50)
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(12)
            
            Spacer()
        }
        .background(Color.black)
        .ignoresSafeArea()
    }
}
