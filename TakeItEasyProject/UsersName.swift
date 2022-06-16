//
//  UsersName.swift
//  TakeItEasy2
//
//  Created by Zachary Saffron on 6/15/22.
//

import Foundation

class CurrentUser {
    
    // Create a static var for our current user
    
    static var currentUser = CurrentUser()
    
    
    // This private init is to ensure that the output cant be changed
    
    private init() {
        
    }
    
    var name: String?
    
}
