//
//  FavoriteBeerController.swift
//  beerApp
//
//  Created by ibaikaa on 26/11/22.
//

import Foundation

class FavoriteBeerController {
    
    public weak var view: FavoriteBeersViewController!
    
    private var model: FavoriteBeersModel?
    
    init(view: FavoriteBeersViewController!) {
        self.view = view
        self.model = FavoriteBeersModel(controller: self)
    }
    
    
}
