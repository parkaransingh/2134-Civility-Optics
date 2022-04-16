//
//  FistSelector.swift
//  Civility Optics
//
//  Created by Michael Verges on 4/16/21.
//

import SwiftUI

struct FistSelector: View {
  
  @Binding var rating: Int
  
  init(_ rating: Binding<Int>) {
    self._rating = rating
  }
  
  var body: some View {
    HStack(spacing: 6) {
      createButton(1)
      createButton(2)
      createButton(3)
      createButton(4)
      createButton(5)
    }
  }
  
  private func createButton(_ index: Int) -> AnyView {
    return AnyView(Button(action: {
      rating = index
    }, label: {
      Image("fist", bundle: .main)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .foregroundColor(rating >= index ? .stone : .pale)
    }))
  }
}

struct FistSelector_Previews: PreviewProvider {
  static var previews: some View {
    var rating = 0
    return FistSelector(.init(get: { 
      rating
    }, set: { i in
      rating = i
    }))
  }
}
