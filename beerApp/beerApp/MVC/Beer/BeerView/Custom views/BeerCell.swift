//
//  BeerCell.swift
//  beerApp
//
//  Created by ibaikaa on 26/11/22.
//

import UIKit
import SnapKit
import RealmSwift

class BeerCell: UICollectionViewCell {
    
    var favoriteBeers: Results<FavoriteBeerRealm>!
    
    let realm = try! Realm()
    
    private lazy var beerNameLabel: UILabel = {
        let beerNameLabel = UILabel()
        beerNameLabel.textAlignment = .left
        beerNameLabel.numberOfLines = 0
        beerNameLabel.lineBreakMode = .byWordWrapping
        beerNameLabel.font = UIFont(name: "Avenir Next Bold Italic", size: 20)
        beerNameLabel.textColor = .white
        beerNameLabel.backgroundColor = .systemOrange
        return beerNameLabel
    }()
    
    private lazy var addToFavoritesButton: UIButton = {
        let addToFavoritesButton = UIButton(type: .system)
        addToFavoritesButton.setImage(UIImage(systemName: "star"), for: .normal)
        addToFavoritesButton.tintColor = .white
        addToFavoritesButton.addTarget(self, action: #selector(addToFavoritesByTap), for: .touchUpInside)
        return addToFavoritesButton
    }()
    
    private var isFavorite = false
    
    @objc func addToFavoritesByTap () {
        print("добавить в избранное")
        
        favoriteBeers = realm.objects(FavoriteBeerRealm.self)
        
        if isFavorite {
            
            for favoriteBeer in favoriteBeers {
                if favoriteBeer.name == beerNameLabel.text! {
                    try! realm.write {
                        realm.delete(favoriteBeer)
                    }
                }
            }
            
            addToFavoritesButton.setImage(UIImage(systemName: "star"), for: .normal)
        } else {
            try! realm.write {
                realm.add(FavoriteBeerRealm(value: [beerNameLabel.text!]))
            }
            addToFavoritesButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
        
        isFavorite = !isFavorite
        
       
    }
    
    override func layoutSubviews() {
        addSubview(beerNameLabel)
        beerNameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-50)
            make.top.bottom.equalToSuperview()
        }
        
        addSubview(addToFavoritesButton)
        addToFavoritesButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-16)
            make.width.height.equalTo(50)
            
        }
    }
    
    func getBeerNameLabel() -> UILabel { beerNameLabel }
    
    func getAddToFavoritesButton() -> UIButton { addToFavoritesButton }
    
}
