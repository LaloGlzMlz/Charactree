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
    
    @Bindable var character: BookCharacter
    let book: Book
    
    var body: some View {
        ScrollView {
            Text(character.characterTitle)
                .font(.title2)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
                .padding(.horizontal)
            
            TextField("Notes", text: $character.notes,  axis: .vertical)
                .lineLimit(1...10)
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
        }
        .navigationTitle(character.name)
        .toolbar {
            Button("Edit") {
                isEditing = true
            }
        }
        .sheet(isPresented: $isEditing, content: {
            UpdateCharacterView(character: character)
        })
    }
}
