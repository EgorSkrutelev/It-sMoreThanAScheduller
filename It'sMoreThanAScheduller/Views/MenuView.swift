//
//  MenuView.swift
//  It'sMoreThanAScheduller
//
//  Created by Roman Rakhlin on 25.11.2021.
//

import SwiftUI

struct MenuView: View {
    
    @State private var showProfile = false
    @State private var showFAQ = false
    @State private var showSettings = false
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Button(action: {
                    showProfile.toggle()
                    
                    // some haptic thing
                    let impactMed = UIImpactFeedbackGenerator(style: .light)
                    impactMed.impactOccurred()
                }) {
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        Text("Профиль")
                    }
                }
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .foregroundColor(.white)
                .sheet(isPresented: $showProfile) {
                    ProfileView()
                }
                
                Button(action: {
                    showFAQ.toggle()
                    
                    // some haptic thing
                    let impactMed = UIImpactFeedbackGenerator(style: .light)
                    impactMed.impactOccurred()
                }) {
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        Text("FAQ")
                    }
                }
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .foregroundColor(.white)
                .sheet(isPresented: $showFAQ) {
                    FAQView()
                }
                
                Button(action: {
                    showSettings.toggle()
                    
                    // some haptic thing
                    let impactMed = UIImpactFeedbackGenerator(style: .light)
                    impactMed.impactOccurred()
                }) {
                    HStack {
                        Image(systemName: "gear")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        Text("Настройки")
                    }
                }
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .foregroundColor(.white)
                .sheet(isPresented: $showSettings) {
                    SettingsView()
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
