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
  
  var body: some View {
    ScrollView() {
      Text("Use your account to view and submit social-justice ratings of local venues.")
        .multilineTextAlignment(.leading)
        .foregroundColor(.pale)
      
      VStack(alignment: .leading, spacing: 4) {
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
      Spacer()
        
      NavigationLink(tag: true, selection: $didCreateAccount) {
        //SearchView(model: .init())
          TabView {
              SearchView(model: .init()).tabItem {
                        Label("Search Places", systemImage: "magnifyingglass")
                              }
              profile(model: UserProfileModel(email: self.email)).tabItem {
                  Label("Profile", systemImage: "person.circle.fill")
                        }
    
                    }
          
      } label: { 
        EmptyView()
      }.onChange(of: model.success) { newValue in
        didCreateAccount = newValue
      }
      Button {
          if(ageInt >= 13) {
  model.register(email: email, password: password, name: name, race: race, disability: disability, gender: gender)
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
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
