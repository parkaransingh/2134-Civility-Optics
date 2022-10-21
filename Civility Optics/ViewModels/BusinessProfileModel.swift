//
//  UserProfileModel.swift
//  Civility Optics
//
//  Created by Parkaranjot Singh on 9/24/22.
//

import SwiftUI

class BusinessProfileModel: ObservableObject {
    init(
        email: String
    ) {
      self.email = email
      self.post = bPost(business: Business())
    }
    func refreshModel() {
        getBusiness(email:email)
    }
    var email: String
    
    func getBusiness(email: String) {
    NetworkingService.getBusinessDetail(email: email) { result in
        if let result = result {
            DispatchQueue.main.async {
                print(result)
                self.post.business = result.business
            }
        }
    }   
    }
    
    
    @Published var post:Post
    @Published var results: ReviewsResult = []
}