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
    
    let character: BookCharacter
    let book: Book
    
    var body: some View {
        ScrollView {
            Text(character.characterTitle)
                .font(.title2)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
                .padding(.horizontal)
            Text(character.notes)
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
        }
//        .padding()
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.large)
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
