//
//  AllMoviesView.swift
//  MovieDatabase
//
//  Created by RithikaP10 on 31/10/24.
//
import SwiftUI

struct AllMoviesView: View {
    @ObservedObject var viewModel: MovieViewModel

    var body: some View {
        List(viewModel.movies, id: \.title) { movie in
            NavigationLink(destination: MovieDetailView(movie: movie)) {
                MovieCell(movie: movie)
            }
        }
        .navigationTitle("All Movies")
        .navigationBarTitleDisplayMode(.inline)
    }
}

