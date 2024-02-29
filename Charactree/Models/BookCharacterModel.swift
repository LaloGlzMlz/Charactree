//
//  BookCharacterModel.swift
//  Charactree
//
//  Created by Eduardo Gonzalez Melgoza on 29/02/24.
//

import Foundation
import SwiftData



@Model
final class BookCharacter : Identifiable {
    var name: String = ""
    var characterTitle: String = ""
    var notes: String = ""
    var book: String = ""
    var characterColor: String = ""
    var icon: String = ""
    
    init(name: String, characterTitle: String, notes: String, book: String, characterColor: String, icon: String) {
        self.name = name
        self.characterTitle = characterTitle
        self.notes = notes
        self.book = book
        self.characterColor = characterColor
        self.icon = icon
    }
}
