//
//  UserModel.swift
//  mvcLoginApp
//
//  Created by ibaikaa on 12/11/22.
//

import Foundation


class User{
    
    private var controller: UserController?
    
    
    private var usersData = UsersData.shared
    
    init(controller: UserController){
        self.controller = controller
    }
    
    func getInfo() -> [String:String] {
        return usersData.usersData 
    }
    
    func checkInfo(username:String, password: String) -> String {
        
        var result = ""
        let userDataFromDB = usersData.usersData
        
        let userExists = userDataFromDB[username] != nil
        
        if userExists{
            if userDataFromDB[username] == password {
                result = "Успешный вход! ✅"
            } else {
                result = "Неверный пароль! ❌"
            }
        } else {
            result = "Не существует! ❌"
        }
        
        return result

        
    }
    
    
    
}


class UsersData{
    
    static let shared = UsersData()
    
    var usersData: [String:String] = ["Ian":"123321", "Baika":"12345"]
}
