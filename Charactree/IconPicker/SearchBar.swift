//
//  SearchBar.swift
//  Charactree
//
//  Created by Eduardo Gonzalez Melgoza on 29/02/24.
//

import SwiftUI


struct SearchBar: View {
    
    @Binding var searchText: String
    let label: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            
            TextField(label, text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.searchText = ""
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
            }
        }
    }
}

#Preview {
    SearchBar(searchText: .constant(""), label: "Search...")
}
