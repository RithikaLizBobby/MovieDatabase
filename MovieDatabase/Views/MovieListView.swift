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
