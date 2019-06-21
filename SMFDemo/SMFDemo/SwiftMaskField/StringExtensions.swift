//
//  StringExtensions.swift
//  GitHub: https://github.com/moraisandre/SwiftMaskText
//
//  Created by Andre Morais on 3/11/16.
//  Translated to Swift 3 by: André Santana Ferreira on 31/5/17
//  Translated to Swift 4 by: André Morais on 04/11/17
//  Copyright © 2018 Andre Morais. All rights reserved.
//  Website: http://www.moraisandre.com
//

import UIKit

extension String {
    
    subscript (i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(start, offsetBy: r.upperBound - r.lowerBound)
        return String(self[(start ..< end)])
    }
}
