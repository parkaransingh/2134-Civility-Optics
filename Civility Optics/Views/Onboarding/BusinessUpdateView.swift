//
//  RegisterView.swift
//  Civility Optics
//
//  Created by Michael Verges on 12/4/21.
//additions by Parkarajot Singh on 04/9/22

import SwiftUI

struct BusinessUpdateView: View {
   
    var model = RegisterViewModel()
    var searchModel = SearchViewModel()
    
    var originalEmail: String
    @State var email: String = ""
    @State var password: String = ""
    @State var confirm: String = ""
    @State var didCreateAccount: Bool?
    @State private var birthDate = Date()
    @State private var age: DateComponents? = DateComponents()
    @State private var ageInt: Int = 0
    @State var accountType = ""
    @State var business_name = ""
    @State var business_key = ""
    @State var business_addr = ""
    @State var query = ""
    
    var body: some View {
        ScrollView() {
            Text("Update information on your own business account")
                .multilineTextAlignment(.leading)
                .foregroundColor(.pale)
            
            VStack(spacing: 2) {
                Text("")
            }
            /**
            HStack {
            Text("Account Type:").font(.headline)
                HStack (spacing: 5){
                RadioButtonField(
                    id: "Reviewer",
                    label: "Reviewer",
                    color:.black,
                    bgColor: .black,
                    isMarked: $accountType.wrappedValue == "Reviewer" ? true : false,
                    callback: { selected in
                        self.accountType = selected
                        print("Selected account is: \(selected)")
                    }
                )
                RadioButtonField(
                    id: "Business",
                    label: "Business",
                    color:.black,
                    bgColor: .black,
                    isMarked: $accountType.wrappedValue == "Business" ? true : false,
                    callback: { selected in
                        self.accountType = selected
                        print("Selected account is: \(selected)")
                    }
                )
            }
            }
            */

       //     if self.accountType == "Reviewer" || self.accountType == "" {
         //      model = RegisterViewModel()
           // } else if self.accountType == "Business" {
             //  model = BusinessRegisterViewModel()
            //}
            
            VStack(spacing: 2) {
                Text("")
            }


            VStack(alignment: .leading, spacing: 7) {
                Text("Update Email")
                    .foregroundColor(.pale)
                    .fontWeight(.semibold)
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.pale)
                    HStack {
                        TextField("email", text: $email)
                            .foregroundColor(.stone)
                            .keyboardType(.emailAddress)
                        Spacer()
                    }
                    .padding(.horizontal, 14)
                }
                .frame(height: 40)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Update Password")
                    .foregroundColor(.pale)
                    .fontWeight(.semibold)
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.pale)
                    HStack {
                        SecureField("password", text: $password)
                            .foregroundColor(.stone)
                        Spacer()
                    }
                    .padding(.horizontal, 14)
                }
                .frame(height: 40)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text("Confirm New Password")
                    .foregroundColor(.pale)
                    .fontWeight(.semibold)
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.pale)
                    HStack {
                        SecureField("confirm", text: $confirm)
                            .foregroundColor(.stone)
                        Spacer()
                    }
                    .padding(.horizontal, 14)
                }
                .frame(height: 40)
                if confirm != password {
                    Text("Passwords do not match").foregroundColor(.red)
                }
                
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Update Business Name")
                            .foregroundColor(.pale)
                            .fontWeight(.semibold)
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.pale)
                            HStack {
                                TextField("Business Name", text: $business_name)
                                    .foregroundColor(.stone)
                                    .keyboardType(.alphabet)
                                Spacer()
                            }
                            .padding(.horizontal, 14)
                        }
                        .frame(height: 40)
                    }
                    /*
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
                            searchModel.generateResults(for: newValue, sessionID: AutocompleteSession.current.getSessionToken())
                        }
                        ScrollView {
                            //searchfield
                            ForEach(searchModel.results, id: \.self) { result in
                                NavigationLink { 
                                if #available(iOS 14.0, *) {
                                    
                                    VenueDetails(model: .init(
                                    placeID: result.place_id,
                                    description: result.description), email: self.originalEmail)
                                    business_key = result.place_id //commented above out to prevent rate page from showing
                                } else {
                                    Text(result.description)
                                }
                                } label: {
                                    VenueItem(title: result.description)
                                }
                            }
                        }
                    }
                    */
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Business Key")
                            .foregroundColor(.pale)
                            .fontWeight(.semibold)
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.pale)
                            HStack {
                                TextField("Business Key", text: $business_key)
                                    .foregroundColor(.stone)
                                    .keyboardType(.alphabet)
                                Spacer()
                            }
                            .padding(.horizontal, 14)
                        }
                        .frame(height: 40)
                        
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Business Address")
                            .foregroundColor(.pale)
                            .fontWeight(.semibold)
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.pale)
                            HStack {
                                TextField("Business Address", text: $business_addr)
                                    .foregroundColor(.stone)
                                    .keyboardType(.alphabet)
                                Spacer()
                            }
                            .padding(.horizontal, 14)
                        }
                        .frame(height: 40)
                    }
                    NavigationLink(tag: true, selection: $didCreateAccount) {
                      //SearchView(model: .init())
                    TabView {
                        SearchView(model: .init(), email: email).tabItem {
                            Label("Search Places", systemImage: "magnifyingglass")
                        }
                        profile(model: UserProfileModel(email: ""), bModel: BusinessProfileModel(email: self.email), accountType: "Business").tabItem {
                            Label("Profile", systemImage: "person.circle.fill")
                        }
                    }
                    
                } label: {
                    EmptyView()
                }.onChange(of: model.success) { newValue in
                    didCreateAccount = newValue
                }
                Button {
                        model.businessUpdate(email: email, password: password, business_key: business_key, business_name: business_name, business_addr: business_addr, token: AuthService.current.token)
                } label: {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.velvet)
                        .overlay(Text("Update Account").foregroundColor(.white))
                        .frame(height: 60)
                    
                }
            }
              
        }
        .padding()
        .navigationTitle("Update an Account")
    }
    
    
    struct RegisterView_Previews: PreviewProvider {
        static var previews: some View {
            RegisterView()
        }
    }
    
  
//MARK:- Radio Button Field
struct RadioButtonField: View {
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let bgColor: Color
    let textSize: CGFloat
    let isMarked:Bool
    let callback: (String)->()
    
    init(
        id: String,
        label:String,
        size: CGFloat = 20,
        color: Color = Color.black,
        bgColor: Color = Color.black,
        textSize: CGFloat = 14,
        isMarked: Bool = false,
        callback: @escaping (String)->()
        ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.bgColor = bgColor
        self.textSize = textSize
        self.isMarked = isMarked
        self.callback = callback
    }
    
    var body: some View {
        Button(action:{
            self.callback(self.id)
        }) {
            HStack(alignment: .center) {
                Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
                    .clipShape(Circle())
                    .foregroundColor(self.bgColor)
                Text(label)
                    .font(Font.system(size: textSize))
                Spacer()
            }.foregroundColor(self.color)
        }
        .foregroundColor(Color.white)
    }
}

    
}
