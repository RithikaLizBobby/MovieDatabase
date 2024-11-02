//
//  MovieViewModel.swift
//  MovieDatabase
//
//  Created by RithikaP10 on 25/10/24.
//
import Foundation
import Combine

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var filteredMovies: [Movie] = []

    var years: [String] { Array(Set(movies.map { $0.year })).sorted() }
    var genres: [String] {
        Array(Set(movies.flatMap { $0.genre.components(separatedBy: ", ") })).sorted()
    }
    var directors: [String] { Array(Set(movies.map { $0.director })).sorted() }
    var actors: [String] {
        Array(Set(movies.flatMap { $0.actors.components(separatedBy: ", ") })).sorted()
    }

    init() {
        loadMovies()
    }

    func loadMovies() {
        guard let url = Bundle.main.url(forResource: "movies", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Error: Cannot find or load movies.json")
            return
        }

        do {
            let decoder = JSONDecoder()
            movies = try decoder.decode([Movie].self, from: data)
            filteredMovies = movies
            print("Successfully loaded \(movies.count) movies")
        } catch {
            print("Error decoding movies: \(error)")
        }
    }

    func filterMovies(by searchText: String) {
        if searchText.isEmpty {
            filteredMovies = movies
            return
        }

        filteredMovies = movies.filter { movie in
            movie.title.localizedCaseInsensitiveContains(searchText) ||
            movie.genre.localizedCaseInsensitiveContains(searchText) ||
            movie.director.localizedCaseInsensitiveContains(searchText) ||
            movie.actors.localizedCaseInsensitiveContains(searchText)
        }
    }

    func moviesForYear(_ year: String) -> [Movie] {
        movies.filter { $0.year == year }
    }

    func moviesForGenre(_ genre: String) -> [Movie] {
        movies.filter { $0.genre.contains(genre) }
    }

    func moviesForDirector(_ director: String) -> [Movie] {
        movies.filter { $0.director == director }
    }

    func moviesForActor(_ actor: String) -> [Movie] {
        movies.filter { $0.actors.contains(actor) }
    }
}
