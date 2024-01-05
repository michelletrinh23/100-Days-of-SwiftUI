//
//  Location.swift
//  BucketList
//
//  Created by Michelle Trinh on 1/4/24.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
}
