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
    var relatedCharacter: String = ""
    var isTo: String = ""
    var thisCharacter: String = ""
    
    init(relatedCharacter: String, isTo: String, thisCharacter: String) {
        self.relatedCharacter = relatedCharacter
        self.isTo = isTo
        self.thisCharacter = thisCharacter
    }
}
