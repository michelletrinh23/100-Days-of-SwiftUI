//
//  ContentView.swift
//  Instafilter
//
//  Created by Michelle Trinh on 12/27/23.
//

import StoreKit
import SwiftUI

struct ContentView: View {
    @Environment(\.requestReview) var requestReview

    var body: some View {
        Button("Leave a review") {
            requestReview()
        }
    }
}

#Preview {
    ContentView()
}
