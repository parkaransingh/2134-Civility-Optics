//
//  RegisterView.swift
//  Civility Optics
//
//  Created by Michael Verges on 12/4/21.
//additions by Parkarajot Singh on 04/9/22

import SwiftUI

struct BusinessRegisterView: View {
  
  @ObservedObject var model = BusinessRegisterModel()
  
  @State var email: String = ""
  @State var password: String = ""
  @State var business_name: String = ""
  @State var business_addr: String = ""
  @State var business_key: String = ""
  @State var confirm: String = ""
  @State var didCreateAccount: Bool?
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text("Use your account to publish and manage your own business on Civility Optics.")
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
      
        VStack(alignment: .leading, spacing: 4) {
          Text("Confirm Password")
            .foregroundColor(.pale)
            .fontWeight(.semibold)
          ZStack {
            RoundedRectangle(cornerRadius: 12)
              .foregroundColor(.pale)
            HStack {
              SecureField("Search", text: $confirm)
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

      VStack(alignment: .leading, spacing: 4) {
        Text("Business Name")
          .foregroundColor(.pale)
          .fontWeight(.semibold)
        ZStack {
          RoundedRectangle(cornerRadius: 12)
            .foregroundColor(.pale)
          HStack {
            TextField("Search", text: $business_name)
              .foregroundColor(.stone)
              //.keyboardType(.emailAddress)
            Spacer()
          }
          .padding(.horizontal, 14)
        }
        .frame(height: 40)
      }

      VStack(alignment: .leading, spacing: 4) {
        Text("Business Address")
          .foregroundColor(.pale)
          .fontWeight(.semibold)
        ZStack {
          RoundedRectangle(cornerRadius: 12)
            .foregroundColor(.pale)
          HStack {
            TextField("Search", text: $business_addr)
              .foregroundColor(.stone)
              //.keyboardType(.emailAddress)
            Spacer()
          }
          .padding(.horizontal, 14)
        }
        .frame(height: 40)
      }
      Spacer()
      
        
      NavigationLink(tag: true, selection: $didCreateAccount) {
        //SearchView(model: .init())
          TabView {
              SearchView(model: .init()).tabItem {
                        Label("Search Places", systemImage: "magnifyingglass")
                              }
              profile(email: self.$email, password: self.$password).tabItem {
                  Label("Profile", systemImage: "person.circle.fill")
                        }
    
                      }
          
      } label: { 
        EmptyView()
      }.onChange(of: model.success) { newValue in
        didCreateAccount = newValue
      }

      Button { 
        model.register(email: email, password: password, business_key: business_key,
         business_name: business_name, business_addr: business_addr)
      } label: {
        RoundedRectangle(cornerRadius: 20)
          .foregroundColor(.velvet)
          .overlay(Text("Create Business Account").foregroundColor(.white))
          .frame(height: 60)
      }
    }
    .padding()
    .navigationTitle("Create an Business Account")
  }
}
