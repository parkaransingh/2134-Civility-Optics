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
      self.bpost = bPost(business: Business())
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
                //self.bPost.business = result.business
                self.bpost.business = result.business
            }
        }
    }   
    }
    
    
    @Published var bpost:bPost
    @Published var results: ReviewsResult = []
}