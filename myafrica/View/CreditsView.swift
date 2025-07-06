//
//  CreditsView.swift
//  myafrica
//
//  Created by Jean on 06/07/25.
//

import SwiftUI

struct CreditsView: View {
  var body: some View {
    VStack {
      Image("compass")
        .resizable()
        .scaledToFit()
        .frame(width: 128, height: 128)
      
      Text("""
  Copyright © Freddy Pedrone
  All right reserved
  Go To ♡ Feel Vibe
  """)
        .font(.footnote)
        .multilineTextAlignment(.center)
    } //: VSTACK
    .padding()
    .opacity(0.4)
  }
}

#Preview {
    CreditsView()
}
