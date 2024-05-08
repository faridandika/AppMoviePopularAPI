//
//  Movie.swift
//  Movie App REST API
//
//  Created by Farid Andika on 08/05/24.
//

import Foundation

struct Movie: Decodable {
    let backdropPath: String
    let title: String
    let voteAverage: String
    
    
    private enum CodingKeys: String, CodingKey {
        
        case backdropPath = "backdrop_path"
        case title
        case voteAverage = "vote_average"
        
    }
    
    
}
