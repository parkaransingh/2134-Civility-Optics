//
//  BusinessPreferences.swift
//  Civility Optics
//
//  Created by Michael Verges on 12/4/21.
//additions by Parkarajot Singh on 04/9/22

import SwiftUI

struct BusinessPreferences: View {
    var email: String
    var bModel = BusinessProfileModel(email: email)
    var rModel = RegisterViewModel()
    var model = VenueDetailsModel(placeID: bModel.bpost.business.business_key, description: bModel.bpost.business.business_description)
    @State var newDescription = ""

    var body: some View {
      VStack(alignment: .leading, spacing: 4) {
        VenueDetails(model: .init(placeID: result.place_id, description: bModel.bpost.business.business_description), email: self.email)
        Spacer()
        TextField("Change your business page description here.",
        text: $newDescription
        )
      .onSubmit {
        rModel.businessUpdate(email: self.email, password: self.password, business_key: self.business_key, business_name: self.business_name, business_addr: self.business_addr, business_description: newDescription, token: self.description, AuthService.current.token ?? "")
        //refresh page here
        bModel.refreshModel()
      }
    }
  }
}
