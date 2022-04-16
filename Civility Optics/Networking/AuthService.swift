//
//  AuthService.swift
//  Civility Optics
//
//  Created by Michael Verges on 12/4/21.
//

import Foundation

class AuthService {
  static var current = AuthService()
  var token: String? = nil
}
