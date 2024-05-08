//
//  ContentView.swift
//  Movie App REST API
//
//  Created by Farid Andika on 08/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var movies: [Movie] = []
    
    var body: some View {
        NavigationStack {
            List {
                    
                ForEach(movies, id: \.self) {item in
                    HStack {
                       
                    
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(item.backdropPath)")!) { image in
                        
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
        
                        } placeholder: {
                            
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                            
                        }

                        
                        Spacer()
                            .frame(width: 25)
                        
                        
                        VStack(alignment: .leading) {
                            
                            Text("\(item.voteAverage.formatted())")
                            
                            Text("\(item.title)")
                                .font(.headline)

                                .refreshable {
                                fetchPopularMovieAPI()
                                    
                        }
                    }
                }
            }
          
            }

            .listStyle(.plain)
            
            .navigationTitle("Popular Movie")
            
            
            
        }
        .onAppear(){
            fetchPopularMovieAPI()
            // https://api.themoviedb.org/3/movie/popular
            guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular") else { return }
            //setup headers
            
            let headers = [
                "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YjdlNDdkOTUzNmQ3ZTg1YmM3YWRmMmFlZGE3MzM0OSIsInN1YiI6IjY1ZGFhYTIzY2FiZmU0MDE0YWQwMThlZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.div5OnuZ9jSJtDm2snw44Hs33ezFHI1ATSDykpqV71Y",
                "Accept": "application/json"
            
                ]
            
            
            var request = URLRequest(url: url)

            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
            
            //Perform the request
            URLSession.shared.dataTask(with: request) {data, response, error in
                // Check if any error
                if error != nil {
                    print(error?.localizedDescription)
                    return
        
                }
                                
            guard let data = data else { return }
            print(data)
                print(String(data: data, encoding: .utf8))
      
                do {
                    
                    let movieData = try JSONDecoder().decode(MovieAPIResponse.self, from: data)
                    
                    print(movieData.totalPages)
        
                    self.movies = movieData.results
                    
                } catch {
                    print(error.localizedDescription)
                }
                

                
            }
            .resume()
            
        }
    }
    func fetchPopularMovieAPI() {
        
    }
}




#Preview {
    ContentView()
}
