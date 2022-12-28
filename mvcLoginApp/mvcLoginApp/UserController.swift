//
//  UserController.swift
//  mvcLoginApp
//
//  Created by ibaikaa on 12/11/22.
//

import Foundation


class UserController{
    private var view: ViewController?
    
    private var usersModel: User!
    
    init(view: ViewController){
        self.view = view
        self.usersModel = User(controller: self)
    }
    
    func getInfo() -> [String:String]{
        return usersModel.getInfo()
    }
    
    func sendInfo(username: String, password: String) -> String {
        usersModel.checkInfo(username: username, password: password)
    }
    
    
}
