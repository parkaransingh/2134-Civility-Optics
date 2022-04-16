//
//  Civility_OpticsApp.swift
//  Civility Optics
//
//  Created by Michael Verges on 4/16/21.
//

import SwiftUI

@main
struct Civility_OpticsApp: App {
  let persistenceController = PersistenceController.shared
  
  var body: some Scene {
    WindowGroup {
      NavigationView {
        WelcomeView() 
      }
      .accentColor(.velvet)
    }
  }
}
