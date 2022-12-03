//
//  SearchView.swift
//  Civility Optics
//
//  Created by Michael Verges on 10/1/21.
//

import SwiftUI

struct SearchView: View {
  
  @ObservedObject var model: SearchViewModel
    var email: String
  @State var query: String = ""
  
  var body: some View {

    results.navigationBarTitle("Civility Optics")
          .navigationBarBackButtonHidden(true)
  }
    
  var searchfield: some View {
    ZStack {
        VStack{
            
            Image("civility optics logo")
                .resizable()
                .edgesIgnoringSafeArea(.top)
                .frame(width: 70, height: 50)
                .padding(.trailing, 1)
                .padding(.top, 1)
            Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .foregroundColor(.pale)
                    .frame(height:40)
                HStack {
                  TextField(" Search", text: $query)
                    .foregroundColor(.stone)
                  Spacer()
                }

            }
        }
      .padding(.horizontal, 14)
    }
    .frame(height: 40)
    .padding(15)
    .onChange(of: query) { newValue in
      model.generateResults(for: newValue, sessionID: AutocompleteSession.current.getSessionToken())
    }
  }
  
  var results: some View {
    ScrollView {
      searchfield
      ForEach(model.results, id: \.self) { result in
        NavigationLink { 
          if #available(iOS 14.0, *) {
            VenueDetails(model: .init(
              placeID: result.place_id,
              description: result.description), email: self.email)
          } else {
            Text(result.description)
          }
        } label: {
          VenueItem(title: result.description)
        }
      }
    }
  }
}
