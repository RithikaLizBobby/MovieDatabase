//
//  SearchBar.swift
//  MovieDatabase
//
//  Created by RithikaP10 on 25/10/24.
//
import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField("Search movies by title/actor/genre/direct...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            if !text.isEmpty {
                Button(action: { text = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
    }
}
