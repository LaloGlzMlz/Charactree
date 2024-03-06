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

    @Attribute(.unique)
    let id: UUID = UUID()
    
    var name: String = ""
    var characterTitle: String = ""
    var notes: String = ""
    
    @Relationship(inverse: \Book.characters)
    var book: Book
    
    var characterColor: String = ""
    var icon: String = ""

    var connections: [Connection]
    
    init(name: String, characterTitle: String, notes: String, book: Book, characterColor: String, icon: String, connections: [Connection] = []) {
        self.name = name
        self.characterTitle = characterTitle
        self.notes = notes
        self.book = book
        self.characterColor = characterColor
        self.icon = icon
        self.connections = connections
    }
}

extension BookCharacter: Comparable {
    static func < (lhs: BookCharacter, rhs: BookCharacter) -> Bool {
        lhs.name < rhs.name
    }
}
