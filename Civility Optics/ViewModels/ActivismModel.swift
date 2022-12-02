//
//  ActivismModel.swift
//  Civility Optics
//
//  Created by Parkaranjot Singh on 11/26/22.
//

import SwiftUI

class ActivismModel: ObservableObject {
    init(
        title: String
    ) {
      self.title = title
      self.post = PostActivism(activism: ActivismResult(title: "", displayTitle: "", description: "", tips: "", resources: ""))
    }
    func refreshModel() {
        getActivism(title:title)
    }
    var title: String
    
func getActivism(title: String) {
    NetworkingService.getActivism(title: title) { result in
        if let result = result {
            DispatchQueue.main.async {
                self.post = result
            }
        }
    }
}
    
    
//    func getUserReviews() {
//     print("started")
//    }
    
    
    @Published var post:PostActivism
//    @Published var results: ReviewsResult = []
//    @Published var newuser : User
}


