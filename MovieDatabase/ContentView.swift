import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MovieViewModel()
    @State private var searchText = ""
    @State private var expandedSection: MovieCategory?

    enum MovieCategory: String, CaseIterable {
        case year = "Year"
        case genre = "Genre"
        case directors = "Directors"
        case actors = "Actors"
    }

    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                SearchBar(text: $searchText)
                    .onChange(of: searchText) { newValue in
                        viewModel.filterMovies(by: newValue)
                    }
                    .padding()

                if searchText.isEmpty {
                    // Category List
                    List {
                        ForEach(MovieCategory.allCases, id: \.self) { category in
                            Section {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(category.rawValue)
                                            .font(.headline)
                                        Spacer()
                                        Image(systemName: expandedSection == category ? "chevron.up" : "chevron.down")
                                    }
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        withAnimation {
                                            if expandedSection == category {
                                                expandedSection = nil
                                            } else {
                                                expandedSection = category
                                            }
                                        }
                                    }

                                    if expandedSection == category {
                                        categoryContent(for: category)
                                            .padding(.top, 8)
                                    }
                                }
                            }
                        }

                        // All Movies Button
                        Section {
                            NavigationLink(destination: AllMoviesView(viewModel: viewModel)) {
                                Text("All Movies")
                                    .font(.headline)
                                    .foregroundColor(.blue)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue.opacity(0.1))
                                    .cornerRadius(8)
                            }
                        }
                    }
                } else {
                    // Search Results
                    List {
                        ForEach(viewModel.filteredMovies, id: \.title) { movie in
                            NavigationLink(destination: MovieDetailView(movie: movie)) {
                                MovieCell(movie: movie)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Movie Database")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            viewModel.loadMovies()
        }
    }

    @ViewBuilder
    private func categoryContent(for category: MovieCategory) -> some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 12) {
                switch category {
                case .year:
                    ForEach(viewModel.years, id: \.self) { year in
                        NavigationLink(destination: MovieListView(movies: viewModel.moviesForYear(year))) {
                            Text(year)
                                .foregroundColor(.blue)
                        }
                    }
                case .genre:
                    ForEach(viewModel.genres, id: \.self) { genre in
                        NavigationLink(destination: MovieListView(movies: viewModel.moviesForGenre(genre))) {
                            Text(genre)
                                .foregroundColor(.blue)
                        }
                    }
                case .directors:
                    ForEach(viewModel.directors, id: \.self) { director in
                        NavigationLink(destination: MovieListView(movies: viewModel.moviesForDirector(director))) {
                            Text(director)
                                .foregroundColor(.blue)
                        }
                    }
                case .actors:
                    ForEach(viewModel.actors, id: \.self) { actor in
                        NavigationLink(destination: MovieListView(movies: viewModel.moviesForActor(actor))) {
                            Text(actor)
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
    }
