//
//  CharacterDetailView.swift
//  Charactree
//
//  Created by Eduardo Gonzalez Melgoza on 29/02/24.
//

import SwiftUI
import SwiftData
import Foundation

struct CharacterDetailView: View {
    let character: BookCharacter
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack {
                
                RoundedRectangle(cornerRadius: 20)
                    .opacity(0.8)
                    .foregroundStyle(LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: convertStringToColor(bookColorString: character.characterColor), location: 0.0),
                            .init(color: Color.black, location: 3.0)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                VStack {
                    Text(character.name)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    Text(book.title)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    Text(character.notes)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding()
        }
    }
}
