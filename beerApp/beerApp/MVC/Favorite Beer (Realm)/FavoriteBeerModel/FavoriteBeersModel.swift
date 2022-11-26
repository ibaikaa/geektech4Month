//
//  FavoriteBeersModel.swift
//  beerApp
//
//  Created by ibaikaa on 26/11/22.
//

import Foundation
import RealmSwift

class FavoriteBeersModel {
    
    private weak var controller: FavoriteBeerController!
    
    init(controller: FavoriteBeerController!) {
        self.controller = controller
    }
}

class FavoriteBeerRealm: Object {
    @objc dynamic var name = ""
    @objc dynamic var beerDescription = ""
}
