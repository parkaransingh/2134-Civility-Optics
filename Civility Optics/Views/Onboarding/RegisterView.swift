//
//  RegisterView.swift
//  Civility Optics
//
//  Created by Michael Verges on 12/4/21.
//additions by Parkarajot Singh on 04/9/22

import SwiftUI

struct RegisterView: View {
   
    @ObservedObject var model = RegisterViewModel()
    
    
    @State var email: String = ""
    @State var password: String = ""
    @State var confirm: String = ""
    @State var didCreateAccount: Bool?
    @State var name: String = ""
    @State var race: String = ""
    @State var gender: String = ""
    @State var disability: String = ""
    @State private var birthDate = Date()
    @State private var age: DateComponents? = DateComponents()
    @State private var ageInt: Int = 0
    @State var accountType = ""
    @State var business_name = ""
    @State var business_key = ""
    @State var business_addr = ""
    
    var body: some View {
        ScrollView() {
            Text("Use your account to view and submit social-justice ratings of local venues.")
                .multilineTextAlignment(.leading)
                .foregroundColor(.pale)
            
            VStack(spacing: 2) {
                Text("")
            }

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
            

       //     if self.accountType == "Reviewer" || self.accountType == "" {
         //      model = RegisterViewModel()
           // } else if self.accountType == "Business" {
             //  model = BusinessRegisterViewModel()
            //}
            
            VStack(spacing: 2) {
                Text("")
            }


            VStack(alignment: .leading, spacing: 7) {
                
                Text("Email")
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
                Text("Password")
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
                Text("Confirm Password")
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
                
                if self.accountType == "Reviewer" || self.accountType == "" {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Name")
                            .foregroundColor(.pale)
                            .fontWeight(.semibold)
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.pale)
                            HStack {
                                TextField("Name", text: $name)
                                    .foregroundColor(.stone)
                                    .keyboardType(.alphabet)
                                Spacer()
                            }
                            .padding(.horizontal, 14)
                        }
                        .frame(height: 40)
                    }
                } else if self.accountType == "Business" {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Business Name")
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
                }

              if self.accountType == "Reviewer" || self.accountType == "" {
                VStack {
                    
                    DatePicker("Birth date:", selection: $birthDate, displayedComponents: .date)
                        .onChange(of: birthDate, perform: { value in
                            age = Calendar.current.dateComponents([.year, .month, .day], from: birthDate, to: Date())
                            ageInt = age?.year ?? 0
                            
                        })
                    if ageInt < 13 {
                        // this is if user has not selected a date
                        if (ageInt == 0 && age?.month ?? 0 == 0 && age?.day ?? 0 == 0) {
                            Text("")
                        } else {
                            // selected and less than 13
                            Text("Must be atleast 13 years of age to create account").foregroundColor(.red)
                        }
                    }
                }
              }


              if self.accountType == "Reviewer" || self.accountType == "" {
                Group{
                    Text("*Optional: ")
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Race")
                            .foregroundColor(.pale)
                            .fontWeight(.semibold)
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.pale)
                            HStack {
                                Menu(race == "" ? "Choose Race" : race) {
                                    Button("Asian", action: { chooseRace(myRace: "Asian") })
                                    Button("Black", action: { chooseRace(myRace: "Black") })
                                    Button("White", action: { chooseRace(myRace: "White") })
                                    Button("Native American", action: { chooseRace(myRace: "Native American") })
                                    Button("Native Hawaiian or other Pacific Islander", action: { chooseRace(myRace: "Native Hawaiian or other Pacific Islander") })
                                    Button("Multiracial", action: { chooseRace(myRace: "Multiracial") })
                                }
                                .foregroundColor(.stone)
                                Spacer()
                            }
                            .padding(.horizontal, 14)
                        }
                        .frame(height: 40)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Gender")
                            .foregroundColor(.pale)
                            .fontWeight(.semibold)
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.pale)
                            HStack {
                                Menu(gender == "" ? "Choose Gender" : gender) {
                                    Button("Male", action: { chooseGender(mygender: "Male") })
                                    Button("Female", action: { chooseGender(mygender: "Female") })
                                    Button("Non-Binary", action: { chooseGender(mygender: "Non-Binary") })
                                    Button("other", action: { chooseGender(mygender: "other") })
                                    
                                }
                                .foregroundColor(.stone)
                                Spacer()
                            }
                            .padding(.horizontal, 14)
                        }
                        .frame(height: 40)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Disabilities")
                            .foregroundColor(.pale)
                            .fontWeight(.semibold)
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.pale)
                            HStack {
                                TextField("Disabilities", text: $disability)
                                    .foregroundColor(.stone)
                                    .keyboardType(.alphabet)
                                Spacer()
                            }
                            .padding(.horizontal, 14)
                        }
                        .frame(height: 40)
                    }
                }
              }
                Spacer()
                
                NavigationLink(tag: true, selection: $didCreateAccount) {
                    VerifyView(email: self.email)
                      //SearchView(model: .init())
//                    TabView {
//                        SearchView(model: .init(), email: email).tabItem {
//                            Label("Search Places", systemImage: "magnifyingglass")
//                        }
//                        profile(model: UserProfileModel(email: self.email)).tabItem {
//                            Label("Profile", systemImage: "person.circle.fill")
//                        }
//
//                    }
                 
                } label: {
                    EmptyView()
                }.onChange(of: model.success) { newValue in
                    didCreateAccount = newValue
                }
                Button {
                    if(ageInt >= 13 && self.accountType == "Reviewer") {
                        model.register(email: email, password: password, name: name, race: race, disability: disability, gender: gender)
                    } else if(self.accountType == "Business") {
                        model.businessRegister(email: email, password: password, business_key: business_key, business_name: business_name, business_addr: business_addr)
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.velvet)
                        .overlay(Text("Create Account").foregroundColor(.white))
                        .frame(height: 60)
                    
                }
            }
        }
        .padding()
        .navigationTitle("Create an Account")
    }
    
    func chooseRace(myRace: String) {
        race = myRace
        
    }
    func chooseGender(mygender: String) {
        gender = mygender
        
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
