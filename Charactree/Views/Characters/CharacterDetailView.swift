//
//  CharacterDetailView.swift
//  Charactree
//
//  Created by Eduardo Gonzalez Melgoza on 29/02/24.
//

import SwiftUI
import SwiftData
import Foundation

struct CharacterDetailView: View {
    @State private var isEditing = false
    @State private var showingAddConnectionSheet = false
    
    @Bindable var character: BookCharacter
    let book: Book
    
    var body: some View {
        let plusImage = Image(systemName: "plus").resizable() // prefedine icon to load from beginning
        
        ScrollView {
            VStack {
                Text(character.characterTitle)
                    .font(.title2)
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
//                    .padding(.bottom)
                    .padding(.horizontal)
                
                TextField("Notes", text: $character.notes,  axis: .vertical)
                    .lineLimit(1...10)
                    .padding(.horizontal)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                
                ConnectionsView(character: character, book: book)
            }
        }
        .navigationTitle(character.name)
        .sheet(isPresented: $showingAddConnectionSheet) { AddConnectionSheet(character: character, book: book) }
        .toolbar {
            Button("Edit") {
                isEditing = true
            }
            Button(action: {
                showingAddConnectionSheet = true
            }) {
                plusImage
                    .frame(width: 18, height: 18)
            }
        }
        .sheet(isPresented: $isEditing, content: {
            UpdateCharacterView(character: character)
        })
    }
    
    
    
    
    
}
