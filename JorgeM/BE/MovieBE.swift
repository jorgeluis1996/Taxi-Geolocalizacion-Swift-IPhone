//
//  MovieBE.swift
//  JorgeM
//
//  Created by user213342 on 12/4/22.
//

import UIKit

import Alamofire



struct MoviesBE: Codable {
    let listOfMovies: [MovieBE]
    enum CodingKeys: String, CodingKey {
        case listOfMovies = "results"
        
    }
    
}
struct MovieBE: Codable {
    let title : String
    let popularity : Double
    let movieID : Int
    let voteCount : Int
    let originalTitle : String
    let voteAverage : Double
    let sinopsis : String
    let releaseDate : String
    let image : String
    
    enum CodingKeys: String, CodingKey {
        case title
        case popularity
        case movieID = "id"
        case voteCount = "vote_count"
        case originalTitle = "original_title"
        case voteAverage = "vote_average"
        case sinopsis = "overview"
        case releaseDate = "release_date"
        case image = "poster_path"
        
    }
    
}

//struct Movies: Codable {
//        let listOfMovies: [MovieBE]
//
//        enum CodingKeys: String, CodingKey{
//            case listOfMovie = "results"
//        }
//
//    }
//
//
//    struct MovieBE: Codable{
//        let title           : String
//        let popularity      : Double
//        let movieID         : Int
//        let voteCount       : Int
//        let originalTitle   : String
//        let voteAverage     : Double
//        let sinopsis        : String
//        let releaseDate     : String
//        let image           : String
//
//        enum CodingKeys: String, CodingKey{
//            case title
//            case popularity
//            case movieID        = "id"
//            case voteCount      = "vote_count"
//            case originalTitle  = "original_title"
//            case voteAverage    = "vote_average"
//            case sinopsis       = "overview"
//            case releaseDate    = "release_date"
//            case image          = "poster_path"
//        }
//        
//    }
///////////////////////////////////////////////
//    struct MoviesBE: Codable {
//        let listOfMovies: [MovieBE]
//
//        enum CodingKeys: String, CodingKey{
//            case listOfMovie = "results"
//        }
//
//
//    //    var name: String?
//    //    var gender: String?
//    //    var cinema: String?
//    //    var rate: Double?
//    //
//    //    init(dict: [String: Any]){
//    //        self.name=dict["name"] as? String
//    //        self.gender=dict["gender"] as? String
//    //        self.cinema=dict["cinema"] as? String
//    //        self.rate=dict["rate"] as? Double
//    //    }
//    }
//
//
//    struct MovieBE: Codable{
//        let title           : String
//        let popularity      : Double
//        let movieID         : Int
//        let VOTEcOUUNT      : Int
//        let originalTitle   : String
//        let voteAverage     : Double
//        let sinopsis        : String
//        let releaseDate     : String
//        let image           : String
//
//        enum CodingKeys:String, CodingKey{
//            case title
//            case popularity
//            case movieID        = "id"
//            case voteCount      = "vote_count"
//            case originalTitle  = "original_title"
//            case voteAverage    = "vote_average"
//            case sinopsis       = "overview"
//            case releaseDate    = "release_date"
//            case image          = "poster_path"
//        }
//        
//    }



