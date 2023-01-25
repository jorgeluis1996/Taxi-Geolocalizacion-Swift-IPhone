//
//  JorgeWS.swift
//  JorgeM
//
//  Created by user213342 on 12/4/22.
//

import UIKit
import Alamofire
class JorgeWS: NSObject {
    
    class func getMovies(completion: @escaping (_ movies: MoviesBE) -> Void) {
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=f799e3986674237899820af4855fc705"
        let url = URL(string: urlString)!
        
        AF.request(url, method: .get).response { response in
            
            switch response.result {
                
            case .success(let data):
                guard let data = data else { return }
                do {
                    let decoder = JSONDecoder()
                    let movies = try decoder.decode(MoviesBE.self, from: data)
                    completion(movies)
                } catch let error {
                    print(error.localizedDescription)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
}
    
    class func getMovieById(movie: MovieBE, completion: @escaping (_ movies: MovieBE) -> Void) {
        let urlString = "https://api.themoviedb.org/3/movie/\(movie.movieID)?api_key=f799e3986674237899820af4855fc705"
        let url = URL(string: urlString)!
        
        AF.request(url, method: .get).response { response in
            
            switch response.result {
                
            case .success(let data):
                guard let data = data else { return }
                do {
                    let decoder = JSONDecoder()
                    let movies = try decoder.decode(MovieBE.self, from: data)
                    completion(movies)
                } catch let error {
                    print(error.localizedDescription)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            print(urlString)
            
        }
}
    
}
