//
//  AddBookView.swift
//  Bookworm
//
//  Created by Michelle Trinh on 11/29/23.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    @State private var isFormValid = false
    @State private var showAlert = false
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                        .onChange(of: title) { oldState, newState in
                            validateForm()
                        }
                    TextField("Author's name", text: $author)
                        .onChange(of: author) { oldState, newState in
                            validateForm()
                        }

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section("Write a review") {
                    TextEditor(text: $review)
                        .onChange(of: review) { oldState, newState in
                            validateForm()
                        }
                    
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        if isFormValid {
                            let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, date: Date())
                            modelContext.insert(newBook)
                            dismiss()
                        } else {
                            showAlert = true
                        }
                    }
                }
            }
            .navigationTitle("Add Book")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Please fill in all fields"))
            }
        }
    }
    
    func validateForm() {
        isFormValid = !title.isEmpty && !author.isEmpty && !review.isEmpty
    }
}

#Preview {
    AddBookView()
}
