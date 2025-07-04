//
//  GalleryView.swift
//  myafrica
//
//  Created by Jean on 20/12/24.
//

import SwiftUI

struct GalleryView: View {
    
    // MARK: - BODY
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            Text("Gallery")
        } //: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}
