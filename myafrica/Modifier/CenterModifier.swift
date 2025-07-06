//
//  CenterModifier.swift
//  myafrica
//
//  Created by Jean on 06/07/25.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
