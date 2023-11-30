//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Michelle Trinh on 11/26/23.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
