//
//  MovieDatabaseTests.swift
//  MovieDatabaseTests
//
//  Created by RithikaP10 on 25/10/24.
//
import XCTest
@testable import MovieDatabase

final class MovieDatabaseTests: XCTestCase {
    var viewModel: MovieViewModel!
    var sampleMovies: [Movie]!

    override func setUpWithError() throws {
        super.setUp()
        viewModel = MovieViewModel()

        //Creating sample test data
        sampleMovies = [
            Movie(
                title: "The Dark Knight",
                year: "2008",
                rated: "PG-13",
                released: "18 Jul 2008",
                runtime: "152 min",
                genre: "Action, Crime, Drama",
                director: "Christopher Nolan",
                writer: "Christopher",
                actors: "Christian Bale, Heath Ledger, Aaron Eckhart",
                plot: "Batman fights the Joker in Gotham City",
                language: "English",
                poster: "https://example.com/poster1.jpg",
                ratings: [
                    Rating(source: "Internet Movie Database", value: "9.0/10"),
                    Rating(source: "Rotten Tomatoes", value: "94%")
                ]
            ),
            Movie(
                title: "Inception",
                year: "2010",
                rated: "PG-13",
                released: "16 Jul 2010",
                runtime: "148 min",
                genre: "Action, Sci-Fi",
                director: "Christopher Nolan",
                writer: "Christopher",
                actors: "Leonardo DiCaprio, Joseph Gordon-Levitt",
                plot: "A thief enters dreams to plant ideas",
                language: "English, Japanese",
                poster: "https://example.com/poster2.jpg",
                ratings: [
                    Rating(source: "Internet Movie Database", value: "8.8/10"),
                    Rating(source: "Rotten Tomatoes", value: "87%")
                ]
            ),
            Movie(
                title: "The Godfather",
                year: "1972",
                rated: "R",
                released: "24 Mar 1972",
                runtime: "175 min",
                genre: "Crime, Drama",
                director: "Francis Ford Coppola",
                writer: "Christopher",
                actors: "Marlon Brando, Al Pacino, James Caan",
                plot: "The aging patriarch of an organized crime dynasty transfers control to his son",
                language: "English, Italian",
                poster: "https://example.com/poster3.jpg",
                ratings: [
                    Rating(source: "Internet Movie Database", value: "9.2/10"),
                    Rating(source: "Rotten Tomatoes", value: "98%")
                ]
            )
        ]
    }

    override func tearDownWithError() throws {
        viewModel = nil
        sampleMovies = nil
        super.tearDown()
    }
    //Loading movies

    func testLoadMovies() {
        viewModel.loadMovies()
        XCTAssertEqual(viewModel.movies.count, 19)
        XCTAssertFalse(viewModel.movies.isEmpty)
    }

    //Movie Filtering Tests

    func testFilterMoviesByTitle() {
        viewModel.movies = sampleMovies
        viewModel.filterMovies(by: "Dark Knight")
        XCTAssertEqual(viewModel.filteredMovies.count, 1)
        XCTAssertEqual(viewModel.filteredMovies.first?.title, "The Dark Knight")
    }

    func testFilterMoviesByGenre() {
        viewModel.movies = sampleMovies
        viewModel.filterMovies(by: "Sci-Fi")
        XCTAssertEqual(viewModel.filteredMovies.count, 1)
        XCTAssertEqual(viewModel.filteredMovies.first?.title, "Inception")
    }

    func testFilterMoviesByDirector() {
        viewModel.movies = sampleMovies
        viewModel.filterMovies(by: "Nolan")
        XCTAssertEqual(viewModel.filteredMovies.count, 2)
    }

    func testFilterMoviesByActor() {
        viewModel.movies = sampleMovies
        viewModel.filterMovies(by: "DiCaprio")
        XCTAssertEqual(viewModel.filteredMovies.count, 1)
        XCTAssertEqual(viewModel.filteredMovies.first?.title, "Inception")
    }

    func testEmptySearchReturnsAllMovies() {
        viewModel.movies = sampleMovies
        viewModel.filterMovies(by: "")
        XCTAssertEqual(viewModel.filteredMovies.count, sampleMovies.count)
    }

    //Category Filter Tests

    func testMoviesForYear() {
        viewModel.movies = sampleMovies
        let movies2008 = viewModel.moviesForYear("2008")
        XCTAssertEqual(movies2008.count, 1)
        XCTAssertEqual(movies2008.first?.title, "The Dark Knight")
    }

    func testMoviesForGenre() {
        viewModel.movies = sampleMovies
        let actionMovies = viewModel.moviesForGenre("Action")
        XCTAssertEqual(actionMovies.count, 2)
    }

    func testMoviesForDirector() {
        viewModel.movies = sampleMovies
        let nolanMovies = viewModel.moviesForDirector("Christopher Nolan")
        XCTAssertEqual(nolanMovies.count, 2)
    }

    func testMoviesForActor() {
        viewModel.movies = sampleMovies
        let baleMovies = viewModel.moviesForActor("Christian Bale")
        XCTAssertEqual(baleMovies.count, 1)
        XCTAssertEqual(baleMovies.first?.title, "The Dark Knight")
    }

    //Category List Tests

    func testUniqueYearsList() {
        viewModel.movies = sampleMovies
        let years = viewModel.years
        XCTAssertEqual(years.count, 3)
        XCTAssertTrue(years.contains("2008"))
        XCTAssertTrue(years.contains("2010"))
        XCTAssertTrue(years.contains("1972"))
    }

    func testUniqueGenresList() {
        viewModel.movies = sampleMovies
        let genres = viewModel.genres
        XCTAssertTrue(genres.contains("Action"))
        XCTAssertTrue(genres.contains("Drama"))
        XCTAssertTrue(genres.contains("Sci-Fi"))
        XCTAssertTrue(genres.contains("Crime"))
    }

    func testUniqueDirectorsList() {
        viewModel.movies = sampleMovies
        let directors = viewModel.directors
        XCTAssertEqual(directors.count, 2)
        XCTAssertTrue(directors.contains("Christopher Nolan"))
        XCTAssertTrue(directors.contains("Francis Ford Coppola"))
    }

    func testUniqueActorsList() {
        viewModel.movies = sampleMovies
        let actors = viewModel.actors
        XCTAssertTrue(actors.contains("Christian Bale"))
        XCTAssertTrue(actors.contains("Leonardo DiCaprio"))
        XCTAssertTrue(actors.contains("Marlon Brando"))
    }

    //Rating Tests

    func testMovieRatings() {
        viewModel.movies = sampleMovies
        let darkKnight = sampleMovies.first!
        XCTAssertEqual(darkKnight.ratings.count, 2)
        XCTAssertEqual(darkKnight.ratings.first?.source, "Internet Movie Database")
        XCTAssertEqual(darkKnight.ratings.first?.value, "9.0/10")
    }
}
