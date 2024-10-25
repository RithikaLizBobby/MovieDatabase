//
//  CategoryListView.swift
//  MovieDatabase
//
//  Created by RithikaP10 on 25/10/24.
//

import SwiftUI

struct CategoryListView: View {
    @ObservedObject var viewModel: MovieDatabaseViewModel
    @State private var expandedCategory: MovieDatabaseViewModel.CategoryType?

    var body: some View {
        List {
            CategoryCell(title: "Year", category: .year, expandedCategory: $expandedCategory, viewModel: viewModel)
            CategoryCell(title: "Genre", category: .genre, expandedCategory: $expandedCategory, viewModel: viewModel)
            CategoryCell(title: "Directors", category: .director, expandedCategory: $expandedCategory, viewModel: viewModel)
            CategoryCell(title: "Actors", category: .actor, expandedCategory: $expandedCategory, viewModel: viewModel)
            NavigationLink("All Movies") {
                MovieListView(movies: viewModel.movies)
            }
        }
    }
}
