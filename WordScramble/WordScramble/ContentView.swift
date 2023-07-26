//
//  ContentView.swift
//  WordScramble
//
//  Created by Michelle Trinh on 7/25/23.
//

import SwiftUI


struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        NavigationView {
               List {
                   Section {
                       TextField("Enter your word", text: $newWord)
                           .autocapitalization(.none)
                   }
                   Section {
                       ForEach(usedWords, id: \.self) { word in
                           HStack {
                               Image(systemName: "\(word.count).circle")
                               Text(word)
                           }
                       }
                   }
               }
               .navigationTitle(rootWord)
               .onSubmit(addNewWord)
        }
    }
    func addNewWord() {
        // lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // exit if the remaining string is empty
        guard answer.count > 0 else { return }

        // extra validation to come
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
}
#Preview {
    ContentView()
}
