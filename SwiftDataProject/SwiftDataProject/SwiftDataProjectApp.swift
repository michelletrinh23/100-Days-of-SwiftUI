//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Michelle Trinh on 12/7/23.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
