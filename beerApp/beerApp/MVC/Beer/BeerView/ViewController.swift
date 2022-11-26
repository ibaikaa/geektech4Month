//
//  ViewController.swift
//  beerApp
//
//  Created by ibaikaa on 26/11/22.
//

import UIKit
import SnapKit
import RealmSwift


class ViewController: UIViewController {
    
    var favoriteBeers: Results<FavoriteBeerRealm>!
    let realm = try! Realm()
    
    private lazy var favoriteBarButton: UIBarButtonItem = {
        let favoriteBarButton = UIBarButtonItem(title: "Edit", image: UIImage(systemName: "star.fill"), target: self, action: #selector(goToFavorites))
        favoriteBarButton.tintColor = .systemOrange
        return favoriteBarButton
    }()
    
    @objc func goToFavorites() {
        let favoriteBeersVC = FavoriteBeersViewController()
        navigationController?.pushViewController(favoriteBeersVC, animated: true)
    }
    
    private lazy var notFoundDataLabel: UILabel = {
        let notFoundDataLabel = UILabel()
        notFoundDataLabel.text = "Not found! Reset search textfield and try again!"
        notFoundDataLabel.numberOfLines = 0
        notFoundDataLabel.lineBreakMode = .byWordWrapping
        notFoundDataLabel.font = UIFont(name: "Avenir Next Regular", size: 30)
        notFoundDataLabel.textColor = .lightGray
        notFoundDataLabel.textAlignment = .center
        return notFoundDataLabel
    }()
    
    
    private lazy var appLabel: UILabel = {
        let appLabel = UILabel()
        appLabel.text = "Wanna beer? 🍻"
        appLabel.textColor = .black
        appLabel.font = UIFont(name: "Avenir Next Bold", size: 30)
        appLabel.textAlignment = .center
        return appLabel
    }()
    
    
    private lazy var searchBeerSearchBar: UISearchBar =  {
        let searchBeerSearchBar = UISearchBar()
        searchBeerSearchBar.searchBarStyle = .prominent
        searchBeerSearchBar.placeholder = "Find beer by name..."
        searchBeerSearchBar.sizeToFit()
        searchBeerSearchBar.isTranslucent = true
        searchBeerSearchBar.delegate = self
        return searchBeerSearchBar
    }()
    
    private lazy var beersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let beersCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        beersCollectionView.register(BeerCell.self, forCellWithReuseIdentifier: "beer_cell")
        beersCollectionView.dataSource = self
        beersCollectionView.delegate = self
        beersCollectionView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 246/255, alpha: 255)
        return beersCollectionView
    }()
    
    private var controller: BeerController?
    
    var beersData = [Beer]()
    
    private func updateUI () {
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 246/255, alpha: 255)
        
        view.addSubview(appLabel)
        
        appLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.right.equalToSuperview()
            
        }
        
        view.addSubview(searchBeerSearchBar)
        searchBeerSearchBar.snp.makeConstraints { make in
            make.top.equalTo(appLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
        }
        
        
        view.addSubview(beersCollectionView)
        
        beersCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBeerSearchBar.snp.bottom).offset(15)
            make.left.right.bottom.equalToSuperview()
        }
        
        
        view.addSubview(notFoundDataLabel)
        
        notFoundDataLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.height.equalTo(200)
        }
    }
    
    func getBeersCollectionView() -> UICollectionView { beersCollectionView }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        navigationItem.rightBarButtonItem = favoriteBarButton

        // Do any additional setup after loading the view.
        controller = BeerController(view: self)
        controller?.updateBeerList()
        
        favoriteBeers = realm.objects(FavoriteBeerRealm.self)
        notFoundDataLabel.isHidden = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        favoriteBeers = realm.objects(FavoriteBeerRealm.self)
        beersCollectionView.reloadData()
        notFoundDataLabel.isHidden = true
    }

}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if beersData.count != 0 {
            return beersData.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = beersCollectionView.dequeueReusableCell(withReuseIdentifier: "beer_cell", for: indexPath) as! BeerCell
        cell.backgroundColor = .systemOrange
        cell.layer.cornerRadius = 15
        cell.getBeerNameLabel().text = beersData[indexPath.row].name
        
        var favoriteBeerNames = [String]()

        for favoriteBeer in favoriteBeers{
            favoriteBeerNames.append(favoriteBeer.name)
        }
        
        if favoriteBeerNames.contains(cell.getBeerNameLabel().text!) {
            
            cell.getAddToFavoritesButton().setImage(UIImage(systemName: "star.fill"), for: .normal)
            
        } else {
            cell.getAddToFavoritesButton().setImage(UIImage(systemName: "star"), for: .normal)
        }
        
        
                
        return cell
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 350, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let beerDetailedVC = BeerDescriptionViewController()
        
        beerDetailedVC.getBeerNameLabel().text = beersData[indexPath.row].name
        
        beerDetailedVC.getBeerDescriptionLabel().text = beersData[indexPath.row].description
        
        navigationController?.pushViewController(beerDetailedVC, animated: true)
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Вводимое слово: \(searchText)")
        
        if beersData.isEmpty {
            notFoundDataLabel.isHidden = false
        } else {
            notFoundDataLabel.isHidden = true
        }
        
        for beersDatum in beersData {
            
            if !beersDatum.name.uppercased().contains(searchText.uppercased()) || !beersDatum.name.lowercased().contains(searchText.lowercased()) {
                print("юзер начал вводить неправильно!! Нет такого пива: \(searchText). Обчищаю массив!!")
                beersData.removeAll()
                beersCollectionView.reloadData()
                notFoundDataLabel.isHidden = false
                break
            } else {
                print("есть пиво с текстом \(searchText) – это: \(beersDatum.name)")
                beersData = beersData.filter { $0.name.uppercased().contains(searchText.uppercased()) ||   $0.name.lowercased().contains(searchText.lowercased()) }
                print(beersData.count)
                beersCollectionView.reloadData()
                break
            }
        }
                
        if searchText.isEmpty {
            controller!.updateBeerList()
            notFoundDataLabel.isHidden = true
        }
        
    }
}
