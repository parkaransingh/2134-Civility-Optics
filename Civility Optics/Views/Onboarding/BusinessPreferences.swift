//
//  BusinessPreferences.swift
//  Civility Optics
//
//  Created by Michael Verges on 12/4/21.
//additions by Parkarajot Singh on 04/9/22

import SwiftUI

struct BusinessPreferences: View {
    @ObservedObject var bModel: BusinessProfileModel
    var rModel = RegisterViewModel()
    @State var newDescription = ""

    var body: some View {
      VStack(alignment: .leading, spacing: 4) {
          let s1 = "Business Name: " + (bModel.bpost.business.business_name ?? "")
          let s2 = "Business Address: " + (bModel.bpost.business.business_addr ?? "")
          let s3 = "Business Description: " + (bModel.bpost.business.business_description ?? "")
          
          VStack{
              HStack{
                  Text(s1)
                      .font(.custom(
                        "FontNameRound",
                        fixedSize: 18))
                      .fixedSize(horizontal: false, vertical: true)
                      .multilineTextAlignment(.center)
                      .padding()
                      .frame(width: 400, height: 200)
                      .background(Rectangle().fill(Color.red).shadow(radius: 6))
                      .scaledToFit()
              }
              HStack{
                  Text(s2)
                      .font(.custom(
                        "FontNameRound",
                        fixedSize: 18))
                      .fixedSize(horizontal: false, vertical: true)
                      .multilineTextAlignment(.center)
                      .padding()
                      .frame(width: 400, height: 200)
                      .background(Rectangle().fill(Color.blue).shadow(radius: 6))
                      .scaledToFit()
              }
              HStack{
                  Text(s3)
                      .font(.custom(
                        "FontNameRound",
                        fixedSize: 18))
                      .fixedSize(horizontal: false, vertical: true)
                      .multilineTextAlignment(.center)
                      .padding()
                      .frame(width: 400, height: 200)
                      .background(Rectangle().fill(Color.yellow).shadow(radius: 6))
                      .scaledToFit()
              }
              Spacer()
              if #available(iOS 15.0, *) {
                  TextField("Change your business page description here:",
                            text: $newDescription
                  )
                  
                  Button {
                      print(newDescription)
                      
                      rModel.businessUpdate(email: bModel.bpost.business.email ?? "", business_key: bModel.bpost.business.business_key ?? "", business_name: bModel.bpost.business.business_name ?? "", business_addr: bModel.bpost.business.business_addr ?? "", business_description: newDescription ?? "", token: AuthService.current.token ?? "")
                      bModel.refreshModel()
                  } label: {
                      RoundedRectangle(cornerRadius: 20)
                          .foregroundColor(.velvet)
                          .overlay(Text("Update Description").foregroundColor(.white))
                          .frame(height: 60)
                      
                  }
                  
              } else {
                  // Fallback on earlier versions
              }
          }
    }
  }
}
