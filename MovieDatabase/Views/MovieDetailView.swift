//
//  MovieDetailView.swift
//  MovieDatabase
//
//  Created by RithikaP10 on 25/10/24.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @State private var selectedRatingSource: String?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                AsyncImage(url: URL(string: movie.poster)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .overlay(
                            Image(systemName: "photo")
                                .foregroundColor(.gray)
                        )
                }
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .cornerRadius(12)
                .shadow(radius: 4)

                VStack(alignment: .leading, spacing: 16) {

                    VStack(alignment: .leading, spacing: 8) {
                        Text(movie.title)
                            .font(.title)
                            .bold()

                        Text(movie.plot)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }

                    Divider()

                     VStack(alignment: .leading, spacing: 8) {
                        Text("Cast & Crew")
                            .font(.headline)

                        VStack(alignment: .leading, spacing: 4) {
                            Text("Director:")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text(movie.director)
                                .font(.body)

                            Text("Actors:")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .padding(.top, 4)
                            Text(movie.actors)
                                .font(.body)
                        }
                    }

                    Divider()


                    VStack(alignment: .leading, spacing: 8) {
                        Text("Details")
                            .font(.headline)

                        VStack(alignment: .leading, spacing: 4) {
                            DetailRow(label: "Released", value: movie.released)
                            DetailRow(label: "Genre", value: movie.genre)
                            DetailRow(label: "Runtime", value: movie.runtime)
                            DetailRow(label: "Rated", value: movie.rated)
                        }
                    }

                    Divider()

                  
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Ratings")
                            .font(.headline)

                        RatingPicker(ratings: movie.ratings, selectedSource: $selectedRatingSource)

                        if let selectedSource = selectedRatingSource,
                           let rating = movie.ratings.first(where: { $0.source == selectedSource }) {
                            RatingView(rating: rating)
                                .frame(maxWidth: .infinity)
                                .padding(.top, 8)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailRow: View {
    let label: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text(value)
                .font(.body)
        }
    }
}
