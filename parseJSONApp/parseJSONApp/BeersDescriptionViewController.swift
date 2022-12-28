//
//  BeersDescriptionViewController.swift
//  parseJSONApp
//
//  Created by mikasa on 17/11/22.
//

import Foundation

import UIKit



class BeersDescriptionViewController: UIViewController{
    
    private var beerNameLabel: UILabel = {
        let beerNameLabel = UILabel()
        beerNameLabel.textColor = .black
        return beerNameLabel
    }()
    
    private var beerDescriptionLabel: UILabel = {
        let beerDescriptionLabel = UILabel()
        beerDescriptionLabel.textColor = .black
        beerDescriptionLabel.numberOfLines = 10
        beerDescriptionLabel.sizeToFit()
        return beerDescriptionLabel
    }()
    
    func getBeerNameLabel() -> UILabel { beerNameLabel }
    
    func getBeerDescriptionLabel() -> UILabel { beerDescriptionLabel }
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupSubviews()
    }
    
    
    func setupSubviews(){
        view.addSubview(beerNameLabel)
        
        beerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        beerNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        beerNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        
        
        view.addSubview(beerDescriptionLabel)
        
        beerDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        beerDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        beerDescriptionLabel.topAnchor.constraint(equalTo: beerNameLabel.bottomAnchor, constant: 10).isActive = true
        beerDescriptionLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        beerDescriptionLabel.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
}
