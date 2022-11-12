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
@State private var didTap = Array(repeating: true, count: 4)
var email: String
  var body: some View {
    VStack {
      HStack {
        VStack(alignment: .leading) {
          Text(model.description)
            .font(.headline)
            .foregroundColor(.stone)
        }
        Spacer()
      }
      .padding()
      //Text("Description:")
      //foregroundColor(.stone)
      //.multilineTextAlignment(.leading)
      HStack {
        VStack(alignment: .leading, spacing: 4) {
          Text("Description: ")
            .foregroundColor(.stone)
          Text(String(model.ownerDescription))
            //.font(.headline)
            .foregroundColor(.stone)
        }
        Spacer()
      }
      .padding()
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
                    Menu("Report") {
                        Button("Report Review", action: { NetworkingService.report(id: result._id) })
                    }
                }
                HStack(spacing: 4) {
                    let reviewer = "by " + result.user_name
                    Text(reviewer).font(.caption)
                    Spacer()
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
                HStack(spacing: 4) {
                    let str =  " Helpful " + String(result.helpful) + " "
                    Button(action: {
                            NetworkingService.helpful(email: email, id: result._id)
                            model.refreshModel()
                            }) {
                                Text(str)
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.white)
                            }
                            .buttonStyle(CustomButtonStyle(isSelected: false))
                            //.background(Color.gold) // If you have
                            .cornerRadius(5)
                Spacer()
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


struct CustomButtonStyle : ButtonStyle {
    var isSelected: Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.background(configuration.isPressed ? Color.blueDianne : Color.gold)
    }
}
