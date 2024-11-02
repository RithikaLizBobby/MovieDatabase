//
//  MovieCell.swift
//  MovieDatabase
//
//  Created by RithikaP10 on 25/10/24.
//
import SwiftUI

struct MovieCell: View {
    let movie: Movie

    var body: some View {
        HStack(spacing: 12) {
         
            AsyncImage(url: URL(string: movie.poster)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .overlay(
                        Image(systemName: "photo")
                            .foregroundColor(.gray)
                    )
            }
            .frame(width: 60, height: 90)
            .cornerRadius(8)
            .shadow(radius: 2)

            VStack(alignment: .leading, spacing: 4) {
                Text(movie.title)
                    .font(.headline)
                    .lineLimit(2)

                Text(movie.language.components(separatedBy: ",").first ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(movie.year)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding(.vertical, 4)
    }
}
