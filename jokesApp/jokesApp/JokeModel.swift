//
//  JokeModel.swift
//  jokesApp
//
//  Created by ibaikaa on 25/11/22.
//

import Foundation

class JokeModel {
    private weak var controller: JokeController!
    
    private var networkManager = NetworkManager()
    
    init(controller: JokeController) {
        self.controller = controller
    }
    
    func getJokes() {
        networkManager.getJokeList { jokes in
            self.controller.setJokes(jokes: jokes)
        }
    } 
}


struct Joke: Codable {
    var setup: String
    var punchline: String
}





