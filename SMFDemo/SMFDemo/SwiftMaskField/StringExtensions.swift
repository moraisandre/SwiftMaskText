//
//  StringExtensions.swift
//  GitHub: https://github.com/moraisandre/SwiftMaskText
//
//  Created by Andre Morais on 3/11/16.
//  Copyright © 2016 Andre Morais. All rights reserved.
//  Website: http://www.andremorais.com.br
//

import UIKit

extension String {
    
    subscript (i: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = characters.index(startIndex, offsetBy: r.lowerBound)
        let end = characters.index(start, offsetBy: r.upperBound - r.lowerBound)
        return self[(start ..< end)]
    }
}
