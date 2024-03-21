//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Michelle Trinh on 3/19/24.
//

import SwiftUI

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")

    var body: some View {
        NavigationView {
            List(resorts) { resort in
                NavigationLink {
                    Text(resort.name)
                } label: {
                    Image(resort.country)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 25)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 5)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 1)
                        )
                    
                    VStack(alignment: .leading) {
                        Text(resort.name)
                            .font(.headline)
                        
                        Text("\(resort.runs) runs")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self) {resort in
                ResortView(resort: resort)
            }
        } detail: {
            WelcomeView()
        }
    }
}

#Preview {
    ContentView()
}
