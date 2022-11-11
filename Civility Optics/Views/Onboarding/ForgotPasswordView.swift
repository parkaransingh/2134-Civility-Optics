//
//  VerifyView.swift
//  Civility Optics
//
//  Created by Alexander Goebel on 11/11/22.
//

import SwiftUI

struct VerifyView: View {
    var email: String
    @ObservedObject var model = RegisterViewModel()
    @State var didVerify: Bool?
    @State private var code: String = ""
    var body: some View {
        // Page 1: Enter Email
        VStack{
            let str =  "Please enter email for account with forgotten password:"
            Text(str)
                .font(.headline)
                .multilineTextAlignment(.leading)
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.pale)
                HStack {
                    TextField("Email", text: $forgotEmail)
                        .foregroundColor(.stone)
                        .keyboardType(.alphabet)
                        .autocapitalization(.none)
                    Spacer()
                }
                .padding(.horizontal)
            }
            Button {
                email = forgotEmail
                model.forgotPassword(email:forgotEmail)
                // need to then navigate to the next page
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.velvet)
                    .overlay(Text("Send Code").foregroundColor(.white))
                    .frame(width: 200, height: 40)
            }
        }
        // Need to navigate between these two "pages"
        // Page 2: Change Password
        VStack{
            let str =  "Verification code has been sent to " + email
            Text(str)
                .font(.headline)
                .multilineTextAlignment(.leading)
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.pale)
                HStack {
                    TextField("Verification Code", text: $code)
                        .foregroundColor(.stone)
                        .keyboardType(.alphabet)
                        .autocapitalization(.none)
                    Spacer()
                }
                .padding(.horizontal)
                
            }
            .frame(width: 200, height: 40)
            VStack(alignment: .leading, spacing: 4) {
                Text("Password")
                    .foregroundColor(.pale)
                    .fontWeight(.semibold)
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.pale)
                    HStack {
                        SecureField("password", text: $password)
                            .foregroundColor(.stone)
                        Spacer()
                    }
                    .padding(.horizontal, 14)
                }
                .frame(height: 40)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text("Confirm Password")
                    .foregroundColor(.pale)
                    .fontWeight(.semibold)
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.pale)
                    HStack {
                        SecureField("confirm", text: $confirm)
                            .foregroundColor(.stone)
                        Spacer()
                    }
                    .padding(.horizontal, 14)
                }
                .frame(height: 40)
                if confirm != password {
                    Text("Passwords do not match").foregroundColor(.red)
                }
            }
            
            Button {
              if (confirm == password) {
                model.updateForgottenPassword(email:email, code:code, newPassword:password)
              }
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.velvet)
                    .overlay(Text("Submit").foregroundColor(.white))
                    .frame(width: 200, height: 40)
            }
            
            NavigationLink(tag: true, selection: $didVerify) {
                WelcomeView()
            } label: {
                EmptyView()
            }.onChange(of: model.verified) { newValue in
                didVerify = newValue
            }
        }
    }
}

// struct VerifyView_Previews: PreviewProvider {
//     static var previews: some View {
//         VerifyView(email: "Blah")
//     }
// }
