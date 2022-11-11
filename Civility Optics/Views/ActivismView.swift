//
//  ActivismView.swift
//  Civility Optics
//
//  Created by Parkaranjot Singh on 11/11/22.
//

import SwiftUI
//How to be an Activist; Safe Activism,
// Activism and consumerism, The activist Ally, History of Activism

struct ActivismView: View {
    @State var move = false
    @State var myData = ["Ally", "SafeActivism", "History", "Justice", "Consumerism", "Activist"]
    private var columns2 = [GridItem(.fixed(135), spacing: 2),GridItem(.fixed(135), spacing: 2), GridItem(.fixed(135), spacing: 2)]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns2, spacing: 2){
                ForEach(self.myData, id: \.self){ data in
                    NavigationLink(destination: Text("Second View"), isActive: $move) { EmptyView() }
                        Button(action: {
                            move = true
                            
                        }) {
                            Image(data)
                                .resizable()
                                .scaledToFit()
                                .frame(minWidth: 135)
                            //.frame(idth: 100,height: 100)
                        }
                    }
                }
        }.background(Color.black)
    }
}

struct ActivismView_Previews: PreviewProvider {
    static var previews: some View {
        ActivismView()
    }
}
