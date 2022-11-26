//
//  BeerController.swift
//  beerApp
//
//  Created by ibaikaa on 26/11/22.
//

import Foundation

class BeerController {
    
    private weak var view: ViewController!
    
    private var model: BeerModel?
    
    private var beers: [Beer] = [Beer]()
    
    init(view: ViewController!) {
        self.view = view
        self.model = BeerModel(controller: self)
    }
    
    func setBeers(beers: [Beer]) {
        self.beers = beers
        print("засетил\(self.beers.count) пиво")
        view.beersData = getBeers()
        print("во вью бирс дата \(view.beersData.count) пиво")
        view.getBeersCollectionView().reloadData()
    }
    
    func getBeers() -> [Beer] { self.beers }
    
    func updateBeerList() {
        model?.getBeers()
    }
    
    
}

