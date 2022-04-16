//
//  RegisterViewModel.swift
//  Civility Optics
//
//  Created by Michael Verges on 12/4/21.
//

import SwiftUI

class RegisterViewModel: ObservableObject {
  
  func register(email: String, password: String) {
    NetworkingService.register(email: email, password: password) { result in
      AuthService.current.token = result?.token
      DispatchQueue.main.async {
        self.success = true
      }
    }
  }
  
  @Published var success: Bool?
}
