//
//  InsetFactView.swift
//  myafrica
//
//  Created by Jean on 29/04/25.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    //MARK: - BODY
    var body: some View {
        Group {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text( /*@START_MENU_TOKEN@*/
                     item
                     /*@END_MENU_TOKEN@*/
                    )
                    .padding()
                }

            }  //:TABS
            .tabViewStyle(PageTabViewStyle())
            .frame(minWidth: 148, idealHeight: 168, maxHeight: 180)
            .background(Color(.gray).opacity(0.2))
            .cornerRadius(12)

        }  //: BOX
    }
}

//#Preview {
//    InsetFactView(animal: Animal(id: "1", name: "", description: "", image: ""))
//}
//MARK: - PREVIEW
struct InsetFactView_Previews: PreviewProvider {

    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView {
            InsetFactView(animal: animals.first!)
        }
    }

}
