//
//  CategoryListView.swift
//  MovieDatabase
//
//  Created by RithikaP10 on 25/10/24.
//
//a view displaying a list of categories for browsing movies
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
            CategoryCell(title: "All Movies", category: .all, expandedCategory: $expandedCategory, viewModel: viewModel)

        }
    }
}

 
