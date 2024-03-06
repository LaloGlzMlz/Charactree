//
//  UpdateCharacterView.swift
//  Charactree
//
//  Created by Eduardo Gonzalez Melgoza on 29/02/24.
//

import SwiftUI
import SwiftData
import Foundation

struct UpdateCharacterView: View {
    @Environment(\.dismiss)
    private var dismiss: DismissAction
    
    @Query(sort: \Connection.relatedCharacter) var connections: [Connection]
    
    @State private var isPresented = false
    @State private var thisCharFilteredConnections: [Connection] = []
    @State private var relatedCharsFilteredConnections: [Connection] = []
    
    @Bindable var character: BookCharacter
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    LabeledContent {
                        TextField("Character name", text: $character.name)
                            .textInputAutocapitalization(.words)
                    } label: {
                      Text("Name")
                            .padding(.trailing, 50)
                    }
                    
                    LabeledContent {
                        TextField("Character title", text: $character.characterTitle)
                            .textInputAutocapitalization(.sentences)
                    } label: {
                      Text("Title")
                            .padding(.trailing, 61)
                    }
                    
                    LabeledContent {
                        TextField("Notes", text: $character.notes,  axis: .vertical)
                            .lineLimit(1...10)
                    } label: {
                        Text("Notes")
                            .padding(.trailing, 50)
                    }
                }
                
                Section {
                    LabeledContent {
                        Button(action: {
                            isPresented.toggle()
                        }) {
                            Image(systemName: character.icon)
                                .font(.title)
                                .sheet(isPresented: $isPresented, content: {
                                    SymbolsPicker(selection: $character.icon, title: "Pick a symbol", autoDismiss: true)
                                })
                                .foregroundStyle(Color.black)
                        }
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                    } label: {
                      Text("Icon")
                            .padding(.trailing)
                    }
                }
            }
            .navigationTitle("Editing \(character.name)")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Done") {
                        for thisCharFilteredConnection in thisCharFilteredConnections {
                            thisCharFilteredConnection.thisCharacter = character
                            
                        }
                        for relatedCharFilteredConnection in relatedCharsFilteredConnections {
                            relatedCharFilteredConnection.relatedCharacter = character
                        }
                        dismiss()
                    }
                }
            }
        }
        .onAppear {
            thisCharFilteredConnections = connections.filter{$0.thisCharacter == character}
            relatedCharsFilteredConnections = connections.filter{$0.relatedCharacter == character}
        }
    }
}
