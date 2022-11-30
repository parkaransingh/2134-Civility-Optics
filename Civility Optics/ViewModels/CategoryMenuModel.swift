//
//  CategoryMenuModel.swift
//  Civility Optics
//
//  Created by Michael Verges on 9/4/21.
//

import Foundation
import SwiftUI

class CategoryMenuModel: Hashable {
  
  static func == (lhs: CategoryMenuModel, rhs: CategoryMenuModel) -> Bool {
    return lhs.title == rhs.title
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(title)
    hasher.combine(labels.map { $0.text })
  }
  
  init(title: String, labels: [String]) {
    self.title = title
    //self.labels = labels.map { ($0, false) }
    self.labels = labels.map { ($0, false, $0) }
  }
  
  let title: String
  //var labels: [(text: String, isSelected: Bool)]
  var labels: [(text: String, isSelected: Bool, text2: String)]
  
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
