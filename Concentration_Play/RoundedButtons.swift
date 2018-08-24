//
//  RoundedButtons.swift
//  Concentration_Play
//
//  Created by Ibrahim Attalla on 8/23/18.
//  Copyright © 2018 Ibrahim_Attalla. All rights reserved.
//

import UIKit
@IBDesignable

class RoundedButtons: UIButton {

    @IBInspectable var corrnarRadius : CGFloat = 3.0  {
        didSet{
            self.layer.cornerRadius = corrnarRadius
            self.clipsToBounds = true
            
        }
    }
    
}
