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
  
  @Published var success: Bool?
}
