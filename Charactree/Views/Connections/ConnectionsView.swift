//
//  ConnectionsView.swift
//  Charactree
//
//  Created by Eduardo Gonzalez Melgoza on 29/02/24.
//

import SwiftUI
import SwiftData


struct ConnectionsView: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Connection.relatedCharacter) var connections: [Connection]
    @Query(sort: \BookCharacter.name) var allCharacters: [BookCharacter]
    
    let character: BookCharacter
    let book: Book
    
    var body: some View {
        Text("Related characters")
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .font(.title2)
            .bold()
        LazyVGrid(columns: columnLayout) {
            ForEach(connections) { connection in
                if connection.thisCharacter == character.name {
                    HStack {
                        ForEach(allCharacters) { characterFromAll in
                            if connection.relatedCharacter == characterFromAll.name {
                                ConnectionCard(book: book, character: characterFromAll, connection: connection)
                            }
                        }
                    }
                }
            }
        }
    }
}
