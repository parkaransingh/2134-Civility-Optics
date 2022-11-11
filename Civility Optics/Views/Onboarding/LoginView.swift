//
//  LoginView.swift
//  Civility Optics
//
//  Created by Michael Verges on 12/4/21.
//

import SwiftUI

struct LoginView: View {
  
 
  @State var email: String = ""
  @State var password: String = ""
  @State var didLogin: Bool?
@ObservedObject var model = LoginViewModel()
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text("Login to your Civility Optics account to continue.")
        .multilineTextAlignment(.leading)
        .foregroundColor(.pale)
      
      VStack(alignment: .leading, spacing: 4) {
        Text("Email")
          .foregroundColor(.pale)
          .fontWeight(.semibold)
        ZStack {
          RoundedRectangle(cornerRadius: 12)
            .foregroundColor(.pale)
          HStack {
            TextField("Search", text: $email)
              .foregroundColor(.stone)
              .keyboardType(.emailAddress)
            Spacer()
          }
          .padding(.horizontal, 14)
        }
        .frame(height: 40)
      }
      
      VStack(alignment: .leading, spacing: 4) {
        Text("Password")
          .foregroundColor(.pale)
          .fontWeight(.semibold)
        ZStack {
          RoundedRectangle(cornerRadius: 12)
            .foregroundColor(.pale)
          HStack {
            SecureField("Search", text: $password)
              .foregroundColor(.stone)
            Spacer()
          }
          .padding(.horizontal, 14)
        }
        .frame(height: 40)
      }
      
      Spacer()
      NavigationLink(tag: true, selection: $didLogin) {
                TabView {
                    SearchView(model: .init(), email:self.email).tabItem {
                              Label("Search Places", systemImage: "magnifyingglass")
                                    }
                    profile(model: UserProfileModel(email:self.email)).tabItem {
                        Label("Profile", systemImage: "person.circle.fill")
                    }
                    ActivismView().tabItem {
                        Label("Activism", systemImage: "person.circle.fill")
                    }
          
                }
                
        //SearchView(model: .init())s
      } label: { 
        EmptyView()
      }.onChange(of: model.success) { newValue in
        didLogin = newValue
      }

      Button { 
        model.login(email: email, password: password)
      } label: {
        RoundedRectangle(cornerRadius: 20)
          .foregroundColor(.velvet)
          .overlay(Text("Login").foregroundColor(.white))
          .frame(height: 60)
      }
    }
    .padding()
    .navigationTitle("Login")
  }
}
