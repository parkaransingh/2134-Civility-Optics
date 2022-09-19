//
//  RegisterViewModel.swift
//  Civility Optics
//
//  Created by Michael Verges on 12/4/21.
//

import SwiftUI

class RegisterViewModel: ObservableObject {
  
    func register(email: String, password: String, name: String, race: String) {
        NetworkingService.register(email: email, password: password, name: name, race: race) { result in
      AuthService.current.token = result?.token
      DispatchQueue.main.async {
        self.success = true
      }
    }
  }
  
  @Published var success: Bool?
}
