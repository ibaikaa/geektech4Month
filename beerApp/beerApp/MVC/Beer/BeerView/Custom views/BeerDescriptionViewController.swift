//
//  BeerDescriptionViewController.swift
//  beerApp
//
//  Created by ibaikaa on 26/11/22.
//

import UIKit
import SnapKit

class BeerDescriptionViewController: UIViewController {
    
    private lazy var beerNameLabel: UILabel = {
        let beerNameLabel = UILabel()
        beerNameLabel.font = UIFont(name: "Avenir Next Bold", size: 30)
        beerNameLabel.textAlignment = .center
        beerNameLabel.textColor = .white
        beerNameLabel.numberOfLines = 0
        beerNameLabel.lineBreakMode = .byWordWrapping
        return beerNameLabel
    }()
    
    private lazy var beerDescriptionLabel: UILabel = {
        let beerDescriptionLabel = UILabel()
        beerDescriptionLabel.font = UIFont(name: "Avenir Next Italic", size: 30)
        beerDescriptionLabel.textAlignment = .center
        beerDescriptionLabel.textColor = .white
        beerDescriptionLabel.numberOfLines = 0
        beerDescriptionLabel.lineBreakMode = .byWordWrapping
        return beerDescriptionLabel
    }()
    
    
    private func updateUI () {
        view.backgroundColor = .systemOrange
        
        view.addSubview(beerNameLabel)
        
        beerNameLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(100)
        }
        
        view.addSubview(beerDescriptionLabel)
        
        beerDescriptionLabel.snp.makeConstraints{ make in
            make.top.equalTo(beerNameLabel.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(300)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func getBeerNameLabel() -> UILabel { beerNameLabel }
    
    func getBeerDescriptionLabel() -> UILabel { beerDescriptionLabel }
}
