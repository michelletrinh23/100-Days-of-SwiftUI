//
//  Friend.swift
//  FriendFace
//
//  Created by Michelle Trinh on 12/23/23.
//

import Foundation

struct Friend: Hashable, Identifiable, Codable {
    let id: UUID
    var name: String
}
