//
//  UserProfileModel.swift
//  Civility Optics
//
//  Created by Parkaranjot Singh on 9/24/22.
//

import SwiftUI

class UserProfileModel: ObservableObject {
    //Model of what to show on a users profile page

    //We want to show their email and post it
    init(
        email: String
    ) {
      self.email = email
      self.post = Post(user: User())
    }
    func refreshModel() {
        getUser(email:email)
    }
    var email: String
    //Function to grab currently logged-in user's email to post on their profile page
    func getUser(email: String) {
    NetworkingService.getUserDetail(email: email) { result in
        if let result = result {
            DispatchQueue.main.async {
                print(result)
                self.post.user = result.user
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
    
    
    @Published var post:Post
    @Published var results: ReviewsResult = []
//    @Published var newuser : User
}

