//
//  VenueDetailsModel.swift
//  Civility Optics
//
//  Created by Michael Verges on 11/12/21.
//

import SwiftUI

class VenueDetailsModel: ObservableObject {
  //Model to be used for a particular businesses' main page

  //Grab the placeID and the description of the business
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
  //Function to grab all the current ratings of a business, based on placeID
  private func getRating() {
    NetworkingService.getRating(placeID: placeID) { rating in
    //Checks if there are any ratings
      if let rating = rating {
        DispatchQueue.main.async {
          self.rating = rating
        }
      }
    }
  }
  //Function to grab all current written reviews of a business, based on placeID
  private func getReviews() {
    NetworkingService.getReviews(placeID: placeID) { results in
    //Checks if there are any reviews
      if let results = results {
        DispatchQueue.main.async {
          self.results = results
        }
      }
    }
  }
  //Function to grab details that describe the current business
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
