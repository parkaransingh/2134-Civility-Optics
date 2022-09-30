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
        self.post = Post(user: User())
        
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
                self.post.user = result.user
            }
        }
    }
    }
    
    @Published var post:Post
//    @Published var newuser : User
}

