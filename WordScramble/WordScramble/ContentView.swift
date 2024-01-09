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
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var score = 0
    
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
                           .accessibilityElement(children: .ignore)
                           .accessibilityLabel("\(word), \(word.count) letters")
                           .accessibilityHint("\(word.count) letters")

                       }
                   }
                   Section {
                       Text("Score: \(score)")
                   }
               }
               .navigationTitle(rootWord)
               .onSubmit(addNewWord)
               .onAppear(perform: startGame)
               .alert(errorTitle, isPresented: $showingError) {
                   Button("OK", role: .cancel) { }
               } message: {
                   Text(errorMessage)
               }
               .toolbar {
                   ToolbarItem(placement: .navigationBarTrailing) {
                       Button("Restart", action: startGame)
                   }
               }
        }
    }
    func addNewWord() {
        // lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // exit if the remaining string is empty
        guard answer.count > 0 else { return }

        //validation
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original!")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        guard isShort(word: answer) else {
            wordError(title: "Word is too short", message: "Your word must have at least three letters!")
            return
        }
        
        guard isSame(word: answer) else {
            wordError(title: "Word is the OG word", message: "You can't choose the same word as the given one!")
            return
        }
        score += answer.count
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
        
    }
    
    func startGame() {
        score = 0
        usedWords = [String]()
        // 1. Find the URL for start.txt in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. Load start.txt into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. Split the string up into an array of strings, splitting on line breaks
                let allWords = startWords.components(separatedBy: "\n")

                // 4. Pick one random word, or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"

                // If we are here everything has worked, so we can exit
                return
            }
        }

        // If were are *here* then there was a problem – trigger a crash and report the error
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }
    
    func isShort(word: String) -> Bool {
        return word.count >= 3
    }
    
    func isSame(word: String) -> Bool {
        return newWord != rootWord
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }

    
}
#Preview {
    ContentView()
}
