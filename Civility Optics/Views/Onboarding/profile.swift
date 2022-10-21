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
    VStack {
      HStack {  
        Text("Welcome, ").foregroundColor(.blueDianne).font(.largeTitle).fontWeight(.bold)
        Text(self.model.post.name ?? "None").foregroundColor(.blueDianne)
          .font(.largeTitle).fontWeight(.bold) 
      }
      VStack {
        HStack {
          Text("User Profile").foregroundColor(.stone)
            .fontWeight(.bold)
            .italic()
            .font(.title2)
          Spacer()      
        }.padding()
        ScrollView {
          ScrollView {
            List {
              HStack{
                Text("Email:").foregroundColor(.stone)
                  .fontWeight(.semibold)
                Text(self.model.post.email ?? "None").foregroundColor(.blue)
              }
              HStack {
                Text("Number of Reviews:").foregroundColor(.stone)
                  .fontWeight(.semibold)
                Text( "0").foregroundColor(.blue)
              }
              HStack {
                Text("Gender:").foregroundColor(.stone)
                  .fontWeight(.semibold)
                Text(self.model.post.gender ?? "Not Specified").foregroundColor(.blue)
              }
              HStack {
                  Text("Race:").foregroundColor(.stone)
                    .fontWeight(.semibold)
                  Text(self.model.post.race ?? "Not Specified").foregroundColor(.blue)
              }
              HStack {
                Text("Disabilities:").foregroundColor(.stone)
                  .fontWeight(.semibold)
                Text(self.model.post.disability ?? "Not Specified").foregroundColor(.blue)
              }
            }.frame(minHeight: 280)
          }
          Text("Past Reviews:").fontWeight(.bold)
           ScrollView {
             ForEach(model.results, id: \.self) { result in
               HStack {
                 VStack {
                   HStack(spacing: 4) {
                     HStack(spacing: 4) {
                       // Convert Date to String
                       // Create Date Formatter
                       let endOfSentence = result.date_visited.firstIndex(of: "T")!
                       let date = result.date_visited[...endOfSentence]
                       Text(date).font(.caption)
                       Spacer()
                     }
                   }
                   HStack(spacing: 4) {
                     Text("Rating: ")
                       .bold()
                       // .multilineTextAlignment(.leading)
                     Text(String(result.value)).foregroundColor(.gold)
                     Spacer()
                   }
                   HStack(spacing: 4) {
                     Text(result.review)
                       .italic()
                   }
                   if !result.tags.isEmpty {
                     HStack(spacing: 4) {
                       Text("Tags: ")
                         .bold()
                       HStack {
                         Text((result.tags).joined(separator: ", "))
                           .foregroundColor(.velvet)
                           .padding(0)
                       }.padding(0)
                       Spacer()
                     }
                   }
                 }
               }.frame(maxHeight: 50)
                 .padding()
                 .background(
               RoundedRectangle(cornerRadius: 20)
                 .foregroundColor(.init(white: 0.95)))
             }
           }.frame(minHeight: 100)
        }
      }
      Spacer()
      NavigationLink {
        WelcomeView().navigationBarBackButtonHidden(true)
      }
    label: {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.yellow)
            .overlay(Text("Logout").foregroundColor(.white))
        
    }.frame(height: 40)
            .simultaneousGesture(TapGesture().onEnded{
                NetworkingService.userLogout()
                
            })
        // NetworkingService.userLogoutAllDevices()
        NavigationLink {
            WelcomeView().navigationBarBackButtonHidden(true)
            
        }
    label: {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.red)
            .overlay(Text("Logout Out All Devices").foregroundColor(.white))
        
    }.frame(height: 40)
            .simultaneousGesture(TapGesture().onEnded{
                NetworkingService.userLogoutAllDevices()
                
            })
        
    }
    .onAppear {
      model.refreshModel()
      print(model.email)
    }
  }
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
