//
//  FavoriteBeersViewController.swift
//  beerApp
//
//  Created by ibaikaa on 26/11/22.
//

import Foundation
import UIKit
import SnapKit
import RealmSwift

class FavoriteBeersViewController: UIViewController {
    
    var favoriteBeer: Results<FavoriteBeerRealm>!
    let realm = try! Realm()

    
    private lazy var vcLabel: UILabel = {
        let vcLabel = UILabel()
        vcLabel.text = "Избранное ⭐️"
        vcLabel.font = UIFont(name: "Avenir Next Bold", size: 30)
        vcLabel.textAlignment = .center
        vcLabel.textColor = .white
        return vcLabel
    }()
    
    
    private lazy var favoritesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let favoritesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        favoritesCollectionView.register(FavoriteBeerCell.self, forCellWithReuseIdentifier: "favorite_beer_cell")
        favoritesCollectionView.dataSource = self
        favoritesCollectionView.delegate = self
        favoritesCollectionView.backgroundColor = .systemOrange
        return favoritesCollectionView
    }()
    
    
    private func updateUI() {
        view.addSubview(vcLabel)
        
        vcLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        view.addSubview(favoritesCollectionView)
        
        favoritesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(vcLabel.snp.bottom).offset(40)
            make.left.right.bottom.equalToSuperview()
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favoriteBeer = realm.objects(FavoriteBeerRealm.self)
        favoritesCollectionView.reloadData()
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .systemOrange
        favoriteBeer = realm.objects(FavoriteBeerRealm.self)
        print(favoriteBeer.count)
        updateUI()
    }
}

extension FavoriteBeersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if favoriteBeer.count != 0 {
            return favoriteBeer.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = favoritesCollectionView.dequeueReusableCell(withReuseIdentifier: "favorite_beer_cell", for: indexPath) as! FavoriteBeerCell
        cell.backgroundColor = UIColor.init(red: 242/255, green: 242/255, blue: 246/255, alpha: 255)
        cell.layer.cornerRadius = 15
        cell.getBeerNameLabel().text = favoriteBeer[indexPath.row].name
        return cell
    }
}

extension FavoriteBeersViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 350, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let objectToDelete = favoriteBeer[indexPath.row]
        
        let confirmDeletingAlertController = UIAlertController(title: "Удалить из избранного", message: "Вы уверены, что хотите удалить из избранного?", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Удалить", style: .destructive) { action in
            try! self.realm.write {
                self.realm.delete(objectToDelete)
                self.favoritesCollectionView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        
        confirmDeletingAlertController.addAction(cancelAction)

        confirmDeletingAlertController.addAction(confirmAction)
        
        present(confirmDeletingAlertController, animated: true)
        
    }
}
