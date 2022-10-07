//
//  LoginViewModel.swift
//  Civility Optics
//
//  Created by Michael Verges on 12/4/21.
//

import SwiftUI

class LoginViewModel: ObservableObject {
  //Function to login in a user/business
    func login(email: String, password: String) {
    //Submit inputted email and password into the ExpressJS
    NetworkingService.login(email: email, password: password) { result in
      //Check token and see if login was successful
      AuthService.current.token = result?.token
      DispatchQueue.main.async {
          self.success = true
      }
     }
    }

@Published var success: Bool?
}
