//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Michelle Trinh on 1/19/24.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
