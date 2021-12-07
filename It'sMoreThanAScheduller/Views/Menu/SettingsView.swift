//
//  SettingsView.swift
//  It'sMoreThanAScheduller
//
//  Created by Roman Rakhlin on 08.12.2021.
//

import SwiftUI
import MessageUI

struct SettingsView: View {
    
    @ObservedObject var settingsViewModel = SettingsViewModel()

    var body: some View {
        VStack {
            Text("Настройки")
                .font(.system(size: 34, weight: .heavy, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }
        
        ScrollView {
        
            // MARK: - Feedback
            VStack {
                // Share
                SettingsRow(imageName: "square.and.arrow.up", title: "Tell friends") {
                    self.settingsViewModel.showShareSheet = true
                }

                // Rate App
                SettingsRow(imageName: "star.square", title: "Write a review") {
                    self.settingsViewModel.writeReview()
                }
                    
                // Request New Feature
                SettingsRow(imageName: "wand.and.stars", title: "Feature request") {
                }
                    
                // Report A Bug
                SettingsRow(imageName: "tornado", title: "Report a bug") {
                }

                // App Version
                AppVersionRow(imageName: "info.circle", title: "App version", version: settingsViewModel.appVersion)
            }
            .settingsBackground()

            // MARK: - About Company
            VStack {
                // More Apps
                SettingsRow(imageName: "apps.iphone", title: "More Apps") {
                }

                // Link To Website
                SettingsRow(imageName: "arrow.up.forward", title: "About Us", action: {
                    self.settingsViewModel.showCreditsView = true
                })
            }
            .settingsBackground()
            
            AboutView(title: "❤️ приложуху? делитесь с друзьями!!", accessibilityTitle: "MADE WITH ❤️ BY TWO NICKSSSSSSSSSS")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
