//
//  Design.swift
//  TakeItEasyProject
//
//  Created by admin on 6/18/22.
//

import Foundation
import UIKit

class Design{
    
    //var topColor = UIColor(red: 0.17, green: 1.00, blue: 0.58, alpha: 1.0)
    var topColor = UIColor.blue
    var bottomColor = UIColor.purple
    //var bottomColor = UIColor(red: 0.17, green: 0.52, blue: 1.00, alpha: 1.0)
    var accent = UIColor(red: 1.00, green: 0.44, blue: 0.07, alpha: 1.00)
    
    func gradient(boundary: UIView) -> CAGradientLayer{
        let gradient = CAGradientLayer()
        gradient.frame = boundary.bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        return gradient
    }
}
