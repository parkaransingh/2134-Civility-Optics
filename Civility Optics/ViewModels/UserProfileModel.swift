//
//  UserProfileModel.swift
//  Civility Optics
//
//  Created by Parkaranjot Singh on 9/24/22.
//

import SwiftUI

class UserProfileModel: ObservableObject {
    init(
        email: String
    ) {
      self.email = email
      self.post = User()
    }
    func refreshModel() {
        getUser(email:email)
    }
    var email: String
    
    func getUser(email: String) {
    NetworkingService.getUserDetail(email: email) { result in
        if let result = result {
            DispatchQueue.main.async {
                print(result)
                self.post = result
            }
        }
    }
        NetworkingService.getReviewsUser(email: self.email) { results in
          if let results = results {
            DispatchQueue.main.async {
              self.results = results
            }
          }
        }
        
    }
    
    
//    func getUserReviews() {
//     print("started")
//    }
    
    
    @Published var post:User
    @Published var results: ReviewsResult = []
//    @Published var newuser : User
}

