//
//  VerifyView.swift
//  Civility Optics
//
//  Created by Parkaranjot Singh on 11/6/22.
//

import SwiftUI

struct VerifyView: View {
    var email: String
    @ObservedObject var model = RegisterViewModel()
    @State var didVerify: Bool?
    @State private var code: String = ""
    var body: some View {
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
                    Spacer()
                }
                .padding(.horizontal)
                
            }
            .frame(width: 200, height: 40)
            
            Button {
                model.verifyCode(code:code)
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.velvet)
                    .overlay(Text("Submit").foregroundColor(.white))
                    .frame(width: 200, height: 40)
            }
            
            NavigationLink(tag: true, selection: $didVerify) {
                TabView {
                    SearchView(model: .init(), email: email).tabItem {
                        Label("Search Places", systemImage: "magnifyingglass")
                    }
                    profile(model: UserProfileModel(email: self.email)).tabItem {
                        Label("Profile", systemImage: "person.circle.fill")
                    }
                }
            } label: {
                EmptyView()
            }.onChange(of: model.verified) { newValue in
                didVerify = newValue
            }
        }
    }
}

struct VerifyView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyView(email: "Blah")
    }
}
