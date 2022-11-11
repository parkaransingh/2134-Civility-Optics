import SwiftUI

struct LinkBusiness: View {
    
    // to do:
    // add a var to store business key when business is selected from search bar
    // add a button "go to profile": that links to searchview and profile
    
    @ObservedObject var model: SearchViewModel
    var email: String
    @State var query: String = ""
    @State var createAccount: Bool? = true
    
    var body: some View {
        results.navigationBarTitle("Civility Optics")
            .navigationBarBackButtonHidden(true)
        
        // add if condition: only when business is selected then we can go to profile page
        // else return a message: "link your business first!"
        
        
        NavigationLink(tag: true, selection: $createAccount){
            TabView {
                SearchView(model: .init(), email: email).tabItem {
                    Label("Search Places", systemImage: "magnifyingglass")
                }
                profile(model: UserProfileModel(email: self.email), bModel: BusinessProfileModel(email: ""), accountType: "Business").tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                } label: {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.velvet)
                        .overlay(Text("Link Your Business").foregroundColor(.white))
                        .frame(height: 60)
                }
            }
        }
    }
    var LinkBusiness: some View {
        VStack(alignment: .leading, spacing: 4) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.pale)
                HStack {
                    TextField("Search for Business", text: $query)
                    
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
            ScrollView {
                //searchfield
                ForEach(model.results, id: \.self) { result in
                    NavigationLink {
                        if #available(iOS 14.0, *) {
                            VenueDetails(model: .init(
                                placeID: result.place_id,
                                //business_key = result.place_id,
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
    
    var results: some View {
        ScrollView {
          LinkBusiness
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

