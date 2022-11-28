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
      if model.categoryMenus[0].selectedLabels.contains("Treats Gender Equally") 
      && model.categoryMenus[0].selectedLabels.contains("Unequal Treatment") {
        model.categoryMenus[0][0].isSelected = false
        model.categoryMenus[0][2].isSelected = false
        usermodel.refreshModel()
      }
      /**
      if model.categoryMenus[0].selectedLabels == ["Unequal Treatment", "Treats Gender Equally"]  {

      }
      if model.categoryMenus[2].selectedLabels == ["Diverse Staff", "Not Diverse Staff"] {

      }
      if model.categoryMenus[2].selectedLabels == ["Not Diverse Staff", "Diverse Staff"]  {

      }
      if model.categoryMenus[2].selectedLabels == ["Diverse Patrons", "Not Diverse Patrons"] {

      }
      if model.categoryMenus[2].selectedLabels == ["Not Diverse Patrons", "Diverse Patrons"]  {

      }
      if model.categoryMenus[3].selectedLabels == ["Supports LGBTQ+ Community", "Discriminates against LGBTQ+"] {

      }
      if model.categoryMenus[3].selectedLabels == ["Discriminates against LGBTQ+", "Supports LGBTQ+ Community"]  {

      }
      if model.categoryMenus[4].selectedLabels == ["Accessible by wheel chair", "Not accessible by wheel chair"] {

      }
      if model.categoryMenus[4].selectedLabels == ["Not accessible by wheel chair", "Accessible by wheel chair"]  {

      }
      */
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

