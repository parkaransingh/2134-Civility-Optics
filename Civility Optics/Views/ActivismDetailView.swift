//
//  ActivismDetailView.swift
//  Civility Optics
//
//  Created by Parkaranjot Singh on 11/11/22.
//

import SwiftUI

struct ActivismDetailView: View {
    @ObservedObject var model : ActivismModel
    var body: some View {
        VStack{
            Text(model.post.activism.displayTitle).font(.largeTitle).foregroundColor(.blueDianne)
            VStack{
                Text("Description").font(.title2).foregroundColor(.stone)
                Text(model.post.activism.description).font(.body)
            }.padding()
            Spacer()
            VStack{
                Text("Tips").font(.title2).foregroundColor(.stone)
                Text(model.post.activism.tips).font(.body)
            }.padding()
            Spacer()
            VStack{
                Text("Resources and Links").font(.title2).foregroundColor(.stone)
                Text(model.post.activism.resources).font(.body)
            }.padding()
            .background(Color.velvet)
        }    .onAppear {
            model.refreshModel()
            print(model.post.activism.tips)
          }
            
    }
}

//struct ActivismDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivismDetailView()
//    }
//}
