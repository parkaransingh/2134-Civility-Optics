//
//  profile.swift
//  Civility Optics
//
//  Created by Parkaranjot Singh on 4/10/22.
//

import SwiftUI
struct profile: View {
    @Environment(\.presentationMode) var presentationMode
    //@ObservedObject var model = LoginViewModel()
//    @Binding var email: String
    @ObservedObject var model : UserProfileModel
    // @ObservedObject var model = UserProfileModel(email: email)
    var body: some View {
        //results.navigationBarTitle("Profile")
//        let _ = print(model)
        VStack{
            HStack{
                
            Text("Welcome: ").foregroundColor(.blue)
    
              Text(self.model.post.user.name ?? "None").foregroundColor(.blue)
////                    .fontWeight(.semibold)
                
            
            }
            
            HStack{
            Text("LoginID: ").foregroundColor(.blue)
                    .fontWeight(.semibold)
                Text(self.model.post.user.email ?? "None").foregroundColor(.blue)
//                Text().foregroundColor(.blue)
//                    .fontWeight(.semibold)
                
            
            }
            HStack{
                Text("Number of Reviews:").foregroundColor(.blue)
                    .fontWeight(.semibold)
                Text("0").foregroundColor(.pale)
                    .fontWeight(.semibold)
                    
            }
        Spacer()
        NavigationLink {
              WelcomeView()
            } label: {
              RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.yellow)
                .overlay(Text("Logout").foregroundColor(.white))
            }
           .frame(height: 60)

       }
        .onAppear {
        model.refreshModel()
            print(model.email)
      }
    }
//    struct profile_Previews: PreviewProvider {
//
//            static var previews: some View {
//                profile(email: .constant("hello"), model: UserProfileModel(email:"k@k.com"))
//        }
//    }
}
