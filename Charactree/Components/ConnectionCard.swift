//
//  ConnectionCard.swift
//  Charactree
//
//  Created by Eduardo Gonzalez Melgoza on 29/02/24.
//

import SwiftUI


struct ConnectionCard: View {
    @Environment(\.modelContext) private var context
    
    let book: Book
    let character: BookCharacter // character to send: connected character
    let connection: Connection
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .shadow(radius: 3)
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
                    .font(.system(size: 40))
                    .opacity(0.7)
                    .foregroundStyle(.white)
                VStack {
                    Text(character.name)
                        .lineLimit(1)
                        .foregroundStyle(.white)
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                        .padding(.leading, 15)
                    Text(connection.isTo)
                        .lineLimit(1)
                        .foregroundStyle(.white)
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 15)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .contextMenu(ContextMenu(menuItems: {
//            Button("Edit") {
//                isEditing = true
//            }
            
            Button("Delete connection with \(character.name)", role: .destructive) {
                context.delete(connection)
            }
        }))
//        .sheet(isPresented: $isEditing, content: {
//            UpdateBookView(book: book)
//        })
    }
    
    
}
