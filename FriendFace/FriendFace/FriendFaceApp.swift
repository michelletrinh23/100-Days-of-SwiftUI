//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Michelle Trinh on 12/22/23.
//

import SwiftData
import SwiftUI

@main
struct FriendfaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
