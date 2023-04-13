//
//  SplashScreenView.swift
//  Zarsal Cumleler
//
//  Created by Özgür Mercan on 12.04.2023.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive =  false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                VStack {
                    Image(systemName: "die.face.5.fill")
                        .font(.system(size: 140))
                        .foregroundColor(.black)
                        .padding(1)
                    Text("Zarsal Cümleler")
                        .font(Font.custom("Basterville-Bold", size: 30))
                        .foregroundColor(.black.opacity(0.80))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}
        struct SplashScreenView_Previews: PreviewProvider {
            static var previews: some View {
                SplashScreenView()
            }
        }
