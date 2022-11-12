//
//  ActivismDetailView.swift
//  Civility Optics
//
//  Created by Parkaranjot Singh on 11/11/22.
//

import SwiftUI

struct ActivismDetailView: View {
    var body: some View {
        VStack{
            Text("Title Of Educuation").font(.largeTitle).foregroundColor(.blueDianne)
            Spacer()
            VStack{
                Text("Description").font(.title2).foregroundColor(.stone)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.").font(.body)
            }.padding()
    
            VStack{
                Text("Tips").font(.title2).foregroundColor(.stone)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.").font(.body)
            }.padding()

            VStack{
                Text("Resources and Links").font(.title2).foregroundColor(.stone)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.").font(.body)
            }.padding()
            .background(Color.velvet)
        }
            
    }
}

struct ActivismDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActivismDetailView()
    }
}
