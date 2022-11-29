//
//  RateViewModel.swift
//  Civility Optics
//
//  Created by Michael Verges on 9/4/21.
//

import Foundation

struct RateViewModel {
  let categoryMenus: [CategoryMenuModel]
  
  let placeID: String
  
  init(placeID: String) {
    self.placeID = placeID
    categoryMenus = [
      .init(title: "Gender Equality", labels: [
        "Treats Genders Equally",
        "Gender Neutral Bathrooms",
        "Unequal Treatment",
      ]),
      .init(title: "Sensory Overload", labels: [
        "Overstimulating",
      ]),
      .init(title: "Racial Diversity", labels: [
        "Diverse Staff",
        "Diverse Patrons",
        "Not Diverse Staff",
        "Not Diverse Patrons",
      ]),
      .init(title: "LGBTQ+ Support", labels: [
        "Supports LGBTQ+ Community",
        "Discriminates against LGBTQ+",
      ]),
      .init(title: "Accessibility", labels: [
        "Accessible by wheel chair",
        "Not accessible by wheel chair",
      ]),
    ]
    //categoryMenus[0].labels
  }
}
