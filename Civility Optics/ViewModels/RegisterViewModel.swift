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
  
  @Published var success: Bool?
}
