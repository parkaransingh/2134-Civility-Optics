//
//  LoginView.swift
//  Civility Optics
//
//  Created by Michael Verges on 12/4/21.
//

import SwiftUI

struct LoginView: View {
  
  @ObservedObject var model = LoginViewModel()
  
  @State var email: String = ""
  @State var password: String = ""
  @State var didLogin: Bool?
  
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
                    SearchView(model: .init()).tabItem {
                              Label("Search Places", systemImage: "magnifyingglass")
                                    }
                    profile(email: self.$email, password: self.$password).tabItem {
                        Label("Profile", systemImage: "person.circle.fill")
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

import SwiftUI
struct profile: View {

    @Environment(\.presentationMode) var presentationMode
    @Binding var email: String
    @Binding var password: String
    var body: some View {
        //results.navigationBarTitle("Profile")
        VStack{
            HStack{
            Text("LoginID: ").foregroundColor(.blue)
                    .fontWeight(.semibold)
                Text(email).foregroundColor(.blue)
                    .fontWeight(.semibold)
                
            
            }
            HStack{
                Text("Password: ").foregroundColor(.blue)
                    .fontWeight(.semibold)
                Text(password).foregroundColor(.blue)
                    .fontWeight(.semibold)
            }
            HStack{
                Text("Number of Reviews:").foregroundColor(.blue)
                    .fontWeight(.semibold)
                Text("0").foregroundColor(.pale)
                    .fontWeight(.semibold)
                    
                
            }
        Spacer()
//        Button(action: {
//            presentationMode.wrappedValue.dismiss()
//        }){
//            Text("logout")
//                .fontWeight(.semibold)
//                .padding()
//                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.red))
//
//        }.frame(minWidth: 600, minHeight: 100)
            NavigationLink {
              WelcomeView()
            } label: {
              RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.yellow)
                .overlay(Text("Logout").foregroundColor(.white))
            }
            .frame(height: 60)
    
        }
    }

//var title: some View {
//        NavigationView {
//
//        }.navigationBarTitle(Text("Profile"))
//    }
}
