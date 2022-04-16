//
//  VenueItem.swift
//  Civility Optics
//
//  Created by Michael Verges on 10/1/21.
//

import SwiftUI

struct VenueItem: View {
  
  var title: String
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(title)
          .multilineTextAlignment(.leading)
          .lineLimit(2)
          .foregroundColor(.stone)
      }
      Spacer()
      Image(systemName: "chevron.right")
        .foregroundColor(.gold)
    }
    .font(.system(size: 18, weight: .medium))
    .frame(height: 68)
    .padding()
  }
}

struct VenueItem_Previews: PreviewProvider {
  static var previews: some View {
    VenueItem(title: "Title -- a longer description of the title, GA USA")
      .previewLayout(
        .fixed(
          width: 375, 
          height: 108))
  }
}
