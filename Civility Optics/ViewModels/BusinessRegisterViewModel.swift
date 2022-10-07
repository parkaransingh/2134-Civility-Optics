//
//  BusinessRegisterViewModel.swift
//  Civility Optics
//
//  Created by Michael Verges on 12/4/21.
//

import SwiftUI

class BusinessRegisterViewModel: ObservableObject {
  //This function will take in data when registering a business account and send it to the ExpressJS
  func register(email: String, password: String, business_key: String, business_name: String, business_addr: String) {
    //Will send the data to the database to create new business account
    NetworkingService.register(email: email, password: password, business_key: String, business_name: business_name, business_addr: business_addr) { result in
      //Gets the authentication token and sees if registration was successful
      AuthService.current.token = result?.token
      //does the check for the authentication token status
      DispatchQueue.main.async {
        self.success = true
      }
    }
  }
  
  @Published var success: Bool?
}
