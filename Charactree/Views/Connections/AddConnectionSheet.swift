//
//  AddConnectionSheet.swift
//  Charactree
//
//  Created by Eduardo Gonzalez Melgoza on 29/02/24.
//

import SwiftUI
import SwiftData
import Foundation


struct AddConnectionSheet: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @Query(sort: \BookCharacter.name)
    var characters: [BookCharacter]
    
    @State private var isCharacterPickerPresented: Bool = false
    
    @State private var relatedCharacter: String = ""
    @State private var isTo: String = ""
    @State private var selectedCharacter: BookCharacter?
    @State private var filteredCharacters: [BookCharacter] = []
    
    @State private var bidireccionalConnectionToggle = true
    @State private var otherSideCharacter: BookCharacter?
    @State private var otherWayConnectionType: String = ""
    
    let character: BookCharacter
    let book: Book
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    
                    HStack {
                        Text("Character")
                        Spacer()
                        Button {
                            isCharacterPickerPresented.toggle()
                        } label: {
                            if selectedCharacter != nil {
                                HStack {
                                    Text(selectedCharacter!.name)
                                    Label("Edit selected characer", systemImage: "pencil")
                                        .labelStyle(.iconOnly)
                                }
                            } else {
                                Label("Select a character:", systemImage: "person.fill.badge.plus")
                                    .labelStyle(.iconOnly)
                            }
                        }
                    }
                    
//                    LabeledContent {
//                        Text("Choose a character")
//                    } label: {
//                        Text("\(selectedCharacter?.name ?? "") is \(character.name)'s")
//                            .padding(.trailing, 50)
//                    }
//                    
//                    Picker("Select a character that is related to \(character.name)", selection: $selectedCharacter) {
//                        ForEach(filteredCharacters, id: \.self) { (character: BookCharacter) in
//                            Text("\(character.name)")
//                        }
//                    }
//                    .pickerStyle(.menu)
//                    .onChange(of: selectedCharacter) {
//                        otherSideCharacter = selectedCharacter
//                    }
                    
                    Toggle("Two-way connection?", isOn: $bidireccionalConnectionToggle)
                    
                    LabeledContent {
                        TextField("How are they related?", text: $isTo)
                            .textInputAutocapitalization(.sentences)
                    } label: {
                        Text("\(selectedCharacter?.name ?? "") is \(character.name)'s")
                            .padding(.trailing, 50)
                    }
                    
                    if bidireccionalConnectionToggle {

                        LabeledContent {
                            TextField("How are they related?", text: $otherWayConnectionType)
                                .textInputAutocapitalization(.sentences)
                        } label: {
                            Text("\(character.name) is \(selectedCharacter?.name ?? "")'s")
                                .padding(.trailing, 50)
                        }
                    }
                }
            }
            .onAppear {
                // Obtain only characters who's book equals the book tapped in the beginning
                filteredCharacters = characters.filter{$0.book == book}
                selectedCharacter = filteredCharacters.first!
            }
            .navigationTitle(character.name)
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        
                        if let selectedCharacter = selectedCharacter,
                           let otherSideCharacter = otherSideCharacter {
                            
                            let connection = Connection (
                                thisCharacter: character,
                                isTo: isTo,
                                relatedCharacter: selectedCharacter
                            )
                            
                            let otherWayConnection = Connection (
                                thisCharacter: selectedCharacter,
                                isTo: otherWayConnectionType,
                                relatedCharacter: character
                            )
                            
                            context.insert(connection)
                            
                            if !(!bidireccionalConnectionToggle || otherWayConnectionType.isEmpty) {
                                context.insert(otherWayConnection)
                            }
                            dismiss()
                        }
                    }
                }
            }
            .sheet(isPresented: $isCharacterPickerPresented) {
                VStack(alignment: .leading) {
                    List {
                        ForEach(filteredCharacters) { character in
                            Button {
                                selectedCharacter = character
                                otherSideCharacter = selectedCharacter
                                isCharacterPickerPresented = false
                            } label: {
                                HStack {
                                    Text(character.name)
                                    Spacer()
                                    if selectedCharacter == character {
                                        Label("Selected Character", systemImage: "checkmark.circle.fill")
                                            .labelStyle(.iconOnly)
                                    } else {
                                        Label("Character not selected", systemImage: "circle")
                                            .labelStyle(.iconOnly)
                                    }
                                }
                            }
                        }
                    }
                    .listStyle(.inset)
                }
                .padding(.top)
                .presentationDetents([.medium,.large])
                .presentationContentInteraction(.scrolls)
            }
        }
    }
}

