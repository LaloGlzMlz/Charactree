//
//  BookListCell.swift
//  Charactree
//
//  Created by Eduardo Gonzalez Melgoza on 29/02/24.
//

import SwiftUI
import SwiftData

struct BookListCell: View {
    let book: Book
    
    var body: some View {
        HStack {
            Text(book.title)
        }
    }
}
