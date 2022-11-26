//
//  JokeController.swift
//  jokesApp
//
//  Created by ibaikaa on 25/11/22.
//

import Foundation


class JokeController {
    private weak var view: ViewController!
    
    private var model: JokeModel?
    
    private var jokes: [Joke] = [Joke]()
    
    init(view: ViewController!) {
        self.view = view
        self.model = JokeModel(controller: self)
    }
    
    func setJokes(jokes: [Joke]) {
        self.jokes = jokes
        view.jokesData = getJokes()
    }
    
    func getJokes() -> [Joke] { self.jokes }
    
    func updateJokesList() {
        model?.getJokes()
    }
    
    
}
