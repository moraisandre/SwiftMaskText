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
    
    @IBInspectable var mask: String {
        
        get{
            return _mask
        }
        
        set{
            _mask = newValue
        }
        
    }
    
    func applyFilter(textField:UITextField){
        
        var index = _mask.startIndex
        var textWithMask:String = ""
        var i:Int = 0
        var text:String = textField.text!
        
        if (text.isEmpty){
            return
        }
        
        text = removeMaskCharacters(text,withMask: mask)
        
        while(index != mask.endIndex){
            
            if(i >= text.characters.count){
                self.text = textWithMask
                break
            }
            
            if("\(mask[index])" == "N"){ //Only number
                if (!isNumber(text[i])){
                    break
                }
                textWithMask = textWithMask + text[i]
                i++
            }else if("\(mask[index])" == "C"){ //Only Characters A-Z, Upper case only
                if(hasSpecialCharacter(text[i])){
                    break
                }
                
                if (isNumber(text[i])){
                    break
                }
                textWithMask = textWithMask + text[i].uppercaseString
                i++
            }else if("\(mask[index])" == "c"){ //Only Characters a-z, lower case only
                if(hasSpecialCharacter(text[i])){
                    break
                }
                
                if (isNumber(text[i])){
                    break
                }
                textWithMask = textWithMask + text[i].lowercaseString
                i++
            }else if("\(mask[index])" == "X"){ //Only Characters a-Z
                if(hasSpecialCharacter(text[i])){
                    break
                }
                
                if (isNumber(text[i])){
                    break
                }
                textWithMask = textWithMask + text[i]
                i++
            }else if("\(mask[index])" == "%"){ //Characters a-Z + Numbers
                if(hasSpecialCharacter(text[i])){
                    break
                }
                textWithMask = textWithMask + text[i]
                i++
            }else if("\(mask[index])" == "U"){ //Only Characters A-Z + Numbers, Upper case only
                if(hasSpecialCharacter(text[i])){
                    break
                }
                
                textWithMask = textWithMask + text[i].uppercaseString
                i++
            }else if("\(mask[index])" == "u"){ //Only Characters a-z + Numbers, lower case only
                if(hasSpecialCharacter(text[i])){
                    break
                }
                
                textWithMask = textWithMask + text[i].lowercaseString
                i++
            }else if("\(mask[index])" == "*"){ //Any Character
                textWithMask = textWithMask + text[i]
                i++
            }else{
                textWithMask = textWithMask + "\(mask[index])"
            }
            
            index = index.successor()
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
        let regex = try!  NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: NSRegularExpressionOptions())
        
        if regex.firstMatchInString(searchTerm, options: NSMatchingOptions(), range: NSMakeRange(0, searchTerm.characters.count)) != nil {
            return true
        }
        
        return false
        
    }
    
    func removeMaskCharacters(var text:String,var withMask mask:String) -> String{
        
        mask = mask.stringByReplacingOccurrencesOfString("X", withString: "")
        mask = mask.stringByReplacingOccurrencesOfString("N", withString: "")
        mask = mask.stringByReplacingOccurrencesOfString("C", withString: "")
        mask = mask.stringByReplacingOccurrencesOfString("c", withString: "")
        mask = mask.stringByReplacingOccurrencesOfString("U", withString: "")
        mask = mask.stringByReplacingOccurrencesOfString("u", withString: "")
        mask = mask.stringByReplacingOccurrencesOfString("*", withString: "")
        
        var index = mask.startIndex
        
        while(index != mask.endIndex){
            text = text.stringByReplacingOccurrencesOfString("\(mask[index])", withString: "")
            
            index = index.successor()
        }
        
        return text
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        // Apply the delegate // not needed
        //delegate = self
        
        addObserver(self, forKeyPath: "text", options: NSKeyValueObservingOptions(), context: nil)
        
        self.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
    }
    
    
    
    func textFieldDidChange(textField: UITextField) {
        //print("textFieldDidChange")
        applyFilter(textField)
    }
    
}

extension SwiftMaskField {
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        if (keyPath == "text" && object === self ) {
            
            //print(self.text)
            
        }
    }
}









