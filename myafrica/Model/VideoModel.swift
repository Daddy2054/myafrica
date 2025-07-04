//
//  VideoModel.swift
//  myafrica
//
//  Created by Jean on 29/04/25.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed property
    var thumbnail: String {
        "video-\(id)"
    }
}
