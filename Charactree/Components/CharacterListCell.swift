//
//  CharacterListCell.swift
//  Charactree
//
//  Created by Eduardo Gonzalez Melgoza on 29/02/24.
//

import SwiftUI
import SwiftData


struct CharacterListCell: View {
    let character: BookCharacter
    
    var body: some View {
        HStack {
            Text(character.name)
        }
    }
}

