//
//  AltBookCard.swift
//  Charactree
//
//  Created by Eduardo Gonzalez Melgoza on 01/03/24.
//

import SwiftUI

struct AltBookCard: View {
    @Environment(\.modelContext) private var context
    
    @State private var isEditing = false
    
    let book: Book
    
    var body: some View {
        ZStack {
            // Cover
            RoundedRectangle(cornerRadius: 3)
                .frame(width: 200, height: 300)
                .foregroundStyle(LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: convertStringToColor(bookColorString: book.bookColor), location: 0.0),
                        .init(color: Color.black.opacity(0.8), location: 2.5)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .shadow(radius: 8)
                .opacity(0.9)
            
            // Spine line
            Rectangle()
                .foregroundStyle(LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: convertStringToColor(bookColorString: book.bookColor), location: 0.0),
                        .init(color: Color.black, location: 3.0)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                ))
                .frame(width: 1, height: 300)
                .offset(x: -89)
                .opacity(0.3)
                .shadow(radius: 5)
            Rectangle()
                .foregroundStyle(LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: convertStringToColor(bookColorString: book.bookColor), location: 0.0),
                        .init(color: Color.black, location: 1.0)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                ))
                .frame(width: 1, height: 300)
                .offset(x: -89)
                .opacity(0.3)
                .shadow(radius: 1)
            // Top spine rim lighting (horizontal line)
            RoundedRectangle(cornerRadius: 2)
                .foregroundStyle(LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: convertStringToColor(bookColorString: book.bookColor), location: 0.0),
                        .init(color: Color.white, location: 0.3)
                    ]),
                    startPoint: .leading,
                    endPoint: .trailing
                ))
                .frame(width: 200, height: 1)
                .offset(y: -149)
                .opacity(0.4)
            // Left spine rim lighting (vertical line)
            RoundedRectangle(cornerRadius: 2)
                .foregroundStyle(LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: convertStringToColor(bookColorString: book.bookColor), location: 0.0),
                        .init(color: Color.white, location: 1.0)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                ))
                .frame(width: 1, height: 300)
                .offset(x: 99)
                .opacity(0.5)
            
            VStack {
                // Title
                Text(book.title)
                    .lineLimit(4)
                    .font(.title)
                    .foregroundStyle(.white)
                    .frame(width: 170, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .offset(x: 4)
                    .opacity(0.8)
                    .bold()
                
                // Author
                Text(book.author)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .font(.title3)
                    .foregroundStyle(.black)
                    .frame(width: 170, alignment: .leading)
                    .offset(x: 4)
                    .opacity(0.75)
                    .bold()
                
                Spacer()
                
                // Icon
                Image(systemName: book.icon)
                    .font(.system(size: 80))
                    .foregroundStyle(.white)
                    .offset(x: 4)
                    .opacity(0.7)
                
                Spacer()
            }
            .frame(height: 285)
        }
        .padding()
        .contextMenu(ContextMenu(menuItems: {
            Button("Edit") {
                isEditing = true
            }
            
            Button("Delete", role: .destructive) {
                context.delete(book)
            }
        }))
        .sheet(isPresented: $isEditing, content: {
            UpdateBookView(book: book)
        })
    }
    
    func convertStringToColor(bookColorString: String) -> Color {
        let bookColor = Color.fromHex(bookColorString)
        return bookColor
    }
}
