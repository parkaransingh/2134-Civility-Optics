import SwiftUI

struct LinkBusiness: View {
    
    // to do:
    // add a var to store business key when business is selected from search bar
    // add a button "go to profile": that links to searchview and profile
    
    @ObservedObject var model: SearchViewModel
    @ObservedObject var userModel: BusinessProfileModel
    @State var query: String = ""
    @State var createAccount: Bool? = false
    @State var business_key: String = ""
    @State var business_name: String = ""
    
    var body: some View {
        
        // add if condition: only when business is selected then we can go to profile page
        // else return a message: "link your business first!"
        VStack{
            let str = "Selected business " + business_name
            Text(str)
            LinkBusiness
            NavigationLink{
                TabView {
                    SearchView(model: .init(), email: userModel.email).tabItem {
                        Label("Search Places", systemImage: "magnifyingglass")
                    }
                    profile(model: UserProfileModel(email: ""), bModel: userModel, accountType: "Business").tabItem {
                        Label("Profile", systemImage: "person.circle.fill")
                    }
                }
            }
        label: {
                Label("Link Selected Business to Account", systemImage: "person.circle.fill")
            }
        .simultaneousGesture(TapGesture().onEnded{
            let array = business_name.components(separatedBy: ",")
            userModel.businessUpdate(email: userModel.bpost.business.email ?? "", business_key: business_key, business_name: array[0], business_addr: String(business_name.dropFirst(array[0].count)), business_description: userModel.bpost.business.business_description ?? "", token: AuthService.current.token ?? "")
        })
        } .onAppear {
            userModel.refreshModel()
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
//                        NavigationLink {
//                            if #available(iOS 14.0, *) {
//                                VenueDetails(model: .init(
//                                    placeID: result.place_id,
//                                    //business_key = result.place_id,
//                                    description: result.description), email: self.email)
//                            } else {
//                                Text(result.description)
//                            }
//                        } label: {
//                        VStack{
//                            Text(result.place_id)
//                            VenueItem(title: result.description)
////
//
//                        }
                        Button (action: {
                            if #available(iOS 14.0, *) {
                                
                                //VenueDetails(model: .init(
                               // placeID: result.place_id,
                               // description: result.description), email: self.originalEmail)
                                business_name = result.description
                                business_key = result.place_id //commented above out to prevent rate page from showing
                            }
                        }, label: {
                            VenueItem(title: result.description)
                        })
                    }
                }
            }
            
            
        }
        
    }



