//
//  UsersName.swift
//  TakeItEasy2
//
//  Created by Zachary Saffron on 6/15/22.
//

import Foundation
import UIKit

class CurrentUser {
    
    // Create a static var for our current user
    
    static var currentUser = CurrentUser()
    var name: String?
    
    // This private init is to ensure that the output cant be changed
    
    func out(current: UIViewController){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginNextScreen = storyboard.instantiateViewController(withIdentifier: "SignIn")
            loginNextScreen.modalPresentationStyle = .fullScreen
            current.present(loginNextScreen, animated: true, completion: nil)
    }
    
}
