//
//  BooksView.swift
//  Charactree
//
//  Created by Eduardo Gonzalez Melgoza on 29/02/24.
//

import SwiftUI
import SwiftData


struct BooksView: View {
    
    @Environment(\.modelContext) private var context
    
    @State private var showingAddBookSheet = false
    @State private var showingBooksListSheet = false
    
    @Query(sort: \Book.dateCreated, order: .reverse) var books: [Book]
    
    var body: some View {
        let plusImage = Image(systemName: "plus").resizable()
        
        NavigationStack {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 2) {
                    ForEach(books) { book in
                        NavigationLink(destination: CharactersView(book: book)) {
                            AltBookCard(book: book)
                        }
                    }
                }
            }
            .navigationTitle("Books")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $showingAddBookSheet) { AddBookSheet() }
            .toolbar {
                if !books.isEmpty {
                    Button("Edit") {
                        showingBooksListSheet.toggle()
                    }
                    .sheet(isPresented: $showingBooksListSheet) {
                        BookListView()
                    }
                    Button(action: {
                        showingAddBookSheet = true
                    }) {
                        plusImage
                            .frame(width: 18, height: 18)
                    }
                }
            }
            .overlay {
                if books.isEmpty {
                    ContentUnavailableView(label: {
                        Label("No books added", systemImage: "book.closed.fill")
                    }, description: {
                        Text("Add some books to see them listed here.")
                    }, actions: {
                        Button("Add book") { showingAddBookSheet = true }
                    })
                    .offset(y: -60)
                }
            }
        }
    }
}
