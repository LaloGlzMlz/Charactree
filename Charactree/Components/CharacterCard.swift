//
//  CharacterCard.swift
//  Charactree
//
//  Created by Eduardo Gonzalez Melgoza on 29/02/24.
//

import SwiftUI


struct CharacterCard: View {
    @Environment(\.modelContext) private var context
    
    @State private var isEditing = false
    
    let character: BookCharacter
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 150)
                .foregroundStyle(LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: convertStringToColor(bookColorString: character.characterColor), location: 0.0),
                        .init(color: Color.black, location: 3.0)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
            
            HStack {
                Image(systemName: character.icon)
                    .font(.system(size: 55))
                    .opacity(0.7)
                    .foregroundStyle(.white)
                VStack {
                    Text(character.name)
                        .lineLimit(2)
                        .foregroundStyle(.white)
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                        .padding(.leading, 15)
                    Text(character.characterTitle)
                        .foregroundStyle(.white)
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 15)
                }
                
                Image(systemName: "chevron.right")
                        .foregroundStyle(.white)
                        .font(.system(size: 20))
                        .padding(.trailing, 20)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading,30)
        }
        .contextMenu(ContextMenu(menuItems: {
            Button("Edit") {
                isEditing = true
            }
            
            Button("Delete", role: .destructive) {
                context.delete(character)
            }
        }))
        .sheet(isPresented: $isEditing, content: {
            UpdateCharacterView(character: character)
        })
//        .padding()
    }
    
    
}
