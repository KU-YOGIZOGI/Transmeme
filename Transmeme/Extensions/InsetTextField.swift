//
//  InsetTextField.swift
//  Transmeme
//
//  Created by 홍서린 on 2023/11/04.
//

import Foundation
import UIKit

class InsetTextField : UITextField {
    
    var insetX: CGFloat = 0 {
        didSet {
            layoutIfNeeded()
        }
    }
    
    var insetY: CGFloat = 0 {
        didSet {
            layoutIfNeeded()
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        
        return bounds.insetBy(dx: insetX, dy:insetY)
    }
    
    required override public init(frame: CGRect){
        
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder){
        
        super.init(coder: coder)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        
        var textRect = super.leftViewRect(forBounds: bounds)
        
        textRect.origin.x += 18
        
        return textRect
        
    }
}
