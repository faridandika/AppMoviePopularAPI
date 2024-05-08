//
//  ContentView.swift
//  Movie App REST API
//
//  Created by Farid Andika on 08/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(1...20, id: \.self) {item in
                    HStack {
                        ///Image
                        
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                        
                        Spacer()
                            .frame(width: 25)
                        
                        Text("\(item)")
                        
                        //Label
                        
                        VStack(alignment: .leading) {
                            Text("Avenger: End Game")
                                .font(.headline)
                            Text("Action")
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
                
            // Decode the json data into swift object
                
                print(data)
                print(String(data: data!, encoding: .utf8))
                
                guard let data = data else { return }
                // if data is nill, stop the execution
                
            
                
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
