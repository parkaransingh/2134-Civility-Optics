//
//  CategoryMenu.swift
//  Civility Optics
//
//  Created by Michael Verges on 4/17/21.
//

import SwiftUI
import WrappingHStack

struct CategoryMenu: View {
  
  @State var isExpanded = false
  
  let model: CategoryMenuModel
  
  var body: some View {
    VStack(alignment: .leading) {
      if #available(iOS 14.0, *) {
        Button(action: {
          isExpanded.toggle()
        }, label: {
          Text(model.title)
          Spacer()
          Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
        })
          .font(Font.title2.weight(Font.Weight.medium))
          .accentColor(.black)
      } else {
        Button(action: {
          isExpanded.toggle()
        }, label: {
          Text(model.title)
          Spacer()
          Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
        })
          .font(Font.title.weight(Font.Weight.medium))
          .accentColor(.black)
      }

      //probably gotta do something here to check for which in the model
      if isExpanded {
        WrappingHStack(model.labels, id: \.self) { (label) in
          CategoryLabel(label.text) { isSelected in
            model.labels[
              model.index(of: label.text)
            ].isSelected = isSelected
          }
          .padding(.vertical, 6)
          for label in model.labels {
            if label.isSelected && model.labels[model.index(of: label.text2)].isSelected {
              label.isSelected = false
              model.labels[model.index(of: label.text2)].isSelected = false
              
            }
          }

        }
      }
    }
    .animation(.default)
  }
}

struct CategoryMenu_Previews: PreviewProvider {
  static var previews: some View {
    CategoryMenu(model: CategoryMenuModel(title: "Category Title", labels: ["Option", "Alternate", "Option", "Alternate", "Option", "Alternate", "Option", "Alternate"]))
  }
}
