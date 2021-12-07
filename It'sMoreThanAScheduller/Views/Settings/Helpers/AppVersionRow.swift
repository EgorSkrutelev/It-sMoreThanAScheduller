//
//  AppVersionRow.swift
//  QuotesApp
//
//  Created by Roman Rakhlin on 02.11.2021.
//

import SwiftUI

struct AppVersionRow: View {
    
    var imageName: String
    var title: String
    var version: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: imageName)
                .font(.headline)
                .frame(minWidth: 25, alignment: .leading)
                .accessibility(hidden: true)
                .foregroundColor(.blue)
            
            Text(title)
                .font(.system(size: 18, weight: .medium, design: .rounded))
            
            Spacer()
            
            Text(version)
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .bold()
        }
        .accessibilityElement(children: .combine)
        .padding(.vertical, 10)
        .foregroundColor(.primary)
    }
}

struct AppVersionRow_Previews: PreviewProvider {
    static var previews: some View {
        AppVersionRow(imageName: "info.circle", title: "App version", version: "2.0")
    }
}
