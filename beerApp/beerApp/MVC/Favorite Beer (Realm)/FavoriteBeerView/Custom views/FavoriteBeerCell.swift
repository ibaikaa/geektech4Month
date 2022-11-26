//
//  FavoriteBeerCell.swift
//  beerApp
//
//  Created by ibaikaa on 26/11/22.
//

import UIKit
import SnapKit

class FavoriteBeerCell: UICollectionViewCell {
    
    private lazy var beerNameLabel: UILabel = {
        let beerNameLabel = UILabel()
        beerNameLabel.font = UIFont(name: "Avenir Next Bold", size: 22)
        beerNameLabel.textColor = .black
        return beerNameLabel
    }()
    
    
    override func layoutSubviews() {
        addSubview(beerNameLabel)
        
        beerNameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-50)
            make.top.bottom.equalToSuperview()
        }
    }
    
    func getBeerNameLabel() -> UILabel { beerNameLabel }
}
