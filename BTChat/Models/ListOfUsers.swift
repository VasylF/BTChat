//
//  ListOfUsers.swift
//  BTChat
//
//  Created by Mac on 27.06.18.
//  Copyright © 2018 VasylFuchenko. All rights reserved.
//

import Foundation

class ListOfUsers {
    
    var arrayOfUsers = [User]()
    
    static let shared = ListOfUsers()
    public init(){}
    
    func set(_ user: User) {
        arrayOfUsers.append(user)
    }
    
    func get(_ index: Int) -> User {
            return arrayOfUsers[index]
       }
}



