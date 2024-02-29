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
    let character: BookCharacter
    let book: Book
    
    var body: some View {
        Text(character.name)
        Text(book.title)
    }
}
