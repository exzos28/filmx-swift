//
//  MovieListState.swift
//  Filmx
//
//  Created by Oleksandr Kurinnyi on 09/04/2022.
//

import Foundation


class MovieListState: ObservableObject {
    
    @Published var movies: [Movie]?
    @Published var isLoading: Bool = false
    @Published var error: NSError?

    private let movieService: MovieService
    
    init(movieService: MovieService = MovieStore.shared) {
        self.movieService = movieService
    }
    
    func loadMovies(with endpoint: MovieListEndpoint) async {
        self.movies = nil
        self.isLoading = true
        
        do {
            let movies = try await movieService.fetchMovies(from: endpoint)
            self.isLoading = false
            self.movies = movies
        } catch {
            self.isLoading = false
            self.error = error as NSError
        }
    }
    
}

