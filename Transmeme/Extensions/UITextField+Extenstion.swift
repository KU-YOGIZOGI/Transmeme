//
//  UITextField+Extenstion.swift
//  Transmeme
//
//  Created by 홍서린 on 2023/11/04.
//

import Foundation
import UIKit

//텍스트필드 placeholder

extension UITextField {
    
    func setPlaceholder(color: UIColor) {
        
        guard let string = self.placeholder else {
            
            return
            
        }
        
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
        
    }
    
    func addleftimage(image:UIImage?) {
        
        let leftimage = UIImageView(frame: CGRect(origin: CGPoint(x: 8, y: 0), size: CGSize(width: 18, height: 18)))
        
        leftimage.image = image
        
        self.leftView = leftimage
        self.leftViewMode = .always
        
    }
}
