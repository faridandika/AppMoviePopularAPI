//
//  MovieResponse.swift
//  Movie App REST API
//
//  Created by Farid Andika on 08/05/24.
//

import Foundation

struct MovieAPIResponse: Decodable {
        var page: Int
        var results: [Movie]
        var totalPages: Int
        var totalResults: Int
    
    private enum CodingKeys: String, CodingKey {
        
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
}
