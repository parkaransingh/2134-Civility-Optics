//
//  LoginViewModel.swift
//  Civility Optics
//
//  Created by Michael Verges on 12/4/21.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    func login(email: String, password: String) {
    NetworkingService.login(email: email, password: password) { result in
      AuthService.current.token = result?.token
      DispatchQueue.main.async {
          self.success = true
      }
    }
    }

    func bLogin(email: String, password: String) {
    NetworkingService.bLogin(email: email, password: password) { result in
      AuthService.current.token = result?.token
      DispatchQueue.main.async {
          self.success = true
      }
    }
    }
@Published var success: Bool?
}
