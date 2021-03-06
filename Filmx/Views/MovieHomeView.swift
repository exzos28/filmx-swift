//
//  MovieHomeView.swift
//  Filmx
//
//  Created by Oleksandr Kurinnyi on 09/04/2022.
//

import SwiftUI

struct MovieHomeView: View {
    
    @StateObject private var movieHomeState = MovieHomeState()
    
    var body: some View {
        List {
            ForEach(movieHomeState.sections) {
                MovieThumbnailCarouselView(
                    title: $0.title,
                    movies: $0.movies,
                    thumbnailType: $0.thumbnailType
                )
                .listRowInsets(.init(top: 8, leading: 0, bottom: 8, trailing: 0))
                .listRowSeparator(.hidden)
            }
        }
        .task { loadMovies(invalidateCache: false) }
        .refreshable { loadMovies(invalidateCache: true) }
        .overlay(
            DataFetchPhaseOverlayView(
                phase: movieHomeState.phase,
                retryAction: { loadMovies(invalidateCache: true) }
            )
        )
        .listStyle(.plain)
        .navigationBarHidden(true)
    }
    
    @Sendable
    private func loadMovies(invalidateCache: Bool) {
        Task { await movieHomeState.loadMoviesFromAllEndpoints(invalidateCache: invalidateCache) }
    }
    
}

struct MovieHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieHomeView()
        }
    }
}

