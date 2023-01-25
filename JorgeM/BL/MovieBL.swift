//
//  MovieBL.swift
//  JorgeM
//
//  Created by user213342 on 12/4/22.
//

import UIKit

class MovieBL: NSObject {
    
    class func getMovies(completion: @escaping (_ movies: MoviesBE) -> Void) {
        JorgeWS.getMovies(completion: completion)
    }
    
    class func getMovieById(movie: MovieBE, completion: @escaping (_ movies: MovieBE) -> Void) {
        JorgeWS.getMovieById(movie: movie, completion: completion)
}
}
