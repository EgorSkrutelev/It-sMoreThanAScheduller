//
//  SettingsRow.swift
//  QuotesApp
//
//  Created by Roman Rakhlin on 02.11.2021.
//

import SwiftUI

struct SettingsRow: View {
    
    var imageName: String
    var title: String
    var action: (()->()) = {}

    var body: some View {
        Button(action: {
            self.action()
            FeedbackManager.mediumFeedback()
        }) {
            HStack(spacing: 8) {
                Image(systemName: imageName)
                    .font(.headline)
                    .frame(minWidth: 25, alignment: .leading)
                    .accessibility(hidden: true)
                    .foregroundColor(.blue)
                
                Text(title)
                    .kerning(1)
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.blue)
            }
            .padding(.vertical, 10)
            .foregroundColor(.primary)
        }
        .customHoverEffect()
    }
}

struct SettingsRow_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRow(imageName: "wand.and.stars", title: "Feature request")
    }
}
