//
//  ExternalWebLinkView.swift
//  myafrica
//
//  Created by Jean on 29/04/25.
//

import SwiftUI

struct ExternalWebLinkView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    //MARK: - BODY
    var body: some View {
        Group {
            HStack {
                Image(systemName: "globe")
                Text( "Wikipedia")
                Spacer()
                Group {
                    Link(animal.name, destination: URL(string:animal.link) ?? URL(string: "https://wikipedia.org")!)
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundColor(.accentColor)
                
            }//:HSTACK

            
        }//:BOX
        .padding()

        .background(Color(.gray).opacity(0.2))
        .cornerRadius(12)
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {

    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWebLinkView(animal: animals.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
