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
    func businessUpdate(email: String, business_key: String, business_name: String, business_addr: String, business_description: String, token: String) {
      print("businessUpdate started for ", email)
        NetworkingService.businessUpdate(email: email, business_key: business_key, business_name: business_name, business_addr: business_addr, business_description: business_description, token: token)
        DispatchQueue.main.async {
          self.success = true
        }
    }
    
    @Published var success: Bool?
    @Published var bpost:bPost
    @Published var results: ReviewsResult = []
}
