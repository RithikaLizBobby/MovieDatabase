//
//  MovieListView.swift
//  MovieDatabase
//
//  Created by RithikaP10 on 25/10/24.
//
import SwiftUI

struct MovieListView: View {
    let movies: [Movie]

    var body: some View {
        List(movies, id: \.title) { movie in
            NavigationLink(destination: MovieDetailView(movie: movie)) {
                MovieCell(movie: movie)
            }
        }
        .navigationTitle("Movie Database")
        .listStyle(PlainListStyle())
    }
}
