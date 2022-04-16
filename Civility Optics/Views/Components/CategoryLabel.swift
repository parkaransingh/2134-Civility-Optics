//
//  CategoryLabel.swift
//  Civility Optics
//
//  Created by Michael Verges on 4/16/21.
//

import SwiftUI

struct CategoryLabel: View {
  
  let text: String
  let onSelect: (Bool) -> ()
  
  @State var isSelected: Bool = false
  
  init(_ text: String, onSelect: @escaping (Bool) -> () = { _ in }) {
    self.text = text
    self.onSelect = onSelect
  }
  
  var body: some View {
    
    Button(action: {
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
