//
//  RateView.swift
//  Civility Optics
//
//  Created by Michael Verges on 4/17/21.
//

import SwiftUI

@available(iOS 14.0, *)
struct RateView: View {
  
  @Environment(\.presentationMode) var presentation
  @ObservedObject var usermodel : UserProfileModel
  var name: String
  let model: RateViewModel
  
  @State var comment: String = ""
  @State var date: Date = Date()
  @State var rating: Int = 0
  
  var body: some View {
    ScrollView {
      HStack {
        Text("Rating \(name)")
          .font(Font.title2.weight(Font.Weight.medium))
          .foregroundColor(Color(UIColor(hexString: "#CBC4BD")))
        Spacer()
      }
      .padding([.leading, .bottom, .trailing])
      DatePicker("Date Visited", selection: $date, displayedComponents: .date)
        .font(Font.title2.weight(Font.Weight.medium))
        .padding()
      
      HStack {
        Text("Rate the overall equality of \(name)")
          .font(Font.title2.weight(Font.Weight.medium))
        Spacer()
      }
      .padding()
      FistSelector($rating)
        .padding()
        .frame(width: 240.0)
      
      VStack {
        ForEach(model.categoryMenus, id: \.self) { menu in
          CategoryMenu(model: menu).padding()
        }
      }
      Text("Comment")
        .font(Font.title2.weight(Font.Weight.medium))
        .padding()
      
      TextEditor(text: $comment)
        .frame(minHeight: 100)
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 16.0)
            .foregroundColor(.pale))
        .padding()
      
      Button(action: {
        
        let tags = model.categoryMenus.flatMap { menu in
          menu.selectedLabels
        }

        if !comment.isEmpty {
            NetworkingService.submitRating(rating, date: date, tag: tags, comment: comment, id: model.placeID, name: self.usermodel.post.user.name ?? "none", email: self.usermodel.post.user.email ?? "none")
        } else {
            NetworkingService.submitRating(rating, date: date, tag: tags, id: model.placeID, name: self.usermodel.post.user.name ?? "none", email: self.usermodel.post.user.email ?? "none")
        }
        
        presentation.wrappedValue.dismiss()
      }, label: {
        ZStack {
          RoundedRectangle(cornerRadius: 10)
          Text("Submit")
            .fontWeight(.bold)
            .accentColor(.white)
        }.frame(height: 60)
      })
      .accentColor(.velvet)
      .padding()
    }.navigationTitle("New Rating")
          .onAppear {
          usermodel.refreshModel()
          print(usermodel.email)
        }
  }
}

