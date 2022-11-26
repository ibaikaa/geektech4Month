//
//  NetworkManager.swift
//  jokesApp
//
//  Created by ibaikaa on 25/11/22.
//

import Foundation


class NetworkManager {
    
    func getJokeList(completion: @escaping ([Joke]) -> Void ) {
        let url = URL(string: "https://official-joke-api.appspot.com/random_ten")
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            DispatchQueue.main.async {
                guard let data = data, let response = try? JSONDecoder().decode([Joke].self, from: data) else {
                    completion([])
                    return
                }
                completion(response)
            }
        }
        task.resume()
    }
    
    static let shared = NetworkManager()
    
}
