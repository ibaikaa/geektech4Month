//
//  ViewController.swift
//  parseJSONApp
//
//  Created by mikasa on 17/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    private var networkManager = NetworkManager()
    
    var beersData: [Beer] = [Beer]()
    
    private lazy var beersTableView: UITableView = {
        var view = UITableView()
        view.register(UITableViewCell.self, forCellReuseIdentifier: "beers_cell")
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        setupSubviews()
        
        networkManager.getBeerList { beers in
            self.beersData = beers
            self.beersTableView.reloadData()
        }
        print(beersData.count)
    }
    
    func setupSubviews() {
        view.addSubview(beersTableView)
        beersTableView.translatesAutoresizingMaskIntoConstraints = false
        beersTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        beersTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        beersTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        beersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        beersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "beers_cell", for: indexPath)
        cell.textLabel?.text = beersData[indexPath.row].name
        cell.textLabel?.textColor = .black
        return cell
    }
}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beerDetailedViewController = BeersDescriptionViewController()
        
        if let bottomSheet = beerDetailedViewController.sheetPresentationController {
            bottomSheet.detents = [.medium()]
        }
        
        beerDetailedViewController.getBeerNameLabel().text = beersData[indexPath.row].name
        
        beerDetailedViewController.getBeerDescriptionLabel().text = beersData[indexPath.row].description
        
        present(beerDetailedViewController, animated: true, completion: nil)
        
    }
}
