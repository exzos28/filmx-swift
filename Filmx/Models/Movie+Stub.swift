//
//  Movie+Stub.swift
//  Filmx
//
//  Created by Oleksandr Kurinnyi on 09/04/2022.
//

import Foundation


extension Movie {
    static var stubbedMovies: [Movie] {
        let response: MovieResponse? = try? Movie.loadAndDecodeJSON(filename: "movie_list")
        return response!.results
    }
    
    static var stubbedMovie: Movie {
        stubbedMovies[0]
    }
    
    static private func loadAndDecodeJSON<D: Decodable>(filename: String) throws -> D? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        let data = try Data(contentsOf: url)
        let jsonDecoder = Utils.jsonDecoder
        let decodedModel = try jsonDecoder.decode(D.self, from: data)
        return decodedModel
    }
}

extension MovieSection {
    static var stubs: [MovieSection] {
        let stubbedMovies = Movie.stubbedMovies
        return MovieListEndpoint.allCases.map {
            MovieSection(movies: stubbedMovies.shuffled(), endpoint: $0)
        }
    }
}
