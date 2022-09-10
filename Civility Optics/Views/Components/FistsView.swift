//
//  FistsView.swift
//  Civility Optics
//
//  Created by Parkaranjot Singh on 9/9/22.
//

import SwiftUI

struct FistsView: View {
    var rate: Double
    var body: some View {
        HStack{
            ForEach(1..<6) { i in
        Image("fist")
            .resizable()
            .frame(width: 32.0, height: 32.0)
            .foregroundColor(i <= Int(rate) ? .stone : .pale)
        }
        }
    }
}

struct FistsView_Previews: PreviewProvider {
    static var previews: some View {
        FistsView(rate: 5)
    }
}
