//
//  ProfileView.swift
//  It'sMoreThanAScheduller
//
//  Created by Roman Rakhlin on 08.12.2021.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        VStack {
            Text("Профиль")
                .font(.system(size: 34, weight: .heavy, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }
        ScrollView {
            HStack {
                Spacer()
                VStack {
                    Image("book")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                    Text("Байков Иван")
                    Text("666777")
                }
                Spacer()
            }
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                Text("Additional Info:")
                Text("balblblalblabllbalblalblla")
            }
            .padding(.horizontal, 20)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
