//
//  VenueDetails.swift
//  Civility Optics
//
//  Created by Michael Verges on 10/2/21.
// additions by Parkarajot Singh on 04/9/22

import SwiftUI

@available(iOS 14.0, *)
struct VenueDetails: View {
  
  @ObservedObject var model: VenueDetailsModel
  
  var body: some View {
    ScrollView {
      HStack {
        VStack(alignment: .leading) {
          Text(model.description)
            .font(.headline)
            .foregroundColor(.pale)
        }
        Spacer()
      }
      .padding()
      HStack(spacing: 4) {
        if let rating = model.rating {
          Text("Rating:")
            .foregroundColor(.stone)
          Text(String(format: "%.1f", rating))
            .foregroundColor(.gold)
            .bold()
          Text("of 5")
            .foregroundColor(.stone)
        } else {
          Text("Be the first to leave a rating.")
            .foregroundColor(.pale)
            .multilineTextAlignment(.leading)
        }
        Spacer()
      }
      .padding()
      NavigationLink { 
        RateView(
          name: model.details?.name ?? model.description,
          model: .init(placeID: model.placeID))
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
        
        ForEach(model.results, id: \.self) { result in
          HStack {
            VStack {
                Text(result.review)
                .multilineTextAlignment(.leading)
                
                Text(String(result.value))
                
            
            Text((result.tags).joined(separator: " "))
               
            }
            Spacer()
          }
          .padding()
          .background(
            RoundedRectangle(cornerRadius: 20)
              .foregroundColor(.init(white: 0.95)))
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
