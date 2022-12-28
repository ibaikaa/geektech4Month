//
//  UserProfileViewController.swift
//  mvcLoginApp
//
//  Created by ibaikaa on 12/11/22.
//

import Foundation
import UIKit
import SnapKit

class UserProfileViewController: UIViewController {
    
    private lazy var usernameLabel: UILabel = {
       UILabel()
    }()
    
    func getUsernameLabel() -> UILabel { usernameLabel }
    
    func getPasswordLabel() -> UILabel { passwordLabel }

    
    private lazy var passwordLabel: UILabel = {
       UILabel()
    }()
    
    func setupSubview(){
        view.addSubview(usernameLabel)
        view.addSubview(passwordLabel)
        view.backgroundColor = .lightGray
        
        usernameLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
        }
        
        passwordLabel.snp.makeConstraints{ make in
            make.top.equalTo(usernameLabel.snp.top).offset(30)
            make.centerX.equalToSuperview()
        }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubview()
        
        
    }
    
    
    
}
