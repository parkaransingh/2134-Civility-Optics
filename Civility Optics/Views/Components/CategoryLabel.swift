//
//  CategoryLabel.swift
//  Civility Optics
//
//  Created by Michael Verges on 4/16/21.
//

import SwiftUI

struct CategoryLabel: View {
  
  let text: String
  let exclusionTag: CategoryLabel
  let onSelect: (Bool) -> ()
  
  @State var isSelected: Bool = false
  
  init(_ text: String, onSelect: @escaping (Bool) -> () = { _ in }) {
    self.text = text
    self.onSelect = onSelect
  }
  
  var body: some View {
    
    Button(action: {
      if (exclusionTag != nil && exclusionTag.isSelected) {
        exclusionTag.isSelected.toggle()
        exclusionTag.onSelect(exclusionTag.isSelected)
      }
      isSelected.toggle()
      onSelect(isSelected)
    }, label: {
      Text(text)
        .foregroundColor(isSelected ? .white : .stone)
        .padding(8)
        .background(
          RoundedRectangle(cornerRadius: 8.0)
            .foregroundColor(isSelected ? .stone : .pale)
        )
    })
  }
}

struct CategoryLabel_Previews: PreviewProvider {
  static var previews: some View {
    CategoryLabel("Label")
  }
}
