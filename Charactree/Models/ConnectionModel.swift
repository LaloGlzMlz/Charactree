//
//  ConnectionModel.swift
//  Charactree
//
//  Created by Eduardo Gonzalez Melgoza on 29/02/24.
//

import Foundation
import SwiftData


@Model
final class Connection : Identifiable {
    @Attribute(.unique)
    let id: UUID = UUID()
    
    var thisCharacter: BookCharacter
    var isTo: String = ""
    
    var relatedCharacter: BookCharacter
    
    init(thisCharacter: BookCharacter, isTo: String, relatedCharacter: BookCharacter) {
        self.thisCharacter = thisCharacter
        self.isTo = isTo
        self.relatedCharacter = relatedCharacter
    }
}
