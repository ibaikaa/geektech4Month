//
//  BeerModel.swift
//  beerApp
//
//  Created by ibaikaa on 26/11/22.
//

import Foundation

struct Beer: Codable {
    var name: String
    var description: String
}


class BeerModel {
    
    private weak var controller: BeerController!
    
    private var networkManager = NetworkManager()
    
    init(controller: BeerController) {
        self.controller = controller
    }
    
    func getBeers() {
        networkManager.getBeerList { beers in
            for beer in beers {
                print(beer.name)
                print(beer.description)
            }
            self.controller.setBeers(beers: beers)
        }
    }
}
