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
    //var model = VenueDetailsModel(placeID: bModel.bpost.business.business_key, description: bModel.bpost.business.business_description)
    @State var newDescription = ""

    var body: some View {
      VStack(alignment: .leading, spacing: 4) {
          VenueDetails(model: .init(placeID: bModel.bpost.business.business_key ?? "", description: bModel.bpost.business.business_description ?? ""), email: bModel.bpost.business.email ?? "")
        Spacer()
        TextField("Change your business page description here.",
        text: $newDescription
        )
          Button {
              rModel.businessUpdate(email: self.bModel.bpost.business.email ?? "", business_key: self.bModel.bpost.business.business_key ?? "", business_name: self.bModel.bpost.business.business_name ?? "", business_addr: self.bModel.bpost.business.business_addr ?? "", business_description: newDescription, token: AuthService.current.token ?? "")
            //refresh page here
            bModel.refreshModel()
          } label: {
              Text("Press Me")
                  .padding(20)
          }
          .contentShape(Rectangle())
    }
  }
}
