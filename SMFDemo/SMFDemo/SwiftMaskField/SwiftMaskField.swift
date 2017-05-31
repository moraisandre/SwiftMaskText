//
//  SwiftMaskField.swift
//  GitHub: https://github.com/moraisandre/SwiftMaskText
//
//  Created by Andre Morais on 3/9/16.
//  Copyright © 2016 Andre Morais. All rights reserved.
//  Website: http://www.andremorais.com.br
//

import UIKit

class SwiftMaskField: UITextField {
    
    private var _mask: String!
    
    
    @IBInspectable var maskString: String {
        
        get{
            return _mask
        }
        
        set{
            _mask = newValue
        }
        
    }
    
    func applyFilter(textField: UITextField){
        
        var index = _mask.startIndex
        var textWithMask:String = ""
        var i:Int = 0
        var text:String = textField.text!
        
        if (text.isEmpty){
            return
        }
        
        text = removeMaskCharacters(text: text, withMask: maskString)
        
        while(index != maskString.endIndex){
            
            if(i >= text.characters.count){
                self.text = textWithMask
                break
            }
            
            if("\(maskString[index])" == "N"){ //Only number
                if (!isNumber(textToValidate: text[i])){
                    break
                }
                textWithMask = textWithMask + text[i]
                i += 1
            }else if("\(maskString[index])" == "C"){ //Only Characters A-Z, Upper case only
                if(hasSpecialCharacter(searchTerm: text[i])){
                    break
                }
                
                if (isNumber(textToValidate: text[i])){
                    break
                }
                textWithMask = textWithMask + text[i].uppercased()
                i += 1
            }else if("\(maskString[index])" == "c"){ //Only Characters a-z, lower case only
                if(hasSpecialCharacter(searchTerm: text[i])){
                    break
                }
                
                if (isNumber(textToValidate: text[i])){
                    break
                }
                textWithMask = textWithMask + text[i].lowercased()
                i += 1
            }else if("\(maskString[index])" == "X"){ //Only Characters a-Z
                if(hasSpecialCharacter(searchTerm: text[i])){
                    break
                }
                
                if (isNumber(textToValidate: text[i])){
                    break
                }
                textWithMask = textWithMask + text[i]
                i += 1
            }else if("\(maskString[index])" == "%"){ //Characters a-Z + Numbers
                if(hasSpecialCharacter(searchTerm: text[i])){
                    break
                }
                textWithMask = textWithMask + text[i]
                i += 1
            }else if("\(maskString[index])" == "U"){ //Only Characters A-Z + Numbers, Upper case only
                if(hasSpecialCharacter(searchTerm: text[i])){
                    break
                }
                
                textWithMask = textWithMask + text[i].uppercased()
                i += 1
            }else if("\(maskString[index])" == "u"){ //Only Characters a-z + Numbers, lower case only
                if(hasSpecialCharacter(searchTerm: text[i])){
                    break
                }
                
                textWithMask = textWithMask + text[i].lowercased()
                i += 1
            }else if("\(maskString[index])" == "*"){ //Any Character
                textWithMask = textWithMask + text[i]
                i += 1
            }else{
                textWithMask = textWithMask + "\(maskString[index])"
            }
            
            
            index = _mask.index(after: index)
        }
        
        self.text = textWithMask
    }
    
    func isNumber(textToValidate:String) -> Bool{
        
        let num = Int(textToValidate)
        
        if num != nil {
            return true
        }
        
        return false
    }
    
    func hasSpecialCharacter(searchTerm:String) -> Bool{
        let regex = try!  NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: NSRegularExpression.Options())
        
        if regex.firstMatch(in: searchTerm, options: NSRegularExpression.MatchingOptions(), range: NSMakeRange(0, searchTerm.characters.count)) != nil {
            return true
        }
        
        return false
        
    }
    
    func removeMaskCharacters( text: String, withMask mask:String) -> String{
        
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
        
        while(index != mask.endIndex){
            text = text.replacingOccurrences(of: "\(mask[index])", with: "")
            index = mask.index(after: index)
//            index = index.successor()
        }
        
        return text
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Apply the delegate // not needed
        //delegate = self
        
        addObserver(self, forKeyPath: "text", options: NSKeyValueObservingOptions(), context: nil)
        
        self.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
    }
    
    
    
    func textFieldDidChange(textField: UITextField) {
        //print("textFieldDidChange")
        applyFilter(textField: textField)
    }
    
}

extension SwiftMaskField {
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
//        if (keyPath == "text" && object === self ) {
//            
//            //print(self.text)
//            
//        }
    }
}









