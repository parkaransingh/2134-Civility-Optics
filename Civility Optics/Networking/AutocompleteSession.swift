//
//  AutocompleteSession.swift
//  Civility Optics
//
//  Created by Michael Verges on 10/10/21.
//

import Foundation

class AutocompleteSession {
  static var current = AutocompleteSession()
  
  private init() { }
  
  private var uuid: UUID?
  
  func getSessionToken() -> String {
    if let uuid = uuid {
      return uuid.uuidString
    }
    
    return startSession().uuidString
  }
  
  func endSession() {
    uuid = nil
  }
  
  func startSession() -> UUID {
    let token = UUID()
    uuid = token
    return token
  }
}
