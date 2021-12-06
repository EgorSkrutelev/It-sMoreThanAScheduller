//
//  MenuView.swift
//  It'sMoreThanAScheduller
//
//  Created by Roman Rakhlin on 25.11.2021.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("333206")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 100)
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Помощь")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
                .padding(.top, 30)
            HStack {
                Image(systemName: "gear")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Настройки")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 30)
            Spacer()
        }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.black)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
