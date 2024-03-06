//
//  CharactersView.swift
//  Charactree
//
//  Created by Eduardo Gonzalez Melgoza on 29/02/24.
//

import SwiftUI
import SwiftData


struct CharactersView: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \BookCharacter.name) var characters: [BookCharacter]
    
    @State private var showingAddCharacterSheet = false
    @State private var filteredCharacters: [BookCharacter] = []
    @State private var isEditing = false
    
    let book: Book
    
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(characters) { character in
                        if character.book == book {
                            NavigationLink(destination: CharacterDetailView(character: character, book: book)) {
                                CharacterCard(character: character)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
            .sheet(isPresented: $showingAddCharacterSheet) { AddCharacterSheet(book: book) }
            .toolbar {
                if !characters.isEmpty {
                    Button("Edit") {
                        isEditing.toggle()
                    }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .primaryAction) {
                    Button(action: {
                        showingAddCharacterSheet = true
                    }) {
                        Label(
                            NSLocalizedString("add.character", comment: "Text for the plus button to add a character in the character view"),
                            systemImage: "plus"
                        )
                    }
                }
            }
            .sheet(isPresented: $isEditing, content: {
                UpdateBookView(book: book)
            })
//            .overlay {
//                if !characters.contains(where: { $0.book == book }) {
//                    ContentUnavailableView(label: {
//                        Label("No characters added", systemImage: "person.3.fill")
//                    }, description: {
//                        Text("Add some characters to see them listed here.")
//                    }, actions: {
//                        Button("Add character") { showingAddCharacterSheet = true }
//                    })
//                    .offset(y: -60)
//                }
//            }
        }
        .navigationTitle(book.title)
        .onAppear {
            filteredCharacters = characters.filter{$0.book == book}
        }
    }
}
