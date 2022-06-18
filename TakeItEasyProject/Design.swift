//
//  Design.swift
//  TakeItEasyProject
//
//  Created by admin on 6/18/22.
//

import Foundation
import UIKit

class Design{
    
    var topColor: UIColor?
    var bottomColor: UIColor?
    var accent: UIColor
    
    init(color1: UIColor, color2: UIColor, color3: UIColor){
        topColor = color1
        bottomColor = color2
        accent = color3
        
    }
    
    func gradient(boundary: UIView) -> CAGradientLayer{
        let gradient = CAGradientLayer()
        gradient.frame = boundary.bounds
        gradient.colors = [topColor?.cgColor, bottomColor?.cgColor]
        return gradient
    }
}
