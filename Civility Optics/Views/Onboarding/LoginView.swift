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
  @State var accountType = ""
@ObservedObject var model = LoginViewModel()
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text("Login to your Civility Optics account to continue.")
        .multilineTextAlignment(.leading)
        .foregroundColor(.pale)
        
        HStack {
        Text("Account Type:").font(.headline)
            HStack (spacing: 5){
            RadioButtonField(
                id: "Reviewer",
                label: "Reviewer",
                color:.black,
                bgColor: .black,
                isMarked: $accountType.wrappedValue == "Reviewer" ? true : false,
                callback: { selected in
                    self.accountType = selected
                    print("Selected account is: \(selected)")
                }
            )
            RadioButtonField(
                id: "Business",
                label: "Business",
                color:.black,
                bgColor: .black,
                isMarked: $accountType.wrappedValue == "Business" ? true : false,
                callback: { selected in
                    self.accountType = selected
                    print("Selected account is: \(selected)")
                }
            )
        }
        }
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
                    profile(model: UserProfileModel(email:self.email), bModel: BusinessProfileModel(email: ""), accountType: "Reviewer").tabItem {
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
          if(accountType=="" || accountType=="Reviewer") {
              model.login(email: email, password: password)
          } else {
              model.bLogin(email: email, password: password)
          }
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
    
    
    //MARK:- Radio Button Field
    struct RadioButtonField: View {
        let id: String
        let label: String
        let size: CGFloat
        let color: Color
        let bgColor: Color
        let textSize: CGFloat
        let isMarked:Bool
        let callback: (String)->()
        
        init(
            id: String,
            label:String,
            size: CGFloat = 20,
            color: Color = Color.black,
            bgColor: Color = Color.black,
            textSize: CGFloat = 14,
            isMarked: Bool = false,
            callback: @escaping (String)->()
            ) {
            self.id = id
            self.label = label
            self.size = size
            self.color = color
            self.bgColor = bgColor
            self.textSize = textSize
            self.isMarked = isMarked
            self.callback = callback
        }
        
        var body: some View {
            Button(action:{
                self.callback(self.id)
            }) {
                HStack(alignment: .center) {
                    Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
                        .clipShape(Circle())
                        .foregroundColor(self.bgColor)
                    Text(label)
                        .font(Font.system(size: textSize))
                    Spacer()
                }.foregroundColor(self.color)
            }
            .foregroundColor(Color.white)
        }
    }
}
