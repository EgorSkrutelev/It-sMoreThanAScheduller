//
//  LoginView.swift
//  It'sMoreThanAScheduller
//
//  Created by Николай Циминтия on 06.12.2021.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            Color(CGColor(red: 0.79, green: 0.84, blue: 0.93, alpha: 1.00))
                .ignoresSafeArea()
            VStack {
                Text("")
                    .padding()
                Image("itmo_horiz_white_eng")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                IdentifierTextField()
                PasswordTextField()
                LoginButton()

                
            }.padding()
        }
    }
}

struct IdentifierTextField: View {
    @State var text = ""
    
    var body: some View {
        TextField(" ISU ID", text: $text)
            .padding()
            .background()
            .frame(width: 300, height: nil, alignment: .center)
            .cornerRadius(25)
    }
    
}

struct PasswordTextField: View {
    @State var text = ""
    
    var body: some View {
        SecureField("Password", text: $text, prompt: nil)
            .padding()
            .background()
            .frame(width: 300, height: nil, alignment: .center)
            .cornerRadius(25)
    }
    
}

struct LoginButton: View {
    
    var body: some View {
        Button("Log in") {
            print("lol")
        }
        .frame(width: 100, height: 40, alignment: .center)
        .background(Color.red)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
}
