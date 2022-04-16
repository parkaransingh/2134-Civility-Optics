//
//  VenueDetailsModel.swift
//  Civility Optics
//
//  Created by Michael Verges on 11/12/21.
//

import SwiftUI

class VenueDetailsModel: ObservableObject {
  
  init(
    placeID: String,
    description: String
  ) {
    self.placeID = placeID
    self.description = description
  }
  
  var placeID: String
  var description: String
  
  func refreshModel() {
    getRating()
    getDetails()
    getReviews()
  }
  
  private func getRating() {
    NetworkingService.getRating(placeID: placeID) { rating in
      if let rating = rating {
        DispatchQueue.main.async {
          self.rating = rating
        }
      }
    }
  }
  
  private func getReviews() {
    NetworkingService.getReviews(placeID: placeID) { results in
      if let results = results {
        DispatchQueue.main.async {
          self.results = results
        }
      }
    }
  }
  
  private func getDetails() {
    
    // Only fetch this once.
    guard details == nil else { return }
    
    NetworkingService.getPlaceDetails(
      placeID: placeID,
      sessionID: AutocompleteSession.current.getSessionToken()
    ) { details in
      AutocompleteSession.current.endSession()
      if let details = details {
        DispatchQueue.main.async {
          self.details = details
        }
      }
    }
  }
  
  @Published var rating: Double? = nil
  @Published var results: ReviewsResult = []
  @Published var details: PlaceDetailsResult.Place? = nil
}
