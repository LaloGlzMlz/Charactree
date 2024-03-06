//
//  BookModel.swift
//  Charactree
//
//  Created by Eduardo Gonzalez Melgoza on 29/02/24.
//

import Foundation
import SwiftData



@Model
final class Book : Identifiable {
    @Attribute(.unique)
    let id: UUID = UUID()
    var title: String = ""
    var author: String = ""
    var bookColor: String = ""
    var icon: String = ""
    var dateCreated: Date
    @Relationship(deleteRule: .cascade)
    var characters: [BookCharacter]
    
    init(title: String, author: String, bookColor: String, icon: String, dateCreated: Date, characters: [BookCharacter] = []) {
        self.title = title
        self.author = author
        self.bookColor = bookColor
        self.icon = icon
        self.dateCreated = dateCreated
        self.characters = characters
    }
}
