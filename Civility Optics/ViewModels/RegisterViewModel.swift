//
//  RegisterViewModel.swift
//  Civility Optics
//
//  Created by Michael Verges on 12/4/21.
//

import SwiftUI

class RegisterViewModel: ObservableObject {
  
    func register(email: String, password: String, name: String, race: String, disability: String, gender: String ) {
        NetworkingService.register(email: email, password: password, name: name, race: race, disability: disability, gender: gender) { result in
      AuthService.current.token = result?.token
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
