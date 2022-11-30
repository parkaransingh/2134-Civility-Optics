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
        ("Treats Genders Equally", "Unequal Treatment"),
        "Gender Neutral Bathrooms",
        ("Unequal Treatment", "Treats Genders Equally"),
      ]),
      .init(title: "Sensory Overload", labels: [
        "Overstimulating",
      ]),
      .init(title: "Racial Diversity", labels: [
        ("Diverse Staff", "Not Diverse Staff"),
        ("Diverse Patrons", "Not Diverse Patrons"),
        ("Not Diverse Staff", "Diverse Staff"),
        ("Not Diverse Patrons", "Diverse Patrons"),
      ]),
      .init(title: "LGBTQ+ Support", labels: [
        ("Supports LGBTQ+ Community", "Discriminates against LGBTQ+"),
        ("Discriminates against LGBTQ+", "Supports LGBTQ+ Community"),
      ]),
      .init(title: "Accessibility", labels: [
        ("Accessible by wheel chair", "Not accessible by wheel chair"),
        ("Not accessible by wheel chair", "Accessible by wheel chair"),
      ]),
    ]
    //categoryMenus[0].labels
  }
}
