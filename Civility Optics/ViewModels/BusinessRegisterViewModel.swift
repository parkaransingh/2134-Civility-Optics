//
//  BusinessRegisterViewModel.swift
//  Civility Optics
//
//  Created by Michael Verges on 12/4/21.
//

import SwiftUI

class BusinessRegisterViewModel: ObservableObject {
  
  func bRegister(email: String, password: String, business_key: String, business_name: String, business_addr: String) {
    print("bRegister started for ", email)
    NetworkingService.businessRegister(email: email, password: password, business_key: business_key, business_name: business_name, business_addr: business_addr) { result in
      AuthService.current.token = result?.token
      DispatchQueue.main.async {
        self.success = true
      }
    }
    print("bRegister ended for ", email)
  }
  
  func taskButton() {
    print("businessModel entered creation")
  }

  @Published var success: Bool?

}

