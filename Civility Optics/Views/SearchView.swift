//
//  SearchView.swift
//  Civility Optics
//
//  Created by Michael Verges on 10/1/21.
//

import SwiftUI

struct SearchView: View {
  
  @ObservedObject var model: SearchViewModel
  
  @State var query: String = ""
  
  var body: some View {
    results.navigationBarTitle("Civility Optics")
          .navigationBarBackButtonHidden(true)
      
//      TabView {
//          SearchView(model: .init()).tabItem {
//                    Label("Search Places", systemImage: "list.dash")
//                          }
//
//                  }
  }
  
  var searchfield: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 12)
        .foregroundColor(.pale)
      HStack {
        TextField("Search", text: $query)
          .foregroundColor(.stone)
        Spacer()
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
              description: result.description))
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

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      SearchView(model: SearchViewModel())
    }
//      TabView {
//                  SearchView(model: .init())
//                      .tabItem {
//                          Label("Search Places", systemImage: "list.dash")
//                      }
//              }
  }

}
