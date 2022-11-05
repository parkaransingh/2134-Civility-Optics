//
//  BusinessPreferences.swift
//  Civility Optics
//
//  Created by Michael Verges on 12/4/21.
//additions by Parkarajot Singh on 04/9/22

import SwiftUI

struct BusinessPreferences: View {
    var model = VenueDetailsModel(placeID: self.place_id, description: self.description)
    
    var originalEmail: String
    @State var newDescription = ""

    var body: some View {
      VStack(alignment: .leading, spacing: 4) {
        VenueDetails(model: .init(placeID: result.place_id, description: self.description), email: self.email)
        Spacer()
        TextField("Change your business page description here.",
        text: $newDescription
        )
      .onSubmit {
        model.businessUpdate(email: self.email, password: self.password, business_key: self.business_key, business_name: self.business_name, business_addr: self.business_addr, business_description: newDescription, token: self.description, AuthService.current.token ?? "")
        //refresh page here
        model.refreshModel()
      }

  }
}
