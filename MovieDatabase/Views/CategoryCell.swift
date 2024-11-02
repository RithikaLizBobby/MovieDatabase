//
//  CategoryCell.swift
//  MovieDatabase
//
//  Created by RithikaP10 on 25/10/24.
//
//to display a single category cell in the MovieDatabase app
import SwiftUI

struct CategoryCell: View {
    let title: String
    let category: MovieDatabaseViewModel.CategoryType
    @Binding var expandedCategory: MovieDatabaseViewModel.CategoryType?
    @ObservedObject var viewModel: MovieDatabaseViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                withAnimation {
                    if expandedCategory == category {
                        expandedCategory = nil
                    } else {
                        expandedCategory = category
                    }
                }
            }) {
                HStack {
                    Text(title)
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: expandedCategory == category ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 8)
            }

            if expandedCategory == category {
                ForEach(viewModel.uniqueValues(for: category), id: \.self) { value in
                    NavigationLink(destination: MovieListView(movies: viewModel.movies.filter { movie in
                        switch category {
                        case .year: return movie.year == value
                        case .genre: return movie.genre.contains(value)
                        case .director: return movie.director == value
                        case .actor: return movie.actors.contains(value)
                        case .all: return true
                        }
                    })) {
                        Text(value)
                            .font(.subheadline)
                            .padding(.leading)
                            .padding(.vertical, 4)
                    }
                }
            }
        }
    }
}

