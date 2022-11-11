//
//  BusinessPreferences.swift
//  Civility Optics
//
//  Created by Michael Verges on 12/4/21.
//additions by Parkarajot Singh on 04/9/22

import SwiftUI

struct BusinessPreferences: View {
    @ObservedObject var bModel: BusinessProfileModel
    //var email: String
    //var bModel = BusinessProfileModel(email: email??, "")
    var rModel = RegisterViewModel()
    //var model = VenueDetailsModel(placeID: bModel.bpost.business.business_key! ?? <#default value#>! ?? <#default value#>! ?? <#default value#>! ?? <#default value#>!!, description: bModel.bpost.business.business_description ?? <#default value#>)
    @State var newDescription = ""

    var body: some View {
      VStack(alignment: .leading, spacing: 4) {
        //VenueDetails(model: .init(placeID: bModel.bpost.business.business_key, description: bModel.bpost.business.business_description), email: self.email)
          let s1 = "Business Name: " + (bModel.bpost.business.business_name ?? "")
          let s2 = "Business Address: " + (bModel.bpost.business.business_addr ?? "")
          let s3 = "Business Description: " + (bModel.bpost.business.business_description ?? "")
        Text(s1)
        //Spacer()
        Text(s2)
        //Spacer()
        Text(s3)
        Spacer()
          if #available(iOS 15.0, *) {
              TextField("Change your business page description here.",
                        text: $newDescription
              )
              
              Button {
                  print(newDescription)
                  
                  rModel.businessUpdate(email: bModel.bpost.business.email ?? "", business_key: bModel.bpost.business.business_key ?? "", business_name: bModel.bpost.business.business_name ?? "", business_addr: bModel.bpost.business.business_addr ?? "", business_description: newDescription ?? "", token: AuthService.current.token ?? "")
                  //refresh page here
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
