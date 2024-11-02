//
//  MovieDatabaseViewModel.swift
//  MovieDatabase
//
//  Created by RithikaP10 on 25/10/24.
//

import SwiftUI

class MovieDatabaseViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var searchText = ""
    @Published var selectedCategory: CategoryType?
    @Published var filteredMovies: [Movie] = []

    enum CategoryType {
        case year, genre, director, actor, all
    }

    init() {
        loadMovies()
    }

    private func loadMovies() {
        
        if let path = Bundle.main.path(forResource: "movies", ofType: "json") {
            do {
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                movies = try JSONDecoder().decode([Movie].self, from: data)
                filteredMovies = movies
            } catch {
                print("Error loading movies: \(error)")
            }
        }
    }

    func uniqueValues(for category: CategoryType) -> [String] {
        switch category {
        case .year:
            return Array(Set(movies.map { $0.year })).sorted()
        case .genre:
            return Array(Set(movies.flatMap { $0.genre.components(separatedBy: ", ") })).sorted()
        case .director:
            return Array(Set(movies.map { $0.director })).sorted()
        case .actor:
            return Array(Set(movies.flatMap { $0.actors.components(separatedBy: ", ") })).sorted()
        case .all:
            
            return ["All Movies"]
        }
    }
 
    func filterMovies(searchText: String) {
        if searchText.isEmpty {
            filteredMovies = movies
        } else {
            filteredMovies = movies.filter { movie in
                let searchableFields = [
                    movie.title,
                    movie.genre,
                    movie.director,
                    movie.actors
                ].joined(separator: " ").lowercased()

                return searchableFields.contains(searchText.lowercased())
            }
        }
    }
}
