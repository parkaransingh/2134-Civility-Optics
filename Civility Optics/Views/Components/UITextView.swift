//
//  UITextView.swift
//  Civility Optics
//
//  Created by Michael Verges on 4/17/21.
//

import UIKit

extension UITextView {
  open override var frame: CGRect {
    didSet {
      backgroundColor = .clear //<<here clear
    }
  }
}
