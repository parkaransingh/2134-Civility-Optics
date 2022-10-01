//
//  BusinessRegisterViewModel.swift
//  Civility Optics
//
//  Created by Michael Verges on 12/4/21.
//

import SwiftUI

class BusinessRegisterViewModel: ObservableObject {
  
  func register(email: String, password: String, business_key: String, business_name: String, business_addr: String) {
    NetworkingService.register(email: email, password: password, business_key: String, business_name: business_name, business_addr: business_addr) { result in
      AuthService.current.token = result?.token
      DispatchQueue.main.async {
        self.success = true
      }
    }
  }
  
  @Published var success: Bool?
}
