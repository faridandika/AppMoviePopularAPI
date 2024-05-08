//
//  MovieResponse.swift
//  Movie App REST API
//
//  Created by Farid Andika on 08/05/24.
//

import Foundation

struct MovieAPIResponse: Decodable {
        let page: Int
        let results: [Movie]
        let totalPages: Int
        let totalResults: Int
    
    private enum CodingKeys: String, CodingKey {
        
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
}
