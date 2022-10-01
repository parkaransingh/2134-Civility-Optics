//
//  profile.swift
//  Civility Optics
//
//  Created by Parkaranjot Singh on 4/10/22.
//

import SwiftUI
struct profile: View {
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var model : UserProfileModel
    var body: some View {
        ScrollView{
            HStack{
                
                Text("Welcome, ").foregroundColor(.blueDianne).font(.largeTitle).fontWeight(.bold)
              Text(self.model.post.user.name ?? "None").foregroundColor(.blueDianne)
                    .font(.largeTitle).fontWeight(.bold)
                
            }
            VStack{
                HStack{
                    Text("User Profile").foregroundColor(.stone)
                        .fontWeight(.bold)
                        .italic()
                        .font(.title2)
                    Spacer()
                        
                }.padding()
            
            List {
            HStack{
                Text("Email:").foregroundColor(.stone)
                    .fontWeight(.semibold)
            
                Text(self.model.post.user.email ?? "None").foregroundColor(.blue)
            
            }
            HStack{
                Text("Number of Reviews:").foregroundColor(.stone)
                    .fontWeight(.semibold)
            
                Text( "0").foregroundColor(.blue)
            }
                HStack{
                    Text("Gender:").foregroundColor(.stone)
                        .fontWeight(.semibold)
                
                    Text(self.model.post.user.gender ?? "Not Specified").foregroundColor(.blue)
                }
                HStack{
                    Text("Race:").foregroundColor(.stone)
                        .fontWeight(.semibold)
                
                    Text(self.model.post.user.race ?? "Not Specified").foregroundColor(.blue)
                }
                HStack{
                    Text("Disabilities:").foregroundColor(.stone)
                        .fontWeight(.semibold)
                
                    Text(self.model.post.user.disability ?? "Not Specified").foregroundColor(.blue)
                }
            }.frame(minHeight: 280)
            }
            
            VStack{
                ForEach(model.results, id: \.self) { result in
                  HStack {
                    VStack {
                        HStack(spacing: 4) {
                            Text("Rating: ")
                                .bold()
        //                        .multilineTextAlignment(.leading)
                            Text(String(result.value)).foregroundColor(.gold)
                            Spacer()
                        }
                        HStack(spacing: 4) {
                        Text(result.review)
                        .italic()
                        }
                        if !result.tags.isEmpty {
                        HStack(spacing: 4){
                        Text("Tags: ")
                                .bold()
                            HStack{
                        Text((result.tags).joined(separator: ", "))
                            .foregroundColor(.velvet)
                            .padding(0)
                            }.padding(0)
                        Spacer()
                        }
                    }
                    }
                  }
                  .padding()
                  .background(
                    RoundedRectangle(cornerRadius: 20)
                      .foregroundColor(.init(white: 0.95)))
                    }
                }
            
            List {
                HStack{
                    Spacer()
                Button{
                }label: {
                    Text("Password Settings")
                        .bold()
                }.foregroundColor(.velvet)
                    Spacer()
                }
            }.scrollEnabled(false)
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
//                profile(model: UserProfileModel(email:""))
//        }
//    }
}
extension View {
  @ViewBuilder func scrollEnabled(_ enabled: Bool) -> some View {
    if enabled {
      self
    } else {
      simultaneousGesture(DragGesture(minimumDistance: 0),
                          including: .all)
    }
  }
}
