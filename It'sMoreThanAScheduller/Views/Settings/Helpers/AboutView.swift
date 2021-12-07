//
//  AboutView.swift
//  QuotesApp
//
//  Created by Roman Rakhlin on 02.11.2021.
//

import SwiftUI

struct AboutView: View {
    
    var title: String
    var accessibilityTitle: String

    var body: some View {
        Text(title.uppercased())
            .foregroundColor(.secondary)
            .font(.caption)
            .kerning(1)
            .frame(minWidth: 100, maxWidth: .infinity, alignment: .center)
            .accessibility(label: Text(accessibilityTitle))
            .padding(.top)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(title: "💜 the game? share!", accessibilityTitle: "Love the game? share!")
    }
}
