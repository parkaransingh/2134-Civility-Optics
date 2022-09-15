//
//  RegisterView.swift
//  Civility Optics
//
//  Created by Michael Verges on 12/4/21.
//additions by Parkarajot Singh on 04/9/22

import SwiftUI

struct RegisterView: View {
  
  @ObservedObject var model = RegisterViewModel()
  
  @State var email: String = ""
  @State var password: String = ""
  @State var confirm: String = ""
  @State var didCreateAccount: Bool?
  @State var name: String = ""
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text("Use your account to view and submit social-justice ratings of local venues.")
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
            TextField("email", text: $email)
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
        VStack(alignment: .leading, spacing: 4) {
          Text("Name")
            .foregroundColor(.pale)
            .fontWeight(.semibold)
          ZStack {
            RoundedRectangle(cornerRadius: 12)
              .foregroundColor(.pale)
            HStack {
                TextField("Name", text: $name)
                .foregroundColor(.stone)
                .keyboardType(.emailAddress)
              Spacer()
            }
            .padding(.horizontal, 14)
          }
          .frame(height: 40)
        }
        
        VStack(alignment: .leading, spacing: 4) {
          Text("Race")
            .foregroundColor(.pale)
            .fontWeight(.semibold)
          ZStack {
            RoundedRectangle(cornerRadius: 12)
              .foregroundColor(.pale)
            HStack {
                Menu("Choose Race") {
                    Text("Asian")
                    Text("Black")
                    Text("White")
                    Text("Native American")
                    Text("Native Hawaiian or other Pacific Islander")
                }
                .foregroundColor(.stone)
                .keyboardType(.emailAddress)
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
          model.register(email: email, password: password, name: name)
      } label: {
        RoundedRectangle(cornerRadius: 20)
          .foregroundColor(.velvet)
          .overlay(Text("Create Account").foregroundColor(.white))
          .frame(height: 60)
      }
    }
    .padding()
    .navigationTitle("Create an Account")
  }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
