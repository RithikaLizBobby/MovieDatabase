//
//  RatingViews.swift
//  MovieDatabase
//
//  Created by RithikaP10 on 25/10/24.
//
//set of views for selecting and displaying movie ratings

import SwiftUI

struct RatingPicker: View {
    let ratings: [Rating]
    @Binding var selectedSource: String?

    var body: some View {
        Picker("Rating Source", selection: $selectedSource) {
            Text("Select Source").tag(nil as String?)
            ForEach(ratings, id: \.source) { rating in
                Text(rating.source).tag(rating.source as String?)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct RatingView: View {
    let rating: Rating

    var body: some View {
        ZStack {

            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 8)
                .frame(width: 100, height: 100)


            Circle()
                .trim(from: 0, to: ratingProgress)
                .stroke(ratingColor, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut, value: ratingProgress)


            VStack {
                Text(rating.value)
                    .font(.title2)
                    .bold()
                Text(rating.source)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }

    private var ratingProgress: Double {
        let value = rating.value
        if value.hasSuffix("/10") {
            return Double(value.dropLast(3))! / 10.0
        } else if value.hasSuffix("%") {
            return Double(value.dropLast(1))! / 100.0
        } else if value.hasSuffix("/100") {
            return Double(value.dropLast(4))! / 100.0
        }
        return 0
    }

    private var ratingColor: Color {
        if ratingProgress >= 0.7 {
            return .green
        } else if ratingProgress >= 0.4 {
            return .yellow
        } else {
            return .red
        }
    }
}
