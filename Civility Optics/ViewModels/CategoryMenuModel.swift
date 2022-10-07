//
//  CategoryMenuModel.swift
//  Civility Optics
//
//  Created by Michael Verges on 9/4/21.
//

import Foundation
import SwiftUI

class CategoryMenuModel: Hashable {
  //Creates the model for menu with hashable
  static func == (lhs: CategoryMenuModel, rhs: CategoryMenuModel) -> Bool {
    return lhs.title == rhs.title
  }
  //Creates the hasher
  func hash(into hasher: inout Hasher) {
    hasher.combine(title)
    hasher.combine(labels.map { $0.text })
  }
  //Title for the menu
  init(title: String, labels: [String]) {
    self.title = title
    self.labels = labels.map { ($0, false) }
  }
  
  let title: String
  var labels: [(text: String, isSelected: Bool)]
  //Index for the menu items
  func index(of label: String) -> Int {
    return labels.firstIndex { currentLabel in
      currentLabel.text == label
    }!
  }
  
  var selectedLabels: [String] {
    return labels.filter {
      $0.isSelected
    }.map {
      $0.text
    }
  }
}
