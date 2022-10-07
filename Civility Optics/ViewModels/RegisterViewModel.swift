//
//  RegisterViewModel.swift
//  Civility Optics
//
//  Created by Michael Verges on 12/4/21.
//

import SwiftUI

class RegisterViewModel: ObservableObject {
    //This function will take in data when registering a user account and send it to the ExpressJS
    func register(email: String, password: String, name: String, race: String, disability: String, gender: String ) {
      //Will send the data to the database to create new user account
        NetworkingService.register(email: email, password: password, name: name, race: race, disability: disability, gender: gender) { result in
      //Gets the authentication token and sees if registration was successful
      AuthService.current.token = result?.token
      //Does the check for the authentication token status
      DispatchQueue.main.async {
        self.success = true
      }
    }
  }

  func businessRegister(email: String, password: String, business_key: String, business_name: String, business_addr: String) {
    print("bRegister started for ", email)
    NetworkingService.businessRegister(email: email, password: password, business_key: business_key, business_name: business_name, business_addr: business_addr) { result in
      AuthService.current.token = result?.token
      DispatchQueue.main.async {
        self.success = true
      }
    }
  }
  
  @Published var success: Bool?
}
