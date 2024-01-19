//
//  ContentView.swift
//  RememberNames
//
//  Created by Michelle Trinh on 1/17/24.
//

import PhotosUI
import SwiftUI

struct ContentView: View {
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $pickerItem, matching: .images) {
                Label("Select a picture", systemImage: "photo")
            }
            
            selectedImage?
                .resizable()
                .scaledToFit()
        }
        .onChange(of: pickerItem) {
            Task {
                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
            }
        }
    }
}

#Preview {
    ContentView()
}
