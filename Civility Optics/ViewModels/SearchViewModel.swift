//
//  SearchViewModel.swift
//  Civility Optics
//
//  Created by Michael Verges on 10/1/21.
//

import SwiftUI

class SearchViewModel: ObservableObject {
  
  func generateResults(for query: String, sessionID: String) {
    NetworkingService.searchResults(
      query: query, sessionID: sessionID) { results in
        if let results = results {
          DispatchQueue.main.async {
            self.results = results
          }
        }
      }
  }
  
  @Published var results: [AutocompleteResult.Prediction] = []
}
