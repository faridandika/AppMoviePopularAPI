//
//  Movie.swift
//  Movie App REST API
//
//  Created by Farid Andika on 08/05/24.
//

import Foundation

struct Movie: Decodable, Hashable {
    var backdropPath: String
    var title: String
    var voteAverage: Double
    
    private enum CodingKeys: String, CodingKey {
        
        case backdropPath = "backdrop_path"
        case title
        case voteAverage = "vote_average"
        
    }
    
    
}
