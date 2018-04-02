//
//  Classification.swift
//  field-survey
//
//  Created by Zachary Dobbs on 4/2/18.
//  Copyright © 2018 Zachary Dobbs. All rights reserved.
//

import UIKit

enum Classification: String {
    case amphibian
    case bird
    case fish
    case insect
    case mammal
    case plant
    case reptile
    
    var image: UIImage? {
        return UIImage(named: self.rawValue + "Icon")
    }
}
