//
//  VenueDetails.swift
//  Civility Optics
//
//  Created by Michael Verges on 10/2/21.
// additions by Parkarajot Singh on 04/9/22

import SwiftUI
import Foundation
@available(iOS 14.0, *)
struct VenueDetails: View {
  
  @ObservedObject var model: VenueDetailsModel
var email: String
  var body: some View {
    VStack {
      HStack {
        VStack(alignment: .leading) {
          Text(model.description)
            .font(.headline)
            .foregroundColor(.pale)
        }
        Spacer()
      }
      .padding()
      //Displays 5-fist rating scheme for the business
      HStack(spacing: 4) {
        if let rating = model.rating {
        VStack(alignment: .leading) {
            HStack{
          Text("Rating:")
            .foregroundColor(.stone)
          Text(String(format: "%.1f", rating))
            .foregroundColor(.gold)
            .bold()
          Text("of 5")
            .foregroundColor(.stone)
            }
            FistsView(rate:rating)
        }
        } else {
          Text("Be the first to leave a rating.")
            .foregroundColor(.pale)
            .multilineTextAlignment(.leading)
        }
        Spacer()
      }
      .padding()
      //Button that allows a user to review a particular business
      NavigationLink { 
        RateView(
          usermodel : UserProfileModel(email:email),
          name: model.details?.name ?? model.description,
          model: .init(placeID: model.placeID) )
      } label: { 
        RoundedRectangle(cornerRadius: 20)
          .foregroundColor(.velvet)
          .overlay(
            Text("Rate " + (model.details?.name ?? "this venue"))
              .foregroundColor(.white))
      }
      .frame(height: 60)
      .padding()
      
      
      VStack(spacing: 12) {
        if !model.results.isEmpty {
          HStack {
            Text("Comments")
              .foregroundColor(.stone)
            Spacer()
          }
        } else {
          Text("Be the first to leave a comment.")
            .foregroundColor(.pale)
        }
        //View for the business's current reviews displayed
    ScrollView{
        ForEach(model.results, id: \.self) { result in
          HStack {
            VStack {
                Group{
                HStack(spacing: 4) {
                    // Convert Date to String
                    // Create Date Formatter
                    let endOfSentence = result.date_visited.firstIndex(of: "T")!
                    let date = result.date_visited[...endOfSentence]
                    Text(date).font(.caption)
                    Spacer()
                }
                HStack(spacing: 4) {
                    let reviewer = "by " + result.user_name
                    Text(reviewer).font(.caption)
                    Spacer()
                }
                }
                HStack(spacing: 4) {
                    // Convert Date to String
                    // Create Date Formatter
                    Text("Rating: ")
                        .bold()
//                        .multilineTextAlignment(.leading)
                    Text(String(result.value)).foregroundColor(.gold)
                    Spacer()
                }
                HStack(spacing: 4) {
                Text(result.review)
                .italic()
                Spacer()
                }
              //Reviews also displays tags selected as well
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
            Spacer()
          }
          .padding()
          .background(
            RoundedRectangle(cornerRadius: 20)
              .foregroundColor(.init(white: 0.95)))
            }
        }
      }
      .padding()
    }
    .navigationTitle(model.details?.name ?? "")
    .onAppear {
      model.refreshModel()
    }
  }
}
