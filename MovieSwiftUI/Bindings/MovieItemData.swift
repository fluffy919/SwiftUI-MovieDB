//
//  MovieItemData.swift
//  MovieSwiftUI
//
//  Created by David S on 06/06/19.
//  Copyright © 2019 David S. All rights reserved.
//

import SwiftUI
import Combine

final class MovieItemData: ObservableObject {
    
    private let movieService: MovieService
    
    @Published var movie: Movie
    
    init(movieService: MovieService, movie: Movie) {
        self.movieService = movieService
        self.movie = movie
    }
    
    func loadMovie() {
        movieService.fetchMovie(id: movie.id, successHandler: {[weak self] (movie) in
            self?.movie = movie
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
}
