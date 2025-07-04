//
//  InsetGalleryView.swift
//  myafrica
//
//  Created by Jean on 28/04/25.
//

import SwiftUI

struct InsetGalleryView: View {
// MARK: - PROPERTIES
    let animal: Animal
//MARK: - BODY

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15){
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }//: LOOP
            } //: HSTACK
        } //: SCROLL
    }
}

//MARK: - PREVIEW
struct InsetGalleryView_Previews: PreviewProvider {

    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView {
            InsetGalleryView(animal: animals.first!)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }

}
