//
//  SwiftMaskField.swift
//  GitHub: https://github.com/moraisandre/SwiftMaskText
//
//  Created by Andre Morais on 3/9/16.
//  Translated to Swift 3 by: André Santana Ferreira on 31/5/17
//  Translated to Swift 4 by: André Morais on 04/11/17
//  Translated to Swift 4.2 by: Rafael Gustavo Gali on 07/01/19
//  Translated to Swift 5 by: Anderson Lucas C. Ramos on 05/07/19
//  Copyright © 2018 Andre Morais. All rights reserved.
//  Website: http://www.moraisandre.com
//

import UIKit

open class SwiftMaskField: UITextField {
    
    private var _mask: String!
    
    @IBInspectable public var maskString: String {
        
        get {
            return _mask
        }
        
        set {
            _mask = newValue
        }
        
    }
    
    public func applyFilter(textField: UITextField) {
        
        if _mask == nil || _mask.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) == "" {
            return
        }
        
        var index = _mask.startIndex
        var textWithMask: String = ""
        var i: Int = 0
        var text: String = textField.text!
        
        if (text.isEmpty) {
            return
        }
        
        text = removeMaskCharacters(text: text, withMask: maskString)
        
        while(index != maskString.endIndex) {
            
            if(i >= text.count) {
                self.text = textWithMask
                break
            }
            
            if("\(maskString[index])" == "N") { // Only number
                if (!isNumber(textToValidate: text[i])) {
                    break
                }
                textWithMask = textWithMask + text[i]
                i += 1
            } else if("\(maskString[index])" == "C") { // Only Characters A-Z, Upper case only
                if(hasSpecialCharacter(searchTerm: text[i])) {
                    break
                }
                
                if (isNumber(textToValidate: text[i])) {
                    break
                }
                textWithMask = textWithMask + String(text[i]).uppercased()
                i += 1
            } else if("\(maskString[index])" == "c") { // Only Characters a-z, lower case only
                if(hasSpecialCharacter(searchTerm: text[i])) {
                    break
                }
                
                if (isNumber(textToValidate: text[i])) {
                    break
                }
                textWithMask = textWithMask + String(text[i]).lowercased()
                i += 1
            } else if("\(maskString[index])" == "X") { // Only Characters a-Z
                if(hasSpecialCharacter(searchTerm: text[i])) {
                    break
                }
                
                if (isNumber(textToValidate: text[i])) {
                    break
                }
                textWithMask = textWithMask + text[i]
                i += 1
            } else if("\(maskString[index])" == "%") { // Characters a-Z + Numbers
                if(hasSpecialCharacter(searchTerm: text[i])) {
                    break
                }
                textWithMask = textWithMask + text[i]
                i += 1
            } else if("\(maskString[index])" == "U") { // Only Characters A-Z + Numbers, Upper case only
                if(hasSpecialCharacter(searchTerm: text[i])) {
                    break
                }
                
                textWithMask = textWithMask + String(text[i]).uppercased()
                i += 1
            } else if("\(maskString[index])" == "u") { // Only Characters a-z + Numbers, lower case only
                if(hasSpecialCharacter(searchTerm: text[i])) {
                    break
                }
                
                textWithMask = textWithMask + String(text[i]).lowercased()
                i += 1
            } else if("\(maskString[index])" == "*") { // Any Character
                textWithMask = textWithMask + text[i]
                i += 1
            } else {
                textWithMask = textWithMask + "\(maskString[index])"
            }
            
            
            index = _mask.index(after: index)
        }
        
        self.text = textWithMask
    }
    
    public func isNumber(textToValidate: String) -> Bool {
        
        let num = Int(textToValidate)
        
        if num != nil {
            return true
        }
        
        return false
    }
    
    public func hasSpecialCharacter(searchTerm: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: NSRegularExpression.Options())
        
        if regex.firstMatch(in: searchTerm, options: NSRegularExpression.MatchingOptions(), range: NSMakeRange(0, searchTerm.count)) != nil {
            return true
        }
        
        return false
        
    }
    
    public func removeMaskCharacters(text: String, withMask mask: String) -> String {
        
        var mask = mask
        var text = text
        mask = mask.replacingOccurrences(of: "X", with: "")
        mask = mask.replacingOccurrences(of: "N", with: "")
        mask = mask.replacingOccurrences(of: "C", with: "")
        mask = mask.replacingOccurrences(of: "c", with: "")
        mask = mask.replacingOccurrences(of: "U", with: "")
        mask = mask.replacingOccurrences(of: "u", with: "")
        mask = mask.replacingOccurrences(of: "*", with: "")
        
        var index = mask.startIndex
        
        while(index != mask.endIndex) {
            text = text.replacingOccurrences(of: "\(mask[index])", with: "")
            index = mask.index(after: index)
        }
        
        return text
    }
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        
        addObserver(self, forKeyPath: "text", options: NSKeyValueObservingOptions(), context: nil)
        
        self.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        applyFilter(textField: textField)
    }
    
}

extension SwiftMaskField {
    
    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        
    }
}
