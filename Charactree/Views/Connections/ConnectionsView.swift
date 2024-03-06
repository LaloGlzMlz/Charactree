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
    
    @Query
    var connections: [Connection]
    
    @Query(sort: \BookCharacter.name) var allCharacters: [BookCharacter]
    
    @State private var showingAddConnectionSheet = false
    
    let character: BookCharacter
    let book: Book
    
    var body: some View {
        
        NavigationStack {
            HStack {
                Text("Related characters")
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .font(.title2)
                    .bold()
                
                Button("New connection") {
                    showingAddConnectionSheet = true
                }
                .padding()
            }
            
            if !connections.contains(where: { $0.thisCharacter == character }) {
                ContentUnavailableView(label: {
                    Label("No connection to other characters added", systemImage: "person.line.dotted.person.fill")
                }, description: {
                    Text("Add connections to this character to see them listed here.")
                }, actions: {
                    Button("Add connection") { showingAddConnectionSheet = true }
                })
                .offset(y: 80)
            }
            
            ForEach(connections) { connection in
                if connection.thisCharacter == character {
                    HStack {
                        ForEach(allCharacters) { characterFromAll in
                            if connection.relatedCharacter == characterFromAll {
                                ConnectionCard(book: book, character: characterFromAll, connection: connection)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showingAddConnectionSheet) { AddConnectionSheet(character: character, book: book) }
    }
}
