//
//  MovieDatabaseView.swift
//  MovieDatabase
//
//  Created by RithikaP10 on 25/10/24.
//

import SwiftUI

struct MovieDatabaseView: View {
    @StateObject private var viewModel = MovieDatabaseViewModel()

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText)
                    .onChange(of: viewModel.searchText) { _ in
                        viewModel.filterMovies(searchText: viewModel.searchText)
                    }

                if viewModel.searchText.isEmpty {
                    CategoryListView(viewModel: viewModel)
                } else {
                    MovieListView(movies: viewModel.filteredMovies)
                }
            }
            .navigationTitle("Movie Database")
        }
    }
}
