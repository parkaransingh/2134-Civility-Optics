//
//  WelcomeView.swift
//  Civility Optics
//
//  Created by Michael Verges on 12/4/21.
//

import SwiftUI

struct WelcomeView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      
      Spacer()
      
      VStack(alignment: .leading, spacing: 4) {
        Text("Welcome to")
        Text("Civility Optics")
          .foregroundColor(.velvet)
      }
      .font(.system(size: 34, weight: .bold))
      .padding(.vertical)
      
      Text("Be a part of the solution.")
        .foregroundColor(.pale)
      
      Spacer()
      Spacer()
      
      NavigationLink { 
        RegisterView()
      } label: { 
        RoundedRectangle(cornerRadius: 20)
          .foregroundColor(.velvet)
          .overlay(Text("Create Account").foregroundColor(.white))
      }
      .frame(height: 60)
      
      NavigationLink { 
          LoginView()
      } label: {
        HStack {
          Spacer()
          Text("Login to existing account.")
            .foregroundColor(.velvet)
          Spacer()
        }
      }
      .frame(height: 40)
    }
    .padding()
  }
}

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView()
  }
}
